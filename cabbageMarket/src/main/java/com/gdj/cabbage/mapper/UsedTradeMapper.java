package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsedTradeMapper {
	List<Map<String, Object>> selectUsedProductList(Map<String, Object> map); //중고상품 목록
	int selectUsedProductTotal(Map<String, Object> map); //중고상품 Total
	
	Map<String, Object> selectUsedProductOne(int applyId); //중고상품 상세 Details
	List<String> selectUsedProductImg(int applyProductSalesDeliveryId); //증고상품 상세 img
	
	void insertUsedProduct(int applyId); //중고상품 등록
	
}
