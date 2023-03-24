package goodee.gdj58.booking_c.mapper.customer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingCompanyOffdayMapper {
	List<Map<String,Object>> bookingCompanyOffday(String bkcId);
}
