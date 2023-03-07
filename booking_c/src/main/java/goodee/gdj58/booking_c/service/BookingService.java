package goodee.gdj58.booking_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.booking.BookingMapper;
import goodee.gdj58.booking_c.mapper.payPoint.PayPointMapper;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.PointSaveHistory;

@Service
@Transactional
public class BookingService {
	@Autowired BookingMapper bookingMapper;
	@Autowired PayPointMapper payPointMapper;
	
	// 예약 취소 상태 변경
	public int bookingCancel(Booking booking, BookingCancel bookingCancel, PointSaveHistory pointSaveHistory, Customer customer) {
		int row = bookingMapper.updateBookingCancel(booking);
		if(row == 1) {
			int row2 = bookingMapper.insertBookingCancel(bookingCancel);
			if(row2 == 1) {
				if(pointSaveHistory.getPoint() > 0) {
					int row3 = payPointMapper.insertSavePoint(pointSaveHistory);
					if(row3 == 1) {
						int row4 = payPointMapper.updatePoint(customer);
					}
				}
			}
		}
		
		return row;
	}
}
