// 작성자 : 김태훈
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DirectTradeProductRegistrationMapper {
	List<Map<String, Object>> selectDirectTradeProductList(Map<String, Object> map);
}