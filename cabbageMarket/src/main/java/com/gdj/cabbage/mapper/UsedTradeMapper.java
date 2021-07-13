package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsedTradeMapper {
	List<Map<String, Object>> selectUsedProductList(Map<String, Object> map); //중고상품 목록
	int selectUsedProductTotal(Map<String, Object> map); //중고상품 Total
	
}
