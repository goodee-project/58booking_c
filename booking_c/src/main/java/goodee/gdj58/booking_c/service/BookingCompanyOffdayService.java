package goodee.gdj58.booking_c.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.customer.BookingCompanyOffdayMapper;
import goodee.gdj58.booking_c.util.FontColor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class BookingCompanyOffdayService {
	@Autowired BookingCompanyOffdayMapper bookingCompanyOffdayMapper; 
	
	public String bkcOffdayList(String bkcId, String dates)
	{
		String result = "no";
		
		List<Map<String,Object>> bkcOffdayList = bookingCompanyOffdayMapper.bookingCompanyOffday(bkcId);
		log.debug(FontColor.RED+bkcOffdayList.get(0).get("bkcOff").getClass().getName()+"<-----bkcOffday.get(0).get(bkcOff)");
		log.debug(FontColor.RED+bkcOffdayList.size()+"<-----bkcOffdayList.size()");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0; i<=bkcOffdayList.size()-1; i++)
		{
			String bkcOffday = format.format(bkcOffdayList.get(i).get("bkcOff"));
			
			if(bkcOffday.equals(dates))
			{
				result = "yes";
				return result;
			}
		}
		return result;
	}
	
}
