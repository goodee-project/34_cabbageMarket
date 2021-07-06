package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class PointsRechargeHistory {
	
	private int pointsRechargeHistoryId;
	private int userId;
	private int points;
	private String usedPointDate;

}
