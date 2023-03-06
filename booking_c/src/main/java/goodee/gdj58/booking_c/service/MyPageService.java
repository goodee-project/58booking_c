package goodee.gdj58.booking_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.myPage.MyPageMapper;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.Report;

@Service
@Transactional
public class MyPageService {
	@Autowired private MyPageMapper myPageMapper;
	// 리뷰 리스트
	public List<Map<String, Object>> reviewList(String customerId, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("beginRow", beginRow);
		
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
	public List<Map<String, Object>> bookingList(String customerId, int currentPage, int rowPerPage, String bookingState) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("bookingState", bookingState);
		
		return myPageMapper.bookingList(paramMap);
	}
	
	// 고객 상세 정보
	public Map<String, Object> customerOne(Customer customer) {
		return myPageMapper.customerOne("cus1");
	}
}
