package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class DirectTradeProductRegistration {
	
	private int directTradeProductRegistrationId;
	private int userId;
	private int categorySubId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String location;
	private int productState;
	private String createDate;

}
