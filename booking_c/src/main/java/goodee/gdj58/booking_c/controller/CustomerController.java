package goodee.gdj58.booking_c.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.service.CustomerService;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 고객 회원가입
	@GetMapping("/customer/addCustomer")
	public String addCustomer() {
		return "customer/addCustomer";
	}
	@PostMapping("/customer/addCustomer")
	public String addCustomer(Model model, Customer customer, CustomerImg customerImg, @RequestParam("file") MultipartFile file) {	
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		String fileKind = file.getContentType(); // kind
		long size = file.getSize(); // 파일 사이즈
		
		int row = customerService.insertCustomer(customer);
		log.debug("\u001B[36m"+row+"<--row값");
		log.debug("\u001B[36m"+fileRealName+"<--fileRealName값");
		log.debug("\u001B[36m"+fileKind+"<--fileKind값");
		log.debug("\u001B[36m"+size+"<--size값");
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템 에러로 등록 실패");
			return "customer/addCustomer";
		}
		return "/customer/testPage";
	}
	
	//예약업체 리스트 출력
	@GetMapping("/customer/bookingCompanyList")
	public String getBookingCompanyList(Model model
										, @RequestParam(value = "searchWord", defaultValue = "") String searchWord )
	{
		List<Map<String, Object>> bookingCompanyList = customerService.getBookingCompanyList(searchWord);
		
		model.addAttribute("bookingCompanyList",bookingCompanyList );
		
		return "customer/bookingCompanyList";
	}
}
