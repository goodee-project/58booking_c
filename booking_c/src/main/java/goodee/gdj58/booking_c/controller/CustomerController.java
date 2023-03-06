package goodee.gdj58.booking_c.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.CustomerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
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
