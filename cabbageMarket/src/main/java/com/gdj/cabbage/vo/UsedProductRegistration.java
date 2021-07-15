package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class UsedProductRegistration {
	
	private int applyProductSalesDeliveryId;
	private String productDesc;
	private int productPrice;
	private int registrationState;
	private String registrationDeadline;
	private String createDate;

}
