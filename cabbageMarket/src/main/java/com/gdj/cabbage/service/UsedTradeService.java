package com.gdj.cabbage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.UsedTradeMapper;
import com.gdj.cabbage.vo.BuyingCommissionsHistory;
import com.gdj.cabbage.vo.BuyingPointsUsingHistory;
import com.gdj.cabbage.vo.BuyingProductDelivery;
import com.gdj.cabbage.vo.BuyingUsedProduct;
import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.UsedProductRegistration;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class UsedTradeService {
	@Autowired
	UsedTradeMapper usedTradeMapper;

	// 중고상품 목록
	public List<Map<String, Object>> getUsedProductList(Map<String, Object> map) {
		log.debug("☆☆☆☆☆☆☆☆service getUsedProductList() map " + map);
		return usedTradeMapper.selectUsedProductList(map);
	}

	// 중고상품 total
	public int getUsedProductTotal(Map<String, Object> map) {
		return usedTradeMapper.selectUsedProductTotal(map);
	}
	
	//중고상품 상세 details
	public Map<String,Object> getUsedProductOne(int applyId){
		log.debug("★★★★★★★★service getUsedProductOne() applyId:" + applyId);
		return usedTradeMapper.selectUsedProductOne(applyId);
	}
	
	//중고상품 상세 img
	public List<String> getUsedProductImg(int applyProductSalesDeliveryId){
		return usedTradeMapper.selectUsedProductImg(applyProductSalesDeliveryId);
	}
	
	//관련된 중고상품 목록
	public List<Map<String, Object>> getRelatedUsedProduct(int categoryMiddleId){
		return usedTradeMapper.selectRelatedUsedProduct(categoryMiddleId);
	}
	
	//중고상품 등록
	public void addUsedProduct(UsedProductRegistration usedProductRegistration, ProductConfirmationRegistration productConfirmationRegistration) {
		usedTradeMapper.insertUsedProduct(usedProductRegistration); //중고상품 등록
		usedTradeMapper.updateProductRegistrationState(productConfirmationRegistration); //상태값 변경(미등록->중고상품)
	}
	
	//중고상품 수정
	public void modifyUsedProduct(UsedProductRegistration usedProductRegistration) {
		usedTradeMapper.updateUsedProduct(usedProductRegistration);//중고상품(설명, 가격) 수정
	}
	
	//구매할 중고상품 정보
	public Map<String, Object> getUsedProductOneForBuy(int applyId) {
		log.debug("★★★★★★★★★★service getUsedProductOneForBuy() applyId:"+applyId);
		return usedTradeMapper.selectUsedProductOneForBuy(applyId);
	}
	
	//중고상품 구매 (1 ~ 5)
	public void buyUsedProduct(Map<String, Object> map) { 
		
		//1.구매한 중고상품 
		usedTradeMapper.insertBuyingUsedProduct((int)map.get("applyProductSalesDeliveryId"), (int)map.get("userId"));
		
		// 수수료
		int commissionRate = usedTradeMapper.selectCommissionRate();
		int productPrice = (int)map.get("productPrice");
		int commissionPoint = (int)(productPrice * ((double)commissionRate/(double)100));  // 수수료 0.5원 밑으로 할인 ex) 수수료 500.5원이면 -> 500원으로
		
		//2.포인트 수입/지출 내역
		Map<String,Object> insertUsingPointMap = new HashMap<>();
		insertUsingPointMap.put("applyProductSalesDeliveryId", (int)map.get("applyProductSalesDeliveryId"));
		insertUsingPointMap.put("exPoint", productPrice); // 지출포인트 = 상품가격
		
		// 수입포인트 = 상품가격 - 수수료(상품가격*(수수료/100))
		int inPoint = productPrice - commissionPoint;
		insertUsingPointMap.put("inPoint", inPoint); // 상품가격 - 수수료
		
		usedTradeMapper.insertUsingPoint(insertUsingPointMap);
		
		//3.판매자의 중고상품 수수료
		usedTradeMapper.insertCommissionsPoint((int)map.get("applyProductSalesDeliveryId"), commissionPoint);
		
		//4.상품 배송정보
		usedTradeMapper.insertProductDeliveryInfo(map);
		
		//5.상품등록상태 변경 
		usedTradeMapper.updateRegistrationState((int)map.get("applyProductSalesDeliveryId"));
		
		//6.판매된 중고상품 삭제 -> 처리 불가로 주석처리함.
		//usedTradeMapper.deleteSoldUsedProduct((int)map.get("applyProductSalesDeliveryId"));
		
	}
}