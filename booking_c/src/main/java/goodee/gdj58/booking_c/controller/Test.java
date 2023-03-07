package goodee.gdj58.booking_c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class Test {
	@GetMapping("/address") 
	public String address() {
		System.out.println("카카오 API");
		
		return "customer/booking/addressTest";
	}
}
