package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class ShippingAddress {

	private int shippingAddressId;
	private int userId;
	private String recipientName;
	private String address;
	private String recipientPhoneNumber;
	
}
