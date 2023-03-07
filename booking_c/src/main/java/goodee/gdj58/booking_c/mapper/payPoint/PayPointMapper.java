package goodee.gdj58.booking_c.mapper.payPoint;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.PaySaveHistory;
import goodee.gdj58.booking_c.vo.PointSaveHistory;

@Mapper
public interface PayPointMapper {
	int updatePay(PaySaveHistory paySaveHistory); // 현재 보유 페이 + 돌려받은 페이
	int insertPay(PaySaveHistory paySaveHistory); // 예약 취소후 사용 페이 되돌려받음
	int updatePoint(PointSaveHistory pointSaveHistory); // 현재 보유 포인트 + 돌려받은 포인트
	int insertSavePoint(PointSaveHistory pointSaveHistory); // 예약 취소 후 사용 포인트 되돌려받음
}
