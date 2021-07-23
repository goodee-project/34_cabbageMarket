
package com.gdj.cabbage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.ApplyProductSalesMapper;
import com.gdj.cabbage.mapper.AuctionMapper;
import com.gdj.cabbage.mapper.CategoryMapper;
import com.gdj.cabbage.vo.AuctionProductRegistration;
import com.gdj.cabbage.vo.CategoryMain;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AuctionService {
	@Autowired AuctionMapper auctionMapper;
	@Autowired CategoryMapper categoryMapper;
	@Autowired ApplyProductSalesMapper applyProductSalesMapper;

	//경매상품과 검색어에따른 total, lastPage, auctionList가져오는 서비스 : getAuctionList
	public Map<String, Object> getAuctionList(Map<String, Object> paramMap) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 paramMap확인"+paramMap.toString());
		
		int beginRow = (((int)paramMap.get("currentPage")-1)*(int)paramMap.get("rowPerPage"));
		int pageSet = ((int)paramMap.get("currentPage")-1)/10;
		
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", ((int)paramMap.get("rowPerPage")));
		page.put("searchWord", ((String)paramMap.get("searchWord")));
		page.put("categoryMainId", ((String)paramMap.get("categoryMainId")));
		
		int total = (auctionMapper.selectAuctionForCount(page));
		int lastPage = (int)(Math.ceil((double)total / (int)paramMap.get("rowPerPage"))); //lastPage 계산
		
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 Page 학인 : "+ page.toString());
		
		log.debug(Debuging.DEBUG+"4 mapper에서 온 total 확인: "+ total);
		List<Map<String,Object>> auctionList = auctionMapper.selectAuctionList(page); //검색어 없이 auctionList 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 auctionList 확인"+auctionList.toString());
		
		List<CategoryMain> categoryMainList = categoryMapper.selectCategoryMain();//카테고리 메인을 불러오는 mapper
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 categoryMainList확인"+categoryMainList.toString());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("total", total);
		resultMap.put("lastPage", lastPage);
		resultMap.put("pageSet", pageSet);
		resultMap.put("auctionList", auctionList);
		resultMap.put("categoryMainList", categoryMainList);
		
		return resultMap;
	}
	// 상품 상세정보 가져오는 서비스 : getAuctionOne
	public Map<String, Object> getAuctionOne(int applyId) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 applyId 학인 : "+ applyId);
		Map<String,Object> auctionList = auctionMapper.selectAuctionOne(applyId); //상세정보 가져오는 mapper
		return auctionList;
	}
	// 상품 이미지들 불러오는 서비스 : getAuctionOne addAuction
	public List<String> getApplyImg(int applyId) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 applyId 학인 : "+ applyId);
		List<String> auctionList = applyProductSalesMapper.selectApplyImgByKey(applyId); //이미지를 가져오는 mapper
		return auctionList;
	}
	
	// 상품 판매 배송 신청 리스트를 불러오는 서비스 : 갈곳잃음
	public Map<String, Object> getApplyList(Map<String, Object> paramMap) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 paramMap확인"+paramMap.toString());
		
		int beginRow = (((int)paramMap.get("currentPage")-1)*(int)paramMap.get("rowPerPage"));
		int total = (auctionMapper.selectApplyForCount(paramMap)); //검색어 없이 apply total 가져오는 mapper
		int lastPage = (int)(Math.ceil((double)total / (int)paramMap.get("rowPerPage"))); //lastPage 계산
		
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("beginRow", beginRow);
		page.put("RowPerPage", ((int)paramMap.get("rowPerPage")));
		page.put("SearchWord", ((String)paramMap.get("searchWord")));
		page.put("userId", ((int)paramMap.get("userId")));
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 Page 학인 : "+ page.toString());
		
		log.debug(Debuging.DEBUG+"4 mapper에서 온 total 확인: "+ total);
		List<Map<String,Object>> applyList = auctionMapper.selectApplyList(page); //검색어 없이 applyList 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 applyList 확인"+applyList.toString());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("total", total);
		resultMap.put("lastPage", lastPage);
		resultMap.put("applyList", applyList);
		
		return resultMap;
	}

	public Map<String, Object> getApplyOne(int applyId) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 applyId 학인 : "+ applyId);
		Map<String,Object> auctionList = auctionMapper.selectApplynOne(applyId); //상세정보 가져오는 mapper
		return auctionList;
	}
	
	// 옥션 등록 service
	public int addAuctionProduct(AuctionProductRegistration auctionProductRegistration) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 auctionProductRegistration확인"+auctionProductRegistration.toString());
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 auctionProductRegistration 학인 : "+ auctionProductRegistration);
		int cnt = auctionMapper.insertAuction(auctionProductRegistration);
		log.debug(Debuging.DEBUG+"4 mapper에서 온 cnt 확인: "+ cnt);
		
		if(cnt >0) {
			auctionMapper.updateConfirmationState(auctionProductRegistration.getApplyProductSalesDeliveryId()); 
		}
		return cnt;
	}
	
	//포인트 계산하는 Service
	public int confirmBeforeBid(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 map확인"+map.toString());
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 map 학인 : "+ map);
		
		int ablePoint = 0;
		
		int userPoint = auctionMapper.selectUserPoint(map); //현재 포인트 확인
		log.debug(Debuging.DEBUG+"4 mapper에서 온 userPoint 확인:"+userPoint);
		ablePoint = (int)map.get("newPrice") - userPoint; // 지금 포인트로 살수 있는지 계산

		int beforBidCnt = 0;
		beforBidCnt += auctionMapper.selectBeforeBidCnt(map); //아이디로 입찰한적 잇는지 확인
		
		if(beforBidCnt == 0) // 이 아이디로 입찰한적이 없다면,
		{
			log.debug(Debuging.DEBUG+"4 mapper에서 온 BeforBidId가 null = 입찰한적 없음");
			//없으면, 계산값출력
		} else { // 이 아이디로 입찰한적이 있다면,
			log.debug(Debuging.DEBUG+"4 mapper에서 온 beforBidCnt가"+beforBidCnt+"= 입찰했음");
			int beforeBidPrice = auctionMapper.selectBeforeBidPrice(map);	//이전 입찰정보를 찾는 mapper
			
			ablePoint = - beforeBidPrice;// 입찰한 값을 줄어준다. 
		}

		log.debug(Debuging.DEBUG+"값 계산 음수,0 가능, 양수 불가.:"+ablePoint);
		
		return ablePoint;
	}
	
	//입찰하는 Service
	public int insertBid(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 map확인"+map.toString());
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 map 학인 : "+ map);
		
		int cnt = 0;

		int beforBidCnt = auctionMapper.selectBeforeBidCnt(map); //아이디로 입찰한적 잇는지 확인
		
		if(beforBidCnt == 0) // 이 아이디로 입찰한적이 없다면,
		{
			log.debug(Debuging.DEBUG+"4 mapper에서 온 BeforBidId가 null = 입찰한적 없음");
			cnt += auctionMapper.insertBidding(map); //우선 매퍼로 입찰을 기록하고.
			log.debug(Debuging.DEBUG+"4 insertBidding mapper에서 온 cnt :"+cnt);
			Map<String, Object> MyBid = auctionMapper.selectBeforeBid(map); //나의 bid정보를 가져온다.
			cnt += auctionMapper.insertBidPointMinusByBid(MyBid); //그 정보로 mihus입찰에 넣는다.
			log.debug(Debuging.DEBUG+"4 insertBidPointMinusByBid mapper에서 온 cnt :"+cnt);
		} else { // 이 아이디로 입찰한적이 있다면,
			log.debug(Debuging.DEBUG+"4 mapper에서 온 beforBidCnt가"+beforBidCnt+"= 입찰했음");
			Map<String, Object> MyBid = auctionMapper.selectBeforeBid(map); //나의 bid정보를 가져온다.
			
			Map<String, Object> MyNewBid = new HashMap<String,Object>();
			MyNewBid.put("newPrice", map.get("newPrice"));
			MyNewBid.put("userId", map.get("userId"));
			MyNewBid.put("applyId", map.get("applyId"));
			MyNewBid.put("bidId", MyBid.get("bidId"));
			
			cnt += auctionMapper.updateBidding(MyNewBid); //그정보로 bid정보를 수정한다.
			log.debug(Debuging.DEBUG+"4 updateBidding mapper에서 온 cnt :"+cnt);
			cnt += auctionMapper.updateBidPointMinusByBid(MyNewBid); //그 정보로 mihus입찰에 넣는다.
			log.debug(Debuging.DEBUG+"4 updateBidPointMinusByBid mapper에서 온 cnt :"+cnt);
			
		}
		
		return cnt;
	}
	
	public int modifyPcrActuon() {
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 map확인"+"없음");
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 map 학인 : "+ "없음");
		
		return 0;
	}

}
