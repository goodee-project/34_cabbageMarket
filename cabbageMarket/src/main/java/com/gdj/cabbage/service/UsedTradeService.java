package com.gdj.cabbage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.CategoryMapper;
import com.gdj.cabbage.mapper.UsedTradeMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class UsedTradeService {
	@Autowired
	UsedTradeMapper usedTradeMapper;

	// 중고상품 목록
	public List<Map<String, Object>> getUsedProductList(Map<String, Object> map) {
		log.debug("map " + map);
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
}