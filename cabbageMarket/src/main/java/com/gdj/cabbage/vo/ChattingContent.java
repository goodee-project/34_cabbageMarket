package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class ChattingContent {
	
	private int chattingContentId;
	private int chattingRoomId;
	private int userId;
	private String content;
	private String createDate;

}
