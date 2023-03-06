package goodee.gdj58.booking_c.mapper.customer;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
	//예약업체 리스트 출력
	public ArrayList<Map<String, Object>> getBookingCompanyList(Map<String, Object> paramMap);
}
