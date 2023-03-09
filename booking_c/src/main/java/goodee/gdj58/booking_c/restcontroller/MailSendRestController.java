package goodee.gdj58.booking_c.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.CustomerService;
import goodee.gdj58.booking_c.service.MailSendService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MailSendRestController {
	@Autowired MailSendService mailSendService;
	@Autowired CustomerService customerService;
	// 이메일 인중 후 아이디 조회
	@PostMapping("/log/findCustomerId")
	public String findCompanyId(
				@RequestParam(value="customerEmail") String customerEmail,
				@RequestParam(value="customerName") String customerName) {
		
		log.debug(FontColor.CYAN+"customerEmail : "+customerEmail);
		log.debug(FontColor.CYAN+"customerName : "+customerName);
		
		String id = customerService.getCustomerId(customerEmail, customerName);
		
		return id;
	}
	@GetMapping("/beforeLogin/emailCk")
	public String emailCk(
				@RequestParam(value="customerEmail1") String customerEmail1,
				@RequestParam(value="customerEmail2") String customerEmail2,
				@RequestParam(value="customerName", required=false) String customerName,
				@RequestParam(value="customerId", required=false) String customerId) {
		
		log.debug(FontColor.CYAN+"customerEmail1 : "+customerEmail1);
		log.debug(FontColor.CYAN+"customerEmail2 : "+customerEmail2);
		log.debug(FontColor.CYAN+"customerName : "+customerName);
		log.debug(FontColor.CYAN+"customerId : "+customerId);
		
		// 이메일 가공
		String customerEmail = customerEmail1 + "@" + customerEmail2;
		
		// 데이터 변환
		Customer customer = new Customer();
		customer.setCustomerEmail(customerEmail);
		customer.setCustomerName(customerName);
		customer.setCustomerId(customerId);
		
		// 분기(회원가입 : companyCeo&&companyId==null, 아이디/비번찾기 : 둘 중 하나만 null)
		
		// 1. 등록 이메일 존재 여부 확인
		if(customerName == null && customerId == null) {
			log.debug(FontColor.CYAN+"업체가입 진행중, 이메일 조회 안함");
		} else {
			int emailResult = customerService.getCustomerEmail(customer);
			if(emailResult == 0) {
				log.debug(FontColor.CYAN+"존재하는 이메일 없음");
				return "noResult";
			}
		}
		
		// 2. 존재 확인 후 이메일 전송(fail 또는 인증코드 반환)
		String code = mailSendService.makeEmail(customerEmail);
		log.debug(FontColor.CYAN+"code : "+code);
		
		return code;
	}
}
