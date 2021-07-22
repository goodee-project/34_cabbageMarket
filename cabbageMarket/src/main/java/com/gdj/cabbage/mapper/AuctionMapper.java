// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.AuctionProductRegistration;

@Mapper
public interface AuctionMapper {

	List<Map<String,Object>> selectAuctionList(Map<String, Object> page);//검색어 없이 auctionList 가져오는 mapper

	int selectAuctionForCount();//검색어 없이 total 가져오는 mapper

	Map<String, Object> selectAuctionOne(int applyId); //상세정보 가져오는 mapper

	List<Map<String, Object>> selectApplyList(Map<String, Object> page); //건색어 없이 applyList 가져오는 mapper

	int selectApplyForCount(Map<String, Object> paramMap); //검색어 없이 total가져오는 mapper
	
	Map<String, Object> selectApplynOne(int applyId); //상세정보 가져오는 mapper

	int insertAuction(AuctionProductRegistration auctionProductRegistration); //옥션 등록하는 mapper

	void updateConfirmationState(int applyId); //옥션 등록시, confirmation state변경

	int selectLastBidUserId(Object object); //마지막 옥션 입찰자 찾는 mapper

	int insertBidding(Map<String, Object> map);// 입찰 등록하는 mapper

	int selectNewBidId(Map<String, Object> map); //입찰id를 가져오는 테이블
	Map<String, Object> selectBeforeBid(Map<String, Object> map); //입찰id를 가져오는 테이블
	
	int insertBidPointPlusHistory(Map<String,Object> map); //포인트 사용을 추가하는 테이블
	int insertBidPointMinusHistory(Map<String, Object> map); //포인트 사용을 반환하는 테이블

}
