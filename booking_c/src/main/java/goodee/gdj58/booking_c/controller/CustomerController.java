package goodee.gdj58.booking_c.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import goodee.gdj58.booking_c.service.CustomerService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	// 고객 비밀번호 수정
	@GetMapping("/log/modifyPw")
	public String findCustomerPw(Model model
									, @RequestParam(value="email") String email
									, @RequestParam(value="id") String id) {
		log.debug(FontColor.CYAN+"requestEmail :"+email);
		log.debug(FontColor.CYAN+"requestId :"+id);
		
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		
		return "customer/modifyPw";
	}
	@PostMapping("/log/modifyPw")
	public String updateCustomerPw(Customer customer) {
		int updateRow = customerService.updateCustomerPw(customer.getCustomerEmail(), customer.getCustomerId(), customer.getCustomerPw());
		if(updateRow == 0) {
			log.debug(FontColor.CYAN+"패스워드 변경 실패");
			return "redirect:/customer/findPw";
		}
		log.debug(FontColor.CYAN+"패스워드 변경 성공");
		return "redirect:/log/loginCustomer";
	}
	
	// 고객 비밀번호 찾기
	@GetMapping("/log/findPw")
	public String findCustomerPw() {
		return "customer/findPw";
	}
	
	// 고객 아이디 찾기
	@GetMapping("/log/findId")
	public String findCustomerId() {
		return "customer/findId";
	}
	
	// 고객 로그아웃
	@GetMapping("/customer/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/log/loginCustomer";
	}
	
	// 고객 로그인
	@GetMapping("/log/loginCustomer")
	public String loginCustomer() {
		return "customer/loginCustomer";
	}
	@PostMapping("/log/loginCustomer")
	public String loginCustomer(Customer customer, HttpSession session) {
		Customer loginCustomer = customerService.loginCustomer(customer);
		String loginCustomerId = customer.getCustomerId();
		
		if(loginCustomer == null) {
			log.debug(FontColor.CYAN+"로그인실패");
			return "customer/loginCustomer";
		}
		log.debug(FontColor.CYAN+"로그인 성공 ID : "+loginCustomerId);
		
		session.setAttribute("loginCustomer", loginCustomer);
		
		// return "redirect:/customer/booking/bookingCompanyList";
		return "redirect:/customer/booking/bookingCompanyList";
	}
	
	// 고객 회원가입
	@GetMapping("/log/addCustomer")
	public String addCustomer() {
		return "customer/addCustomer";
	}
	@PostMapping("/log/addCustomer")
	public String addCustomer(Model model
								, Customer customer
								, HttpServletRequest request
								, @RequestParam("file") MultipartFile file) {	
		log.debug(FontColor.CYAN+"custoer"+customer.toString());
		
		// 서비스에서 트랜잭션 처리하도록 코드 수정해야함
		// 파일명을 얻어낼 수 있는 메서드!
		String fileRealName = file.getOriginalFilename();
		String fileKind = file.getContentType(); // kind
		long size = file.getSize(); // 파일 사이즈
		
		log.debug(FontColor.CYAN+fileRealName+"<--fileRealName값");
		log.debug(FontColor.CYAN+fileKind+"<--fileKind값");
		log.debug(FontColor.CYAN+size+"<--size값");
		
		// 이미지 저장경로, 확장자
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		// 경로
		String path = request.getServletContext().getRealPath("/upload/");
		log.debug(FontColor.CYAN+"확장자명" + fileExtension);
		log.debug(FontColor.CYAN+"업로드 경로" + path);
	
		// 랜덤문자열 생성
		UUID uuid = UUID.randomUUID();
		log.debug(uuid.toString());
		
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		log.debug(FontColor.CYAN+"생성된 고유문자열" + uniqueName);
		
		// 파일 경로에 저장
		File saveFile = new File(path+"\\"+uniqueName + fileExtension); 
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		// 업로드 파일을 customerImg 타입에 저장
		String saveName = uniqueName + fileRealName;
		log.debug("saveName : "+saveName);
				
		CustomerImg cImg = new CustomerImg();
		cImg.setCustomerImgOriginName(fileRealName);
		cImg.setCustomerImgSaveName(saveName);
		cImg.setCustomerImgKind(fileKind);
		cImg.setCustomerImgSize(size);
		cImg.setCustomerId(customer.getCustomerId());
		
		// 1. totalId DB 저장
		int totalRow = customerService.insertTotalId(customer.getCustomerId());
		if(totalRow == 0) {
			log.debug(FontColor.CYAN+"시스템 에러로 totalId 등록 실패");
			return "costomer/addCustomer";
		}
		log.debug(FontColor.CYAN+totalRow+"<--totalRow값");
		
		// 2. customer DB 저장
		int cusRow = customerService.insertCustomer(customer);
		if(cusRow == 0) {
			log.debug(FontColor.CYAN+"시스템 에러로 customer 등록 실패");
			return "costomer/addCustomer";
		}
		log.debug(FontColor.CYAN+cusRow+"<--cusRow값");
		
		// 3. customerImg DB 저장
		int imgRow = customerService.insertCustomerImg(cImg);
		if(imgRow == 0) {
			log.debug(FontColor.CYAN+"시스템 에러로 img 등록 실패");
			return "costomer/addCustomer";
		}
		log.debug(FontColor.CYAN+imgRow+"<--imgRow값");
		
		return "/customer/loginCustomer";
	}
	
	
	
	
	
	//결제페이지
	@PostMapping("/customer/booking/bookingProductPayment")
	public String bookingProductProductPayment(Model model
			, HttpSession session
			, HttpServletRequest request
			, @RequestParam (value = "bkpPrice") String bkpPrice
			, @RequestParam (value = "bkcId") String bkcId
			, @RequestParam (value = "bkpoName") String bkpoName
			, @RequestParam (value = "bkpName") String bkpName
			, @RequestParam (value = "qtyInput") int qtyInput
			, @RequestParam (value = "dates") String dates
			, @RequestParam (value = "productTime", defaultValue = "") String productTime
			, @RequestParam (value = "option", defaultValue = "0") ArrayList<Integer> option
			, @RequestParam (value = "bkpMax") int bkpMax
			)
	{
		//에약인원 초과시 이전페이지로 redirect
		String referer = request.getHeader("Referer");
		String msg = null;
		if(qtyInput>bkpMax)
		{
			msg="fail";
			return "redirect:" + referer+"&msg="+msg;
		}
		
		//고객 세션정보
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		//기업 정보
		Map<String,Object> bookingPaymentCompany = customerService.bookingPaymentCompany(bkcId);
		
		int optionPrice = option.stream().mapToInt(Integer::intValue).sum();
		model.addAttribute("loginCustomer",loginCustomer);
		model.addAttribute("bookingPaymentCompany",bookingPaymentCompany);
		model.addAttribute("bkpPrice",bkpPrice);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkpoName",bkpoName);
		model.addAttribute("bkpName",bkpName);
		model.addAttribute("qtyInput",qtyInput);
		model.addAttribute("dates",dates);
		model.addAttribute("productTime",productTime);
		model.addAttribute("optionPrice",optionPrice);
		return "customer/booking/bookingProductPayment";
	}
	
	//예약기간+옵션 선택 페이지
	@GetMapping("/customer/booking/bookingProductSelectTime")
	public String bookingProductSelectTime(Model model
			, HttpSession session
			, @RequestParam(value = "bkcId") String bkcId
			, @RequestParam(value = "bkcName") String bkcName
			, @RequestParam(value = "bkctNo") int bkctNo
			, @RequestParam(value = "bkpName") String bkpName
			, @RequestParam(value = "msg", defaultValue = "") String msg
			)
	{
		//로그인 세션
		/*
		if((Customer)session.getAttribute("loginCustomer") == null)
		{
			return "redirect:/log/loginCustomer";
		}
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		log.debug(FontColor.RED + loginCustomer.getCustomerId()  + "고객 ID");
		 */
		
		log.debug(FontColor.RED +msg + "msg값");
		
		//예약시 상품 시간 리스트
		List<Map<String, Object>> bookingProductTimeList= customerService.getBookingProductTimeList(bkcId);
		
		//예약 상품 정보
		Map<String,Object> bookingProductInfo = customerService.bookingProductInfo(bkpName, bkcId);
		
		//예약상품 옵션 리스트
		List<Map<String, Object>> bookingProductOptionList= customerService.getBookingProductOptionList(bkpName,bkcId);
		
		//예약업체별 시간or날짜 선택 
		List<Map<String, Object>> bookingProductSelectTime = customerService.getBookingProductSelectTime(bkcId);
		
		log.debug(FontColor.RED + bookingProductSelectTime  + "값확인");
		
		model.addAttribute("bookingProductTimeList",bookingProductTimeList);
		model.addAttribute("bookingProductInfo",bookingProductInfo);
		model.addAttribute("bookingProductOptionList",bookingProductOptionList);
		model.addAttribute("bookingProductSelectTime",bookingProductSelectTime);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkcName",bkcName);
		model.addAttribute("bkctNo",bkctNo);
		model.addAttribute("bkpName",bkpName);
		model.addAttribute("msg",msg);
		
		return "customer/booking/bookingProductSelectTime";
	}
	
	//예약업체 세부사항 공통 + 지도 내용
	@GetMapping("/customer/booking/bookingCompanyDetailMap")
	public String bookingCompanyDetailMap(Model model
			, @RequestParam(value = "bkcId") String bkcId
			, @RequestParam(value = "bkciLevel", defaultValue = "") String bkciLevel)
	{
		List<Map<String, Object>> bookingCompanyDetailCommon = customerService.getBookingCompanyDetailCommon(bkcId, bkciLevel);
		List<Map<String, Object>> bookingCompanyDetailMap = customerService.getBookingCompanyDetailMap(bkcId);
		model.addAttribute("bookingCompanyDetailCommon",bookingCompanyDetailCommon);
		model.addAttribute("bookingCompanyDetailMap",bookingCompanyDetailMap);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkciLevel",bkciLevel);
		return "customer/booking/bookingCompanyDetailMap";
	}
	
	//예약업체 세부사항 공통 + 리뷰 내용
	@GetMapping("/customer/booking/bookingCompanyDetailReview")
	public String bookingCompanyDetailReview(Model model
			, @RequestParam(value = "bkcId") String bkcId
			, @RequestParam(value = "bkciLevel", defaultValue = "") String bkciLevel

			)
	{
		List<Map<String, Object>> bookingCompanyDetailCommon = customerService.getBookingCompanyDetailCommon(bkcId, bkciLevel);
		List<Map<String, Object>> bookingCompanyDetailReview = customerService.getBookingCompanyDetailReview(bkcId);
		model.addAttribute("bookingCompanyDetailCommon",bookingCompanyDetailCommon);
		model.addAttribute("bookingCompanyDetailReview",bookingCompanyDetailReview);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkciLevel",bkciLevel);
		return "customer/booking/bookingCompanyDetailReview";
	}
	
	//예약업체 세부사항 공통 + 예약 내용
	@GetMapping("/customer/booking/bookingCompanyDetailBooking")
	public String bookingCompanyDetailBooking(Model model
											, @RequestParam(value = "bkcId") String bkcId
											, @RequestParam(value = "bkciLevel", defaultValue = "") String bkciLevel)
	{
		List<Map<String, Object>> bookingCompanyDetailCommon = customerService.getBookingCompanyDetailCommon(bkcId, bkciLevel);
		List<Map<String, Object>> bookingCompanyDetailBooking = customerService.getBookingCompanyDetailBooking(bkcId);
		model.addAttribute("bookingCompanyDetailCommon",bookingCompanyDetailCommon);
		model.addAttribute("bookingCompanyDetailBooking",bookingCompanyDetailBooking);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkciLevel",bkciLevel);
		return "customer/booking/bookingCompanyDetailBooking";
	}
	
	//에약업체 세부사항 공통 + 홈 내용
	@GetMapping("/customer/booking/bookingCompanyDetailHome")
	public String bookingCompanyDetailHome(Model model
										, @RequestParam(value = "bkcId") String bkcId
										, @RequestParam(value = "bkciLevel", defaultValue = "") String bkciLevel) 
	{
		List<Map<String, Object>> bookingCompanyDetailCommon = customerService.getBookingCompanyDetailCommon(bkcId, bkciLevel);
		List<Map<String, Object>> bookingCompanyDetailHome = customerService.getBookingCompanyDetailHome(bkcId);
		//홈 내용 추가 예정
		model.addAttribute("bookingCompanyDetailCommon",bookingCompanyDetailCommon);
		model.addAttribute("bookingCompanyDetailHome",bookingCompanyDetailHome);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkciLevel",bkciLevel);
		
		return "customer/booking/bookingCompanyDetailHome";
	}
	
	
	//예약업체 리스트 출력
	@GetMapping("/customer/booking/bookingCompanyList")
	public String getBookingCompanyList(Model model
										, @RequestParam(value = "searchWord", defaultValue = "") String searchWord 
										, @RequestParam(value = "optionWord", defaultValue = "") String optionWord 
										, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
										, @RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage
										)
	{
		
		int firstPage = 1;
		int totalCount = customerService.bookingCompanyCount(searchWord);
		int lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0)
		{
			lastPage = lastPage+1;
		}
		List<Map<String, Object>> bookingCompanyList = customerService.getBookingCompanyList(currentPage, rowPerPage, searchWord, optionWord);
		
		model.addAttribute("bookingCompanyList",bookingCompanyList );
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("optionWord",optionWord);
		return "customer/booking/bookingCompanyList";
	}
}
