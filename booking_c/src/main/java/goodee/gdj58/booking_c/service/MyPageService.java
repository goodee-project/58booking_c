package goodee.gdj58.booking_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.myPage.MyPageMapper;
import goodee.gdj58.booking_c.mapper.payPoint.PayPointMapper;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.PaySaveHistory;
import goodee.gdj58.booking_c.vo.Report;

@Service
@Transactional
public class MyPageService {
	@Autowired private MyPageMapper myPageMapper;
	@Autowired private PayPointMapper payPointMapper;
	
	// 고객 정보 수정
	public int updateCustomerOne(Customer customer) {
		return myPageMapper.updateCustomerOne(customer);
	}
	
	// 회원 탈퇴
	public int deactiveCustomer(Customer customer, PaySaveHistory paySaveHistory) {
		int row = 0;
		int row2 = 0;
		int row3 = 0;
		row = payPointMapper.usePay(paySaveHistory);
		if (row == 1) {
			row2 = myPageMapper.updatePay(paySaveHistory);
			if(row2 == 1) {
				row3 = myPageMapper.deactiveCustomer(customer);
			}
		}
		return row3;	
	}

	// 페이징용 페이 리스트 데이터 개수
	public int payCnt(String customerId, String priceState) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("priceState", priceState);
		
		return myPageMapper.payCnt(paramMap);
	}
	
	// 예약 + 충전 관련 페이 리스트
	public List<Map<String, Object>> payList(String customerId, String priceState, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("priceState", priceState);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return myPageMapper.payList(paramMap);
	}
	
	// 페이징용 포인트 리스트 데이터 개수
	public int pointCnt(String customerId, String pointState) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("pointState", pointState);
		
		return myPageMapper.pointCnt(paramMap);
	}
	
	// 예약 + 이벤트 관련 포인트 리스트
	public List<Map<String, Object>> pointList(String customerId, String pointState, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("pointState", pointState);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return myPageMapper.pointList(paramMap);
	}
	
	// 페이징용 리뷰 리스트 데이터 개수
	public int reviewCnt(String customerId) {
		return myPageMapper.reviewCnt(customerId);
	}
	
	// 리뷰 리스트
	public List<Map<String, Object>> reviewList(String customerId, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return myPageMapper.reviewList(paramMap);
	}
	
	// 예약에 대한 신고
	public int insertReport(Report report) {
		return myPageMapper.insertReport(report);
	}
	
	// 페이징용 예약 내역 데이터 개수
	public int bookingCnt(String customerId, String bookingState) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("bookingState", bookingState);
		
		return myPageMapper.bookingCnt(paramMap);
	}
	
	// 예약 내역 리스트
	public List<Map<String, Object>> bookingList(String customerId, String bookingState, String dateSort, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("bookingState", bookingState);
		paramMap.put("dateSort", dateSort);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return myPageMapper.bookingList(paramMap);
	}
	
	// 고객 상세 정보
	public Map<String, Object> customerOne(String customerId) {
		return myPageMapper.customerOne("cus1");
	}
}
