package goodee.gdj58.booking_c.mapper.payPoint;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.PointSaveHistory;

@Mapper
public interface PayPointMapper {
	int updatePoint(Customer customer); // 현재 보유 포인트 + 돌려받은 포인트
	int insertSavePoint(PointSaveHistory pointSaveHistory); // 예약 취소 후 사용 포인트 되돌려받음
}
