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
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	@Autowired MyPageService myPageService;
	// 리뷰 리스트
	@GetMapping("customer/myPage/reviewList")
	public String reviewList(Model model
						, HttpSession session
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		
		
		return "";
	}
	
	// 예약에 대한 신고
	@PostMapping("customer/myPage/insertReport")
	public String insertReport(Report report) {
		
		int row = myPageService.insertReport(report);
		if(row == 0) {
			log.debug(FontColor.YELLOW + "신고 접수 실패");
		}
		
		return "redirect:/customer/myPage/bookingList";
	}
	
	// 예약내역 리스트
	@GetMapping("customer/myPage/bookingList")
	public String bookingList(Model model
							, HttpSession session
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "bookingState", defaultValue = "") String bookingState) {
		// Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 디버깅
		// log.debug(FontColor.YELLOW + "customerId : " + customer.getCustomerId());
		log.debug(FontColor.YELLOW + "currentPage : " + currentPage);
		log.debug(FontColor.YELLOW + "rowPerPage : " + rowPerPage);
		log.debug(FontColor.YELLOW + "state : " + bookingState);
		
		// 테스트용
		String customerId = "cus1";
		
		// 예약 리스트
		List<Map<String, Object>> bookingList = myPageService.bookingList(customerId, currentPage, rowPerPage, bookingState);
		
		// 데이터 개수
		int cnt = myPageService.bookingCnt(customerId, bookingState);
		
		model.addAttribute("bookingList", bookingList);
		
		return "customer/myPage/bookingList";
	}
	
	// 고객 내정보 상세
	@GetMapping("customer/myPage/customerOne")
	public String customerOne(Model model, HttpSession session) {
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 테스트용
		String customerId = "cus1";
		
		Map<String, Object> customerOne = myPageService.customerOne(customer);
		
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/customerOne";
	}
	
	// 고객 마이페이지 메인
	@GetMapping("customer/myPage/myPageMain")
	public String myPageMain(Model model, HttpSession session) {
		Customer customer = (Customer)(session.getAttribute("loginCustomer"));
		
		// 테스트용
		String customerId = "cus1";
		
		Map<String, Object> customerOne = myPageService.customerOne(customer);
		
		model.addAttribute("customerOne", customerOne);
		
		return "customer/myPage/myPageMain";
	}
}
