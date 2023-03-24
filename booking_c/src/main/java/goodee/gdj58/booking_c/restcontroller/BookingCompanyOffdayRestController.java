package goodee.gdj58.booking_c.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.BookingCompanyOffdayService;
import goodee.gdj58.booking_c.util.FontColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class BookingCompanyOffdayRestController {
	@Autowired BookingCompanyOffdayService bookingCompanyOffdayService;
	
	@GetMapping("/customer/booking/bkcOffdayCheck")
	public String bkcOffdayCheck(
									@RequestParam(value = "bkcId") String bkcId
								  , @RequestParam(value = "dates") String dates
								)
	{
		log.debug(FontColor.RED+bkcId+"<---bkcId");
		log.debug(FontColor.RED+dates+"<---dates");
		return bookingCompanyOffdayService.bkcOffdayList(bkcId, dates);
	}
}
