package com.gdj.cabbage.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.SNSInfo;
import com.gdj.cabbage.vo.Users;

@Mapper
public interface UsersMapper {
	Map<String, Object> loginSession(Users users);
	int registerUser(Users users);
	int selectEmail(Users users);
	int selectNickname(Users users);
	int selectSnsId(String id);
	int registerNaverUser(SNSInfo snsInfo);
	Map<String, Object> naverLoginSession(String snsId);
	Map<String, Object> selectUserInfo(int userId);
	int updateUsers(Users users);
}
