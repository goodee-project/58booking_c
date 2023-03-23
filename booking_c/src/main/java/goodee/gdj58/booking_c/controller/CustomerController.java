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
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingOption;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 예약내역 상세보기
	@GetMapping("/bookingOne")
	public String getBookingOne(Model model, Company company
								, @RequestParam(value="customerId") String customerId
								, @RequestParam(value="companyName") String companyName
								, @RequestParam(value="requestDate") String requestDate
								, @RequestParam(value="bkcId") String bkcId) {
		
		List<Map<String, Object>> list = customerService.getBookingOne(customerId, companyName, requestDate);
		List<Map<String, Object>> companyMap = customerService.getBookingCompanyDetailMap(bkcId);
		
		log.debug(FontColor.CYAN+"customerControllerId :"+customerId);
		log.debug(FontColor.CYAN+"list :"+list);
		log.debug(FontColor.CYAN+"customerControllercompanyName :"+companyName);
		log.debug(FontColor.CYAN+"customerControllerrequestDate :"+requestDate);
		log.debug(FontColor.CYAN+"customerControllercompanyMap :"+companyMap);
		
		model.addAttribute("companyMap", companyMap);
		model.addAttribute("requestDate", requestDate);
		model.addAttribute("companyName", companyName);
		model.addAttribute("list", list);
		return "customer/bookingOne";
	}
	
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
	public String updateCustomerPw(Customer customer, HttpSession session) {
		int updateRow = customerService.updateCustomerPw(customer.getCustomerEmail(), customer.getCustomerId(), customer.getCustomerPw());
		if(updateRow == 0) {
			log.debug(FontColor.CYAN+"패스워드 변경 실패");
			return "redirect:/customer/findPw";
		}
		log.debug(FontColor.CYAN+"패스워드 변경 성공");
		session.invalidate(); // 비밀번호 변경시 로그아웃 처리
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
	
	
	
	
	
	//결제 후 예약내역 등록
	@PostMapping("/customer/booking/addBooking")
	public String addBooking(
			Model model
			, HttpSession session
			, Booking booking
			, @RequestParam (value = "customerId") String customerId
			, @RequestParam (value = "bkcId") String bkcId
			, @RequestParam (value = "dates") String dates
			, @RequestParam (value = "bkpNo") int bkpNo
			, @RequestParam (value = "bkpPrice") int bkpPrice
			, @RequestParam (value = "point") int point
			, @RequestParam (value = "bkpRankDiscount") int bkpRankDiscount
			, @RequestParam (value = "finalCount") int finalCount
			, @RequestParam (value = "bookingPeople") int bookingPeople
			, @RequestParam (value = "option") ArrayList<Integer> bkpoNo
			, @RequestParam (value = "optionSize") int optionSize
			, @RequestParam (value = "dayList") ArrayList<String> dayList
			, @RequestParam (value = "productTime") String productTime
			, @RequestParam (value = "havePoint") int havePoint
			, @RequestParam (value = "bkpName") String bkpName
			)
	{

		log.debug(FontColor.RED + productTime+ "<---productTime");
		log.debug(FontColor.RED + dayList+ "<---bookingDayList addBooking");
		
		int remainPoint = havePoint - point;
		
		booking.setCustomerId(customerId);
		booking.setCompanyId(bkcId);
		booking.setProductNo(bkpNo);
		booking.setPrice(bkpPrice);
		booking.setUsePoint(point);
		booking.setRankDiscount(bkpRankDiscount);
		booking.setTotalPrice(finalCount);
		booking.setBookingPeople(bookingPeople);
		log.debug(FontColor.RED+bkpoNo.get(0)+"<----optionNo ---1");

		for(int j=0; j<dayList.size(); j++)
		{
			String bookingDay = dayList.get(j) +" "+ productTime;
			booking.setRequestDate(bookingDay);
			log.debug(FontColor.RED + bookingDay+ "<---bookingDay");
			if(bkpoNo == null || bkpoNo.get(0)==0)
			{
				log.debug(FontColor.RED + "<---bkpoNo null if문 진입");
				booking.setOptionNo(0);
				
				customerService.addBooking(booking, customerId,remainPoint);
				Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
				loginCustomer.setCustomerPoint(remainPoint);
				session.setAttribute("loginCustomer", loginCustomer);

			}
			
			else 
			{
				
				for(int i=0; i<optionSize; i++)
				{
					
					log.debug(FontColor.RED + bkpoNo+ "<---bkpoNo");
					int optionNo = (int)(bkpoNo.get(i));
					booking.setOptionNo(optionNo);
					customerService.addBooking(booking, customerId,remainPoint);
					Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
					loginCustomer.setCustomerPoint(remainPoint);
					session.setAttribute("loginCustomer", loginCustomer);

				}
			}
		
		}
		
		//상품 이미지 출력
		List<Map<String, Object>> bookingAfterProductImg = customerService.bookingAfterProductImg(bkcId, bkpNo);
		log.debug(FontColor.RED+bkcId +"<----bkcId ");
		log.debug(FontColor.RED+bkpNo +"<----bkpNo ");
		log.debug(FontColor.RED+bookingAfterProductImg +"<----bookingAfterProductImg ");
		model.addAttribute("bookingAfterProductImg", bookingAfterProductImg);
		model.addAttribute("bkpName", bkpName);

		return "customer/booking/bookingSuccessAddBooking";
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
			, @RequestParam (value = "option", defaultValue = "" ) ArrayList<Integer> option
			, @RequestParam (value = "bkpMax") int bkpMax
			, @RequestParam (value = "bkpNo") int bkpNo

			)
	{
		
		
		
		//날짜형 예약시 날짜 일 수 계산
		if(dates.length()>10)
		{
			
			String startDate = dates.substring(0,10);
			String endDate = dates.substring(13,23);
	
			log.debug(FontColor.RED +startDate + "<---startDate");
			log.debug(FontColor.RED +endDate + "<---endDate");
			
			//int dayCalculation = customerService.dayCalculation(startDate, endDate);
			//log.debug(FontColor.RED +dayCalculation + "<---dayCalculation");
			
			List<Map<String,Object>> bookingDayList = customerService.bookingDayList(startDate, endDate);
			log.debug(FontColor.RED +bookingDayList + "<---bookingDayList");
			
			model.addAttribute("bookingDayList",bookingDayList);
		}
		
		
		log.debug(FontColor.RED + option.size() + "<---option");
		
		int optionSize = option.size();
		
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
		log.debug(FontColor.RED+loginCustomer.getCustomerRank()+"<---고객 랭크");
		
		String rank = loginCustomer.getCustomerRank();
		int rankDiscount = 0; 
		
		if(rank.equals("브론즈"))
		{
			log.debug(FontColor.RED+"<--- 브론즈 if문 들어옴");
			rankDiscount = (int)(Integer.parseInt(bkpPrice) * 0.99);
			log.debug(FontColor.RED+rankDiscount+"<--- if함수 안 랭크 할인 가격");
		}
		else if(rank.equals("실버"))
		{
			log.debug(FontColor.RED+"<--- 실버 if문 들어옴");
			rankDiscount = (int)(Integer.parseInt(bkpPrice) * 0.98);
			log.debug(FontColor.RED+rankDiscount+"<--- if함수 안 랭크 할인 가격");
		}
		else if(rank.equals("골드"))
		{
			log.debug(FontColor.RED+"<--- 골드 if문 들어옴");
			rankDiscount = (int)(Integer.parseInt(bkpPrice) * 0.97);
			log.debug(FontColor.RED+rankDiscount+"<--- if함수 안 랭크 할인 가격");
		}
		log.debug(FontColor.RED+bkpPrice+"<---상품 가격");
		log.debug(FontColor.RED+rankDiscount+"<---랭크 할인 가격");
		
		//옵션 리스트
		List<BookingOption> bookingOptionList = customerService.bookingOptionList();
		
		//기업 정보
		Map<String,Object> bookingPaymentCompany = customerService.bookingPaymentCompany(bkcId);
		
		int optionPrice = customerService.totalOptionPrice(bkpNo, option);
		model.addAttribute("loginCustomer",loginCustomer);
		model.addAttribute("bookingPaymentCompany",bookingPaymentCompany);
		model.addAttribute("rankDiscount",rankDiscount);
		model.addAttribute("bkpPrice",bkpPrice);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkpNo",bkpNo);
		model.addAttribute("bkpoName",bkpoName);
		model.addAttribute("bkpName",bkpName);
		model.addAttribute("qtyInput",qtyInput);
		model.addAttribute("dates",dates);
		model.addAttribute("productTime",productTime);
		model.addAttribute("optionPrice",optionPrice);
		model.addAttribute("option",option);
		model.addAttribute("optionSize",optionSize);
		//model.addAttribute("bookingDayList",bookingDayList);
		model.addAttribute("bookingOptionList",bookingOptionList);
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
