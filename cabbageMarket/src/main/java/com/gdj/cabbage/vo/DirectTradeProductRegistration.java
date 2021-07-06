package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class DirectTradeProductRegistration {
	
	private int directTradeProductRegistration;
	private int userId;
	private int categorySubId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String location;
	private int registrationDtate;
	private String createFate;

}
