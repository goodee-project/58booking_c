package goodee.gdj58.booking_c.mapper.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingCompanyOffdayMapper {
	List<String> bookingCompanyOffday(String bkcId);
}
