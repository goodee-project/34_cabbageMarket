package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class UsedProductRegistration {
	
	private int applyProductSalesDeliveryid;
	private String productDesc;
	private int productPrice;
	private int registrationState;
	private String registrationDeadline;
	private String createDate;

}
