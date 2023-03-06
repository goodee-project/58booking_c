package goodee.gdj58.booking_c.mapper.customer;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;

@Mapper
public interface CustomerMapper {
	// 고객 회원가입(사진)
	public int insertCustomerImg(CustomerImg customerImg);
	// 고객 회원가입
	public int insertCustomer(Customer customer);
	//예약업체 리스트 출력
	public ArrayList<Map<String, Object>> getBookingCompanyList(Map<String, Object> paramMap);
}
