package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerNickname;
	private String customerPostcode;
	private String customerAddress;
	private String customerPhone;
	private String customerRank;
	private String customerEmail;
	private int customerPay;
	private int customerPoint;
	private String customerBitrh;
	private String customerGender;
	private String createdate;
	private String updatedate;
	private String customerEmailMarketingAccept;
	private String customerInfoAgree;
	private String customerLastLoginDate;
}
