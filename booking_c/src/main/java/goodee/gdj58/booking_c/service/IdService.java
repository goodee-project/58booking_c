package goodee.gdj58.booking_c.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.customer.IdMapper;

@Service
@Transactional
public class IdService {
	@Autowired IdMapper idMapper;
	
	// no = 중복, yes = 사용가능 ID
	public String getIdCheck(String id) {
		String result = "no";
		if(idMapper.selectIdCheck(id) == null) {
			result = "yes";
		}
		return result;
	}
}
