// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.AuctionProductRegistration;
import com.gdj.cabbage.vo.BiddingProductDelivery;

@Mapper
public interface AuctionMapper {
	// getAuctionList 31
	int selectAuctionForCount(Map<String, Object> map);//검색어 없이 total 가져오는 mapper
	List<Map<String,Object>> selectAuctionList(Map<String, Object> page);//검색어 없이 auctionList 가져오는 mapper
	//53 categoryMapper.selectAuctionList
	List<Map<String, Object>> selectAuctionListByDeadline(int limit); //마감기한 최근순인 상품 가져오는 매퍼

	//getAuctionOne 70
	Map<String, Object> selectAuctionOne(int applyId); //상세정보 가져오는 mapper
	List<Map<String, Object>> selectBidInfo(int applyId); //등록번호에 따라 입찰정보를 가져오는 매퍼
	
	//getApplyImg 84
	//87 applyProductSalesMapper.selectApplyImgByKey
	
	//getApplyOne 92
	Map<String, Object> selectApplynOne(int applyId); //상세정보 가져오는 mapper

	//addAuctionProduct 100
	int insertAuction(AuctionProductRegistration auctionProductRegistration); //옥션 등록하는 mapper
	void updateConfirmationState(int applyId, int state); //옥션 등록시, confirmation state변경

	//confirmBeforeBid 113
	int selectUserPoint(Map<String, Object> map); //포인트를 가져오는 mapper
	int selectBeforeBidCntByMap(Map<String, Object> map); //이전 입찰 갯수를 가져오는 mapper

	//insertBid 143
	//149 auctionMapper.selectBeforeBidCntByMap
	int selectConfirmSellerByUserId(Map<String, Object> map);//seller.userId를 가져오는 mapper
	int insertBidding(Map<String, Object> map);// 입찰 등록하는 mapper
	int selectBeforeBidId(Map<String, Object> map); //이전 입찰 아이디를 가져오는 mapper
	int insertBidPointMinusByBid(Map<String, Object> map); //포인트 사용하는 튜플 넣기
	
	Map<String, Object> selectBeforeBid(Map<String, Object> map); //입찰id를 가져오는 매퍼
	List<Map<String, Object>> selectBidList (int applyId); //마지막 옥션 입찰자 찾는 mapper
	int updateBidding(Map<String, Object> myNewBid); //이전 입찰을 업데이트하는 mapper
	int updateBidPointMinusByBid(Map<String, Object> myNewBid); // 이전 입찰 포인트를 업데이트하는 mapper

	//modifyAuction 195
	double selectBidComissionRateForint(int kind); //수수료 계산하는 매퍼
	List<Map<String, Object>> getTimeOutApplyId(); //시간초과된 ApplyId를 찾아주는 매퍼
	int selectBeforeBidCntByApplyId(int applyId); //이전 입찰 갯수를 가져오는 mapper
	int selectCommisionByApplyId(int applyId, int kind);
	//217 auctionMapper.selectBidList
	int selectBeforeBidPrice(Map<String, Object> map); //입찰id를 가져오는 매퍼
	int insertBidPointPlusHistory(Map<String, Object> notLastBid); //포인트 사용을 추가하는 매퍼
	int insertBidCommisionByLastBid(Map<String, Object> map); //수수료 입력하는 매퍼
	int insertBidPointPlusByLastBid(Map<String, Object> map); //낙찰시 판매자에게 지급하는 포인트
	//265 auctionMapper.updateConfimationState
	
	//getAuctionListBySubId 276
	List<Map<String, Object>> selectAuctionListBySubId(int categorySubId);//AuctionOne의 연관 상품 가져오는 매퍼

	//removeBid 286
	//290 auctionMapper.insertBidPointPlusHistory
	
	// getAuctionProductAndImgsByKey 297
	List<Map<String, Object>> selectAuctionProductAndImgsByKey(int applyId); // 경매상품 수정 페이지에 출력할 경매상품 정보, 모든 이미지
	// modifyAuctionProduct 302
	void updateAuctionProduct(AuctionProductRegistration auctionProductRegistration);
	//addBiddingProductDelivery 306
	void insertBiddingProductDelivery(BiddingProductDelivery biddingProductDelivery); // 낙찰상품 배송지 입력

	//rest
	List<Map<String, Object>> selectAuctionListByApplyId(int applyId); //AuctionOne의 연관 상품 가져오는 매퍼
	List<Map<String, Object>> selectApplyList(Map<String, Object> page); //건색어 없이 applyList 가져오는 mapper
	int selectNewBidId(Map<String, Object> map); //입찰id를 가져오는 테이블
	int insertBidCommisionByCancleBid(Map<String, Object> map);  //경매 취소수수료 입력하는 매퍼

}
