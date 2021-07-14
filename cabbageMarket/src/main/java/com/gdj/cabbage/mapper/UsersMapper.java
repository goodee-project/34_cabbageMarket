package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.PointsRechargeHistory;
import com.gdj.cabbage.vo.SNSInfo;
import com.gdj.cabbage.vo.ShippingAddress;
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
	int deleteUser(Users users);
	int deleteSnsInfo(Users users);
	int deleteSnsUser(Users users);
	int selectSnsUserId(Users users);
	List<Map<String, Object>> userPointHistoryList(Map<String, Object> map);
	int userPointHistoryCount(Map<String, Object> map);
	int pointRecharge(PointsRechargeHistory prh);
	Map<String,Object> sessionUpdate(int userId);
	int addAddress(ShippingAddress shippingAddress);
	List<ShippingAddress> getAddressByUserId(int userId);
} 
