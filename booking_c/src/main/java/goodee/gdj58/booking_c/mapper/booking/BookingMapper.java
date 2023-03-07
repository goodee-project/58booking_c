package goodee.gdj58.booking_c.mapper.booking;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;

@Mapper
public interface BookingMapper {
	int insertBookingCancel(BookingCancel bookingCancel); // 취소 내역 추가
	int updateBookingCancel(Booking booking); // 예약 취소 상태 변경
}
