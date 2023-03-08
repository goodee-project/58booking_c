package goodee.gdj58.booking_c.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.MailSendService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MailSendRestController {
	@Autowired MailSendService mailSendService;
	
	@GetMapping("/log/emailCk")
	public String emailCk(@RequestParam(value="customerEmail") String customerEmail) {
		log.debug("\u001B[36m"+"이메일요청 : "+customerEmail);
		return mailSendService.makeEmail(customerEmail);
	}
}
