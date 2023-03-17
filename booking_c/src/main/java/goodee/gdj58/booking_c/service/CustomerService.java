package goodee.gdj58.booking_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.controller.CustomerController;
import goodee.gdj58.booking_c.mapper.customer.CustomerMapper;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.TotalId;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired private CustomerMapper customerMapper;
	
	// 예약내역 상세보기
	public List<Map<String, Object>> getBookingOne(String customerId, String companyName) {
		return customerMapper.getBookingOne(customerId, companyName);
	}
	
	// 고객 비밀번호 찾기(수정)
	public int updateCustomerPw(String customerEmail, String customerId, String customerPw) {
		
		Customer customer = new Customer();
		customer.setCustomerEmail(customerEmail);
		customer.setCustomerId(customerId);
		customer.setCustomerPw(customerPw);
		
		log.debug(FontColor.CYAN+customerEmail+"<-이메일");
		log.debug(FontColor.CYAN+customerId+"<-아이디");
		log.debug(FontColor.CYAN+customerPw+"<-패스워드");
		return customerMapper.updateCustomerPw(customer);
	}
	
	// 고객 아이디 찾기
	public String getCustomerId(String customerName, String customerEmail) {
		Customer customer = new Customer();
		customer.setCustomerEmail(customerName);
		customer.setCustomerName(customerEmail);
		
		return customerMapper.selectCustomerId(customer);
	}
	
	// 아이디/패스워드 찾기 시 이메일 조회
	public int getCustomerEmail(Customer customer) {
		return customerMapper.selectCustomerEmail(customer);
	}
	
	// 고객 로그인
	public Customer loginCustomer(Customer customer) {
		return customerMapper.selectCustomer(customer);
	}
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
	
	
	
	
	
	
	
	
	//결제페이지 - 사업자 정보
	public Map<String, Object> bookingPaymentCompany(String bkcId)
	{
		return customerMapper.getBookingPaymentCompany(bkcId);
	}
	//예약시 상품 시간 리스트
	public List<Map<String, Object>> getBookingProductTimeList(String bkcId)
	{
		return customerMapper.getBookingProductTimeList(bkcId);
	}
	//에약시 상품정보 확인
	public Map<String, Object> bookingProductInfo(String bkpName, String bkcId)
	{
		return customerMapper.getBookingProductInfo(bkpName, bkcId);
	}
	
	//상품 예약 옵션 리스트
	public List<Map<String, Object>> getBookingProductOptionList(String bkpName, String bkcId)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bkpName", bkpName);
		paramMap.put("bkcId", bkcId);
		return customerMapper.getBookingProductOptionList(paramMap);
	}
	
	//상품 예약 시간 선택 페이지
	public List<Map<String, Object>> getBookingProductSelectTime(String bkcId)
	{
		return customerMapper.getBookingProductSelectTime(bkcId);
	}
	
	//예약업체 세부정보 지도
	public List<Map<String, Object>> getBookingCompanyDetailMap(String bkcId)
	{
		return customerMapper.getBookingCompanyDetailMap(bkcId);
	}
	//예약업체 세부정보 리뷰
	public List<Map<String, Object>> getBookingCompanyDetailReview(String bkcId)
	{
		return customerMapper.getBookingCompanyDetailReview(bkcId);
	}
	
	//예약업체 세부정보 예약
	public List<Map<String, Object>> getBookingCompanyDetailBooking(String bkcId)
	{
		
		return customerMapper.getBookingCompanyDetailBooking(bkcId);
	}
	
	//예약업체 세부정보 홈
	public List<Map<String, Object>> getBookingCompanyDetailHome(String bkcId)
	{
		
		return customerMapper.getBookingCompanyDetailHome(bkcId);
	}
	
	//예약업체 세부정보 공통
	public List<Map<String, Object>> getBookingCompanyDetailCommon(String bkcId, String bkciLevel)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bkcId", bkcId);
		paramMap.put("bkciLevel", bkciLevel);
		return customerMapper.getBookingCompanyDetailCommon(paramMap);
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
