package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class CompnayType {
	private int companyTypeNo;
	private String companyTypContent;
	private int parentNo;
	private int groupNo;
	private int sequence;
	private int depth;
}
