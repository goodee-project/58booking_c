package goodee.gdj58.booking_c.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.customer.BookingCompanyOffdayMapper;

@Service
@Transactional
public class BookingCompanyOffdayService {
	@Autowired private BookingCompanyOffdayMapper bookingCompanyOffdayMapper; 
	
	public String bkcOffdayList(String bkcId, String dates)
	{
		String result = "no";
		List<String> bkcOffday = bookingCompanyOffdayMapper.bookingCompanyOffday(bkcId);
		if(bkcOffday.get(0) == dates)
		{
			result = "yes";
		}
		return result;
	}
	
}
