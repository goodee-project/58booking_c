package goodee.gdj58.booking_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.customer.CustomerMapper;

@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	
	//예약업체 리스트 출력
	public List<Map<String, Object>> getBookingCompanyList(String searchWord)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchWord", searchWord);
		return customerMapper.getBookingCompanyList(paramMap);
	}
}
