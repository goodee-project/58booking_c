package goodee.gdj58.booking_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.customer.CustomerMapper;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.TotalId;

@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	// 고객 회원가입(토탈ID)
	public int insertTotalId(String id) {
		TotalId paramTotalId = new TotalId();
		paramTotalId.setId(id);
		paramTotalId.setTotalIdKind("고객");
		paramTotalId.setTotalIdActive("활성화");
		
		return customerMapper.insertTotalId(paramTotalId);
	}
	
	// 고객 회원가입(사진)
	public int insertCustomerImg(CustomerImg customerImg) {
		return customerMapper.insertCustomerImg(customerImg);
	}
	// 고객 회원가입
	public int insertCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
	
	
	//예약업체 총 수
	public int bookingCompanyCount(String searchWord)
	{
		return customerMapper.bookingCompanyCount(searchWord);
	}
	
	//예약업체 리스트 출력
	public List<Map<String, Object>> getBookingCompanyList(int currentPage, int rowPerPage, String searchWord, String optionWord)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("optionWord", optionWord);
		return customerMapper.getBookingCompanyList(paramMap);
	}
}
