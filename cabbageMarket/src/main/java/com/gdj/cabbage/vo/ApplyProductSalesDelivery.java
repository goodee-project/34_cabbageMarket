package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class ApplyProductSalesDelivery {
	
	private int applyProductSalesDeliveryId;
	private int userId;
	private int categorySubId;
	private String productName;
	private String returnAddress;
	private String waybillNumber;
	private String deliveryRequests;
	private String createDate;

}
