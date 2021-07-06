package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class BuyingProductDelivery {
	
	private int applyProductSalesDeliveryId;
	private int shippingAddressId;
	private int deliveryState;
	private String waybillNumber;
	private String createDate;

}
