package com.gdj.cabbage.service;

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
	
	//중고상품 구매
	public void insertBuyingUsedProduct(BuyingUsedProduct buyingUsedProduct) { //1.
		usedTradeMapper.insertBuyingUsedProduct(buyingUsedProduct);
	}
	public void insertUsingPoint(Map<String, Object> map) { //2.
		usedTradeMapper.insertUsingPoint(map);
	}
	public void insertCommissionsPoint(BuyingCommissionsHistory buyingcommissiongsHistory) { //3.
		usedTradeMapper.insertCommissionsPoint(buyingcommissiongsHistory);
	}
	public void insertProductDeliveryInfo(BuyingProductDelivery buyingProductDelivery) { //4.
		usedTradeMapper.insertProductDeliveryInfo(buyingProductDelivery);
	}
	public void updateRegistrationState(int applyProductSalesDeliveryId) { //5.
		usedTradeMapper.updateRegistrationState(applyProductSalesDeliveryId);
	}
	public void deleteSoldUsedProduct(int applyProductSalesDeliveryId) { //6.
		usedTradeMapper.deleteSoldUsedProduct(applyProductSalesDeliveryId);
	}
}