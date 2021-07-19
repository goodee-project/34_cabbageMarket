package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.UsedProductRegistration;

@Mapper
public interface UsedTradeMapper {
	List<Map<String, Object>> selectUsedProductList(Map<String, Object> map); //중고상품 목록
	int selectUsedProductTotal(Map<String, Object> map); //중고상품 Total
	
	Map<String, Object> selectUsedProductOne(int applyId); //중고상품 상세 Details
	List<String> selectUsedProductImg(int applyProductSalesDeliveryId); //증고상품 상세 img
	
	void insertUsedProduct(UsedProductRegistration usedProductRegistration); //중고상품 등록
	void updateProductRegistrationState(ProductConfirmationRegistration productConfirmationRegistration); //상태값 변경(미등록->중고상품)

	void updateUsedProduct(UsedProductRegistration usedProductRegistration); //중고상품 수정(상품설명, 상품가격)
	
	Map<String, Object> selectUsedProductOneForBuy(int applyId); //구매할 중고상품 정보
	
}
