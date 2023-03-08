package goodee.gdj58.booking_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.payPoint.PayPointMapper;
import goodee.gdj58.booking_c.vo.PaySaveHistory;

@Service
@Transactional
public class PayPointService {
	@Autowired PayPointMapper payPointMapper;
	
	// 페이 적립 내역에 추가
	public int insertPay(PaySaveHistory paySaveHistory) {
		return payPointMapper.insertPay(paySaveHistory);
	}
}
