package goodee.gdj58.booking_c.mapper.customer;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.TotalId;

@Mapper
public interface CustomerMapper {
	// 고객 회원가입(토탈ID)
	public int insertTotalId(TotalId totalId);
	// 고객 회원가입(사진)
	public int insertCustomerImg(CustomerImg customerImg);
	// 고객 회원가입
	public int insertCustomer(Customer customer);
	
	//예약업체 세부정보 홈
	ArrayList<Map<String, Object>> getBookingCompanyDetailHome(Map<String, Object> paramMap);
	//예약업체 세부정보 공통
	ArrayList<Map<String, Object>> getBookingCompanyDetailCommon(Map<String, Object> paramMap);
	//예약업체 총 수
	int bookingCompanyCount(String searchWord);
	//예약업체 리스트 출력
	ArrayList<Map<String, Object>> getBookingCompanyList(Map<String, Object> paramMap);
}
