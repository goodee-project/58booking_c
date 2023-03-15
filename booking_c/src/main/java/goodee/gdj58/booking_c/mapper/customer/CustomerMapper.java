package goodee.gdj58.booking_c.mapper.customer;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.TotalId;

@Mapper
public interface CustomerMapper {
	// 고객 비밀번호 찾기
	int updateCustomerPw(Customer customer);
	// 고객 아이디 찾기
	String selectCustomerId(Customer customer);
	// 고객 아이디/비밀번호 찾기시 이메일 조회
	int selectCustomerEmail(Customer customer);
	// 고객 로그인
	Customer selectCustomer(Customer customer);
	// 고객 회원가입(토탈ID)
	public int insertTotalId(TotalId totalId);
	// 고객 회원가입(사진)
	public int insertCustomerImg(CustomerImg customerImg);
	// 고객 회원가입
	public int insertCustomer(Customer customer);
	
	
	
	//예약시 상품 시간 리스트
	ArrayList<Map<String, Object>> getBookingProductTimeList(String bkcId);
	//에약시 상품정보 확인
	Map<String,Object> getBookingProductInfo(String bkpName);
	//상품예약 옵션 리스트
	ArrayList<Map<String, Object>> getBookingProductOptionList(String bkpName);
	//상품예약 시간 선택 페이지 
	ArrayList<Map<String, Object>> getBookingProductSelectTime(String bkcId);
	//예약업체 세부정보 지도
	ArrayList<Map<String, Object>> getBookingCompanyDetailMap(String bkcId);
	//예약업체 세부정보 리뷰
	ArrayList<Map<String, Object>> getBookingCompanyDetailReview(String bkcId);
	//예약업체 세부정보 예약
	ArrayList<Map<String, Object>> getBookingCompanyDetailBooking(String bkcId);
	//예약업체 세부정보 홈
	ArrayList<Map<String, Object>> getBookingCompanyDetailHome(String bkcId);
	//예약업체 세부정보 공통
	ArrayList<Map<String, Object>> getBookingCompanyDetailCommon(Map<String, Object> paramMap);
	//예약업체 총 수
	int bookingCompanyCount(String searchWord);
	//예약업체 리스트 출력
	ArrayList<Map<String, Object>> getBookingCompanyList(Map<String, Object> paramMap);
}
