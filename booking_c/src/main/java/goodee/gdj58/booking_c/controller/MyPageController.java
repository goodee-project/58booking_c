package goodee.gdj58.booking_c.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.MyPageService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.PaySaveHistory;
import goodee.gdj58.booking_c.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	@Autowired MyPageService myPageService;
	// 페이 충전
	@PostMapping("/customer/pay/insertPay")
	public String insertPay(HttpSession session, PaySaveHistory paySaveHistory) {
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "content : " + paySaveHistory.getPaySaveHistoryContent());
		// 테스트용
		String customerId = "cus1";
		
		paySaveHistory.setPaySaveHistoryCategory("충전");
		paySaveHistory.setCustomerId(customerId);
		
		int row = myPageService.insertPay(paySaveHistory);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "페이 충전 실패");
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
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "priceState : " + priceState);
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		
		// 테스트용
		String customerId = "cus1";
		
		// 페이 리스트
		List<Map<String, Object>> payList = myPageService.payList(customerId, priceState, currentPage, rowPerPage);
		
		// 데이터 개수
		int payCnt = myPageService.payCnt(customerId, priceState);
		
		// 현재 보유 페이
		Map<String, Object> customerOne = myPageService.customerOne(customerId);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("payList", payList);
		model.addAttribute("customerOne", customerOne);
		model.addAttribute("priceState", priceState);
		
		return "customer/myPage/payList";
	}
	
	// 예약 + 이벤트 관련 포인트 리스트
	@GetMapping("/customer/point/pointList")
	public String pointList(Model model
						, HttpSession session
						, @RequestParam(value = "pointState", defaultValue = "") String pointState
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "pointState : " + pointState);
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		
		// 테스트용
		String customerId = "cus1";
		
		// 포인트 리스트 
		List<Map<String, Object>> pointList = myPageService.pointList(customerId, pointState, currentPage, rowPerPage);
		
		// 사용가능 포인트
		Map<String, Object> customerOne = myPageService.customerOne(customerId);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("pointList", pointList);
		model.addAttribute("customerOne", customerOne);
		model.addAttribute("pointState", pointState);
		
		return "customer/myPage/pointList";
	}
	
	// 리뷰 리스트
	@GetMapping("/customer/review/reviewList")
	public String reviewList(Model model
						, HttpSession session
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		
		// 테스트용
		String customerId = "cus1";
				
		// 리뷰 리스트
		List<Map<String, Object>> reviewList = myPageService.reviewList(customerId, currentPage, rowPerPage);
		
		// 데이터 개수
		int reviewCnt = myPageService.reviewCnt(customerId);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("reviewList", reviewList);
		
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
							, @RequestParam(value = "bookingState", defaultValue = "") String bookingState) {
		
		// 고객 로그인
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		log.debug(FontColor.YELLOW + "state : " + bookingState);
		
		// 테스트용
		String customerId = "cus1";
		
		// 예약 리스트
		List<Map<String, Object>> bookingList = myPageService.bookingList(customerId, bookingState, currentPage, rowPerPage);
		
		// 데이터 개수
		int cnt = myPageService.bookingCnt(customerId, bookingState);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("bookingList", bookingList);
		
		return "customer/myPage/bookingList";
	}
	
	// 고객 내정보 상세
	@GetMapping("/customer/myPage/customerOne")
	public String customerOne(Model model, HttpSession session) {
		// 고객 로그인
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 테스트용
		String customerId = "cus1";
		
		Map<String, Object> customerOne = myPageService.customerOne(customerId);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/customerOne";
	}
	
	// 고객 마이페이지 메인
	@GetMapping("/customer/myPage/myPageMain")
	public String myPageMain(Model model, HttpSession session) {
		// 고객 로그인
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 테스트용
		String customerId = "cus1";
		
		Map<String, Object> customerOne = myPageService.customerOne(customerId);
		
		// 데이터 담아서 view에서 출력
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/myPageMain";
	}
}