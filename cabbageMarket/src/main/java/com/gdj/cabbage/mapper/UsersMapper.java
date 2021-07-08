package com.gdj.cabbage.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.Users;

@Mapper
public interface UsersMapper {
	Map<String, Object> loginSession(Users users);
	int registerUser(Users users);
	int selectEmail(Users users);
	int selectNickname(Users users);
}
