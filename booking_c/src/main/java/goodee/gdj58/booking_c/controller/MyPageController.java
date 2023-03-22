package goodee.gdj58.booking_c.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.booking_c.service.BookingService;
import goodee.gdj58.booking_c.service.MyPageService;
import goodee.gdj58.booking_c.service.PayPointService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.PaySaveHistory;
import goodee.gdj58.booking_c.vo.PointSaveHistory;
import goodee.gdj58.booking_c.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	@Autowired MyPageService myPageService;
	@Autowired BookingService bookingService;
	@Autowired PayPointService payPointService;
	
	// 고객 정보(사진) 수정
	@PostMapping("/customer/myPage/updateCustomerOne")
	public String updateCustomerOne(HttpSession session
								, HttpServletRequest request
								, Customer customer
								, @RequestParam("file") MultipartFile file
								, @RequestParam("fileName") String fileName) {
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			// 경로
			String path = request.getServletContext().getRealPath("/upload/");
			
			new File(path + request.getParameter("")).delete();
			
			// 프로필 사진 수정용
			String fileRealName = file.getOriginalFilename(); // 파일명
			String kind = file.getContentType(); // 파일종류
			long fileSize = file.getSize(); // 파일사이즈
			
			// 디버깅
			log.debug(FontColor.YELLOW + "fileRealName : " + fileRealName);

			// 고유 랜덤 문자 생성
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			
			// 경로에 사진 업로드
			File saveFile = new File(path + "\\" + uniqueName + fileRealName);
			
			try {
				// 실제 저장 메서드
				file.transferTo(saveFile);
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e1) {
				e1.printStackTrace();
			}
			
			// 기존 파일 삭제
			new File(path + "\\" + fileName).delete();
			
			String saveName = uniqueName + fileRealName;
			
			// 사진 vo에 저장
			CustomerImg img = new CustomerImg();
			img.setCustomerId(customer.getCustomerId());
			img.setCustomerImgKind(kind);
			img.setCustomerImgOriginName(fileRealName);
			img.setCustomerImgSaveName(saveName);
			img.setCustomerImgSize(fileSize);
			
			int row = myPageService.updateCustomerOne(customer, img);
			if (row == 0) {
				log.debug(FontColor.YELLOW + "정보 수정 실패");
			}
		}
		
		return "redirect:/customer/myPage/customerOne";
	}
	
	// 회원 탈퇴
	@GetMapping("/customer/myPage/deactiveCustomer")
	public String deactiveCustomer(HttpSession session, Model model) {
		
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		
		Map<String, Object> customerOne = myPageService.customerOne(customer.getCustomerId());
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/deactiveCustomer";
	}
	
	@PostMapping("/customer/myPage/deactiveCustomer")
	public String deactiveCustomer(RedirectAttributes redirectAttr, Customer customer, PaySaveHistory paySaveHistory) {

		int row = myPageService.deactiveCustomer(customer, paySaveHistory);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "회원 탈퇴 실패");
			redirectAttr.addFlashAttribute("msg", "탈퇴에 실패했습니다");
			return "redirect:/customer/myPage/deactiveCustomer";
		}
		
		return "redirect:/log/loginCustomer"; // 메인화면으로 이동
	}
	
	// 예약 취소 상태 변경
	@PostMapping("/customer/booking/updateBooking")
	public String bookingCancel(HttpSession session, Booking booking, BookingCancel bookingCancel) {
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		
		booking.setCustomerId(customer.getCustomerId());
		
		PointSaveHistory pointSaveHistory = new PointSaveHistory();
		pointSaveHistory.setPointSaveHistoryCategory("예약취소");
		pointSaveHistory.setPointSaveHistoryContent(booking.getBookingNo());
		pointSaveHistory.setCustomerId(customer.getCustomerId());
		pointSaveHistory.setPoint(booking.getUsePoint());
		
		PaySaveHistory paySaveHistory = new PaySaveHistory();
		paySaveHistory.setPaySaveHistoryCategory("예약취소");
		paySaveHistory.setPaySaveHistoryContent(booking.getBookingNo());
		paySaveHistory.setCustomerId(customer.getCustomerId());
		paySaveHistory.setPrice(booking.getTotalPrice());
		
		// 예약 취소
		int row = bookingService.bookingCancel(booking, bookingCancel, pointSaveHistory, paySaveHistory);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "예약 취소 실패");
		} else {
			log.debug(FontColor.YELLOW + "예약 취소 성공");
		}
		
		return "redirect:/customer/booking/bookingList";
	}
	
	// 페이 충전
	@PostMapping("/customer/pay/insertPay")
	public String insertPay(HttpSession session
						, RedirectAttributes redirectAttr
						, PaySaveHistory paySaveHistory
						, @RequestParam(value = "state") String state
						, HttpServletRequest request) {
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "content : " + paySaveHistory.getPaySaveHistoryContent());

		paySaveHistory.setPaySaveHistoryCategory("충전");
		paySaveHistory.setCustomerId(customer.getCustomerId());
		
		int row = payPointService.insertPay(paySaveHistory);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "페이 충전 실패");
			redirectAttr.addFlashAttribute("msg", "페이 충전에 실패했습니다");
			return "redirect:/customer/pay/payList";
		}
		
		log.debug(FontColor.YELLOW + "페이 충전 성공");

		return "redirect:/customer/pay/payList";
		
	}
	
	// 예약 + 충전 관련 페이 리스트
	@GetMapping("/customer/pay/payList")
	public String payList(Model model
						, HttpSession session
						, @RequestParam(value = "priceState", defaultValue = "") String priceState
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "15") int rowPerPage) {
		
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "priceState : " + priceState);
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		
		// 페이 리스트
		List<Map<String, Object>> payList = myPageService.payList(customer.getCustomerId(), priceState, currentPage, rowPerPage);
		
		// 데이터 개수
		int payCnt = myPageService.payCnt(customer.getCustomerId(), priceState);
		
		log.debug(FontColor.YELLOW + "payCnt : " + payCnt);
		
		// 현재 보유 페이
		Map<String, Object> customerOne = myPageService.customerOne(customer.getCustomerId());
		
		// 페이징
		int lastPage = payCnt / rowPerPage;
		if(payCnt % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 5;
		int startPage = (((currentPage - 1) / showPage) * showPage) + 1;
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage;
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		boolean prev = (currentPage == 1) ? false : true; 
		boolean next = (endPage == lastPage) ? false : true; 
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("payList", payList);
		model.addAttribute("customerOne", customerOne);
		model.addAttribute("priceState", priceState);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return "customer/myPage/payList";
	}
	
	// 예약 + 이벤트 관련 포인트 리스트
	@GetMapping("/customer/point/pointList")
	public String pointList(Model model
						, HttpSession session
						, @RequestParam(value = "pointState", defaultValue = "") String pointState
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "15") int rowPerPage) {
		
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "pointState : " + pointState);
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);

		// 포인트 리스트 
		List<Map<String, Object>> pointList = myPageService.pointList(customer.getCustomerId(), pointState, currentPage, rowPerPage);
		
		// 데이터 개수
		int pointCnt = myPageService.pointCnt(customer.getCustomerId(), pointState);
		
		// 사용가능 포인트
		Map<String, Object> customerOne = myPageService.customerOne(customer.getCustomerId());
		
		// 페이징
		int lastPage = pointCnt / rowPerPage;
		if(pointCnt % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 5;
		int startPage = (((currentPage - 1) / showPage) * showPage) + 1;
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage;
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		boolean prev = (currentPage == 1) ? false : true; 
		boolean next = (endPage == lastPage) ? false : true; 
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("pointList", pointList);
		model.addAttribute("customerOne", customerOne);
		model.addAttribute("pointState", pointState);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return "customer/myPage/pointList";
	}
	
	// 리뷰 리스트
	@GetMapping("/customer/review/reviewList")
	public String reviewList(Model model
						, HttpSession session
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
				
		// 리뷰 리스트
		List<Map<String, Object>> reviewList = myPageService.reviewList(customer.getCustomerId(), currentPage, rowPerPage);
		
		// 데이터 개수
		int reviewCnt = myPageService.reviewCnt(customer.getCustomerId());
		
		log.debug(FontColor.YELLOW + "reviewCnt : " + reviewCnt);
		
		// 페이징
		int lastPage = reviewCnt / rowPerPage;
		if(reviewCnt % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 5;
		int startPage = (((currentPage - 1) / showPage) * showPage) + 1;
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage;
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		boolean prev = (currentPage == 1) ? false : true; 
		boolean next = (endPage == lastPage) ? false : true; 
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return "customer/myPage/reviewList";
	}
	
	// 예약에 대한 신고
	@PostMapping("/customer/booking/insertReport")
	public String insertReport(Report report) {
		
		int row = myPageService.insertReport(report);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "신고 접수 실패");
		}
		
		return "redirect:/customer/myPage/bookingList";
	}
	
	// 예약내역 리스트
	@GetMapping("/customer/booking/bookingList")
	public String bookingList(Model model
							, HttpSession session
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "bookingState", defaultValue = "") String bookingState
							, @RequestParam(value = "dateSort", defaultValue = "DESC") String dateSort) {
		
		// 고객 로그인
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));

		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		log.debug(FontColor.YELLOW + "state : " + bookingState);
		
		// 예약 리스트
		List<Map<String, Object>> bookingList = myPageService.bookingList(customer.getCustomerId(), bookingState, dateSort, currentPage, rowPerPage);

		// 데이터 개수
		int bookingCnt = myPageService.bookingCnt(customer.getCustomerId(), bookingState);
		
		log.debug(FontColor.YELLOW + "bookingCnt : " + bookingCnt);
		
		// 페이징
		int lastPage = bookingCnt / rowPerPage;
		if(bookingCnt % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 5; // < 1 2 3 4 5 > 가운데에 들어갈 숫자 개수
		int startPage = (((currentPage - 1) / showPage) * showPage) + 1; // 시작 페이지
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage; // < 1 2 3 4 5 >에서 5에 해당
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		boolean prev = (currentPage == 1) ? false : true; // 이전 버튼 활성화
		boolean next = (endPage == lastPage) ? false : true; // 다음 버튼 활성화
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerId", customer.getCustomerId());
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("bookingState", bookingState);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("dateSort", dateSort);
		
		return "customer/myPage/bookingList";
	}
	
	// 고객 내정보 상세
	@GetMapping("/customer/myPage/customerOne")
	public String customerOne(Model model, HttpSession session) {
		// 고객 로그인
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		
		Map<String, Object> customerOne = myPageService.customerOne(customer.getCustomerId());
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/customerOne";
	}
	
	// 고객 마이페이지 메인
	@GetMapping("/customer/myPage/myPageMain")
	public String myPageMain(Model model, HttpSession session) {
		// 고객 로그인
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		
		Map<String, Object> customerOne = myPageService.customerOne(customer.getCustomerId());
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/myPageMain";
	}
}
