//작성자 : 김희진
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IndexMapper {
	List<Map<String, Object>> selectDirectProductListForIndex(); // 직거래상품
	List<Map<String, Object>> selectAuctionProductForIndex(); // 경매상품 
	List<Map<String, Object>> selectUsedProductForIndex(); // 중고상품
}
