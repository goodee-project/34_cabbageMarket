// 작성자 : 김태훈
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.ApplyProductSalesDelivery;
import com.gdj.cabbage.vo.ApplyproductSalesDeliveryImg;

@Mapper
public interface ApplyProductSalesMapper {
	List<Map<String,Object>> selectApplyProductSalesDeliveryList(int userId); // 판매 상품 배송 신청 리스트
	
	List<String> selectApplyImgByKey(int applyId); //상세 이미지 가져오는 mapper
	
	void insertApplyProductSalesDelivery(ApplyProductSalesDelivery applyProductSalesDelivery); // 상품 판매 배송 신청
	void insertApplyproductSalesDeliveryImg(ApplyproductSalesDeliveryImg applyproductSalesDeliveryImg); // 상품 판매 배송 신청 이미지
}
