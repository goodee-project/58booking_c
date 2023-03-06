package goodee.gdj58.booking_c.mapper.myPage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Report;

@Mapper
public interface MyPageMapper {
	List<Map<String, Object>> reviewList(Map<String, Object> paramMap); // 리뷰 리스트
	int insertReport(Report report); // 예약에 대한 신고
	int bookingCnt(Map<String, Object> paramMap); // 페이징용 예약 내역 데이터 개수
	List<Map<String, Object>> bookingList(Map<String, Object> paramMap); // 예약 내역 리스트
	Map<String, Object> customerOne(String customerId); // 고객 상세정보
}