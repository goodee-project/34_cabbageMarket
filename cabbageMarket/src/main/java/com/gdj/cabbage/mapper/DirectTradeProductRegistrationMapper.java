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
	Map<String, Object> selectDirectTradeProductOneByKey(int directTradeProductRegistrationId);
	List<String> selectDirectTradeProductImgByKey(int directTradeProductRegistrationId);
	
	void insertDirectTradeProductImg(DirectTradeProductImg directTradeProductImg);
	void insertDirectTradeProductRegistration(DirectTradeProductRegistration directTradeProductRegistration);
}