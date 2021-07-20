// 작성자 : 김태훈
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.DirectTradeProductImg;
import com.gdj.cabbage.vo.DirectTradeProductRegistration;

@Mapper
public interface DirectTradeProductRegistrationMapper {
	List<Map<String, Object>> selectDirectTradeProductList(Map<String, Object> map);
	List<Map<String, Object>> selectDirectTradeProductRand6();
	int selectDirectTradeProductTotal(Map<String, Object> map);
	
	Map<String, Object> selectDirectTradeProductOneByKey(int directTradeProductRegistrationId);
	List<String> selectDirectTradeProductImgByKey(int directTradeProductRegistrationId);
	String selectNicknameBydtprKey(int directTradeProductRegistrationId);
	
	void insertDirectTradeProductImg(DirectTradeProductImg directTradeProductImg);
	void insertDirectTradeProductRegistration(DirectTradeProductRegistration directTradeProductRegistration);
	void updateDirectTradeProductRegistration(DirectTradeProductRegistration directTradeProductRegistration);
	
	List<Map<String, Object>> selectRelatedDirectProduct(int categoryMiddleId);
}