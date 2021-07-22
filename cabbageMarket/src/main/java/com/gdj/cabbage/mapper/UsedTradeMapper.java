package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.BuyingCommissionsHistory;
import com.gdj.cabbage.vo.BuyingPointsUsingHistory;
import com.gdj.cabbage.vo.BuyingProductDelivery;
import com.gdj.cabbage.vo.BuyingUsedProduct;
import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.UsedProductRegistration;

@Mapper
public interface UsedTradeMapper {
	List<Map<String, Object>> selectUsedProductList(Map<String, Object> map); //중고상품 목록
	int selectUsedProductTotal(Map<String, Object> map); //중고상품 Total
	
	Map<String, Object> selectUsedProductOne(int applyId); //중고상품 상세 Details
	List<String> selectUsedProductImg(int applyProductSalesDeliveryId); //증고상품 상세 img
	List<Map<String, Object>> selectRelatedUsedProduct(int categoryMiddleId); //관련 중고상품 목록
	
	void insertUsedProduct(UsedProductRegistration usedProductRegistration); //중고상품 등록
	void updateProductRegistrationState(ProductConfirmationRegistration productConfirmationRegistration); //상태값 변경(미등록->중고상품)

	void updateUsedProduct(UsedProductRegistration usedProductRegistration); //중고상품 수정(상품설명, 상품가격)
	
	Map<String, Object> selectUsedProductOneForBuy(int applyId); //구매할 중고상품 정보
	
	void insertBuyingUsedProduct(int applyProductSalesDeliveryId, int userId); //1.구매한 중고상품 
	int selectCommissionRate();//수수료율
	void insertUsingPoint(Map<String, Object> map); //2.포인트 수입/지출 내역
	void insertCommissionsPoint(int applyProductSalesDeliveryId, int commissionPoint); //3.판매자의 중고상품 수수료
	void insertProductDeliveryInfo(Map<String, Object> map); //4.상품 배송정보
	void updateRegistrationState(int applyProductSalesDeliveryId); //5.상품등록상태 변경 
	void deleteSoldUsedProduct(int applyProductSalesDeliveryId); //6.판매된 중고상품 삭제
}
