package com.gdj.cabbage.vo;

import lombok.Data;

@Data
public class Users {
	
	private int userId;
	private String username;
	private String password;
	private String email;
	private String nickname;
	private String mobile;
	private String createDate;
	private String modifyDate;
	private int userState;

}
