package goodee.gdj58.booking_c.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.IdService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CustomerRestContorller {
	@Autowired IdService idService;
	
	@GetMapping("/customer/idck")
	public String idck(@RequestParam(value="checkId") String checkId) {
		log.debug("\u001B[36m"+checkId+"<--checkId값");
		return idService.getIdCheck(checkId);
	}
}
