package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class AuctionProductRegistration {
	
	private int applyProductSalesDeliveryId;
	private String productDesc;
	private int minBidPrice;
	private int quote;
	private String registrationDeadline;
	private String createDate;

}
