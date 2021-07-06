package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class AuctionProductRegistration {
	
	private int applyProductSalesDeliveryId;
	private String productDesc;
	private int minBid_Price;
	private int quote;
	private String registrationDeadline;
	private String createDate;

}
