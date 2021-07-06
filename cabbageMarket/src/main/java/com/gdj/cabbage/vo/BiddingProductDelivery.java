package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class BiddingProductDelivery {
	
	private int applyProductSalesDeliveryId;
	private int shipping_address_id;
	private int delivery_state;
	private String waybill_number;
	private String delivery_requests;
	private String create_date;

}
