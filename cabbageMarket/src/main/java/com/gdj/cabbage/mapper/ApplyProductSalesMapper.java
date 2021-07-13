// 작성자 : 김태훈
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApplyProductSalesMapper {
	List<Map<String,Object>> selectApplyProductSalesDeliveryList(int userId); // 판매 상품 배송 신청 리스트
	
	List<String> selectApplyImgByKey(int applyId); //상세 이미지 가져오는 mapper
}
