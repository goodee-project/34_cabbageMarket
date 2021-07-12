// 작성자 : 김태훈
package com.gdj.cabbage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.ApplyProductSalesMapper;

@Service
@Transactional
public class ApplyProductSalesService {
	
	@Autowired ApplyProductSalesMapper applyProductSalesMapper;
	
	// 판매 상품 배송 신청 리스트
	public List<Map<String,Object>> getApplyProductSalesDeliveryList(int userId){
		return applyProductSalesMapper.selectApplyProductSalesDeliveryList(userId);
	}
}
