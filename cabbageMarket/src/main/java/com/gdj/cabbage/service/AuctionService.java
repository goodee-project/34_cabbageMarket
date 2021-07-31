
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
import com.gdj.cabbage.vo.BiddingProductDelivery;
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
		log.debug(Debuging.DEBUG+"2 getAuctionList Controller에서 보낸 paramMap확인"+paramMap.toString());
		
		int beginRow = (((int)paramMap.get("currentPage")-1)*(int)paramMap.get("rowPerPage"));
		int pageSet = ((int)paramMap.get("currentPage")-1)/10;
		
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", ((int)paramMap.get("rowPerPage")));
		page.put("searchWord", ((String)paramMap.get("searchWord")));
		page.put("categoryMainId", ((String)paramMap.get("categoryMainId")));
		page.put("sortValue", ((int)paramMap.get("sortValue")));
		
		int total = (auctionMapper.selectAuctionForCount(page));
		int lastPage = (int)(Math.ceil((double)total / (int)paramMap.get("rowPerPage"))); //lastPage 계산
		
		log.debug(Debuging.DEBUG+"3 getAuctionList Service에서 mapper로 보낼 Page 학인 : "+ page.toString());
		
		log.debug(Debuging.DEBUG+"4 selectAuctionForCount Mapper에서 온 total 확인: "+ total);
		List<Map<String,Object>> auctionList = auctionMapper.selectAuctionList(page); //검색어 없이 auctionList 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectAuctionList Mapper에서 보낸 auctionList 확인"+auctionList.toString());
		
		List<CategoryMain> categoryMainList = categoryMapper.selectCategoryMain();//카테고리 메인을 불러오는 mapper
		log.debug(Debuging.DEBUG+"4 selectCategoryMain Mapper에서 보낸 categoryMainList확인"+categoryMainList.toString());
		
		List<Map<String,Object>> deadlineAuctionList = auctionMapper.selectAuctionListByDeadline(12); //검색어 없이 deadlineAuctionList 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectAuctionListByDeadline Mapper에서 보낸 deadlineAuctionList 확인"+deadlineAuctionList.toString());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("total", total);
		resultMap.put("lastPage", lastPage);
		resultMap.put("pageSet", pageSet);
		resultMap.put("auctionList", auctionList);
		resultMap.put("categoryMainList", categoryMainList);
		resultMap.put("deadlineAuctionList", deadlineAuctionList);
		
		return resultMap;
	}
	// 상품 상세정보 가져오는 서비스 : getAuctionOne
	public Map<String, Object> getAuctionOne(int applyId) {
		log.debug(Debuging.DEBUG+"2 getAuctionOne controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 getAuctionOne Service에서 mapper로 보낼 applyId 학인 : "+ applyId);
		Map<String,Object> auctionList = auctionMapper.selectAuctionOne(applyId); //상세정보 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectAuctionOne Mapper에서온 auctionList 학인 : "+ auctionList.toString());
		List<Map<String,Object>> bidInfo = auctionMapper.selectBidInfo(applyId); //Bid정보를 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectBidInfo Mapper에서온 bidInfo 학인 : "+ bidInfo.toString());
		
		Map<String,Object> resultMap = new HashMap <String,Object>();
		resultMap.put("bidInfo", bidInfo);
		resultMap.put("auctionList", auctionList);
		return resultMap;
	}
	// 상품 이미지들 불러오는 서비스 : getAuctionOne addAuction
	public List<String> getApplyImg(int applyId) {
		log.debug(Debuging.DEBUG+"2 getAuctionOne Controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 getApplyImg Service에서 mapper로 보낼 applyId 학인 : "+ applyId);
		List<String> auctionList = applyProductSalesMapper.selectApplyImgByKey(applyId); //이미지를 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectApplyImgByKey mapper에서 받은 applyId 학인 : "+ auctionList.toString());
		return auctionList;
	}
	// 상품등록시 상세 내용 불러오는 서비스
	public Map<String, Object> getApplyOne(int applyId) {
		log.debug(Debuging.DEBUG+"2 addAuction controller에서 보낸 applyId확인"+applyId);
		log.debug(Debuging.DEBUG+"3 getApplyOne Service에서 mapper로 보낼 applyId 학인 : "+ applyId);
		Map<String,Object> auctionList = auctionMapper.selectApplynOne(applyId); //상세정보 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 selectApplynOne mapper에서 받은 applyId 학인 : "+ auctionList.toString());
		return auctionList;
	}
	// 옥션 등록 service
	public int addAuctionProduct(AuctionProductRegistration auctionProductRegistration) {
		log.debug(Debuging.DEBUG+"2 addAuctionProduct controller에서 보낸 auctionProductRegistration확인"+auctionProductRegistration.toString());
		log.debug(Debuging.DEBUG+"3 addAuctionProduct Service에서 mapper로 보낼 auctionProductRegistration 학인 : "+ auctionProductRegistration);
		int cnt = auctionMapper.insertAuction(auctionProductRegistration);
		log.debug(Debuging.DEBUG+"4 insertAuction mapper에서 온 cnt 확인: "+ cnt);
		
		if(cnt >0) { //입력한게 있으면, 상태를 2번 경매로 바꾼다.
			auctionMapper.updateConfirmationState(auctionProductRegistration.getApplyProductSalesDeliveryId(),2); 
		}
		return cnt;
	}
	
	//입찰 포인트 계산하는 Service
	public int confirmBeforeBid(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+"2 calculatePoint controller에서 보낸 map확인"+map.toString());
		log.debug(Debuging.DEBUG+"3 confirmBeforeBid Service에서 mapper로 보낼 map 학인 : "+ map);
		
		int ablePoint = 0;
		
		int userPoint = auctionMapper.selectUserPoint(map); //현재 포인트 확인
		log.debug(Debuging.DEBUG+"4 selectUserPoint mapper에서 온 userPoint 확인:"+userPoint);
		ablePoint = (int)map.get("newPrice") - userPoint; // 지금 포인트로 살수 있는지 계산

		int beforBidCnt = 0;
		beforBidCnt += auctionMapper.selectBeforeBidCntByMap(map); //아이디로 입찰한적 잇는지 확인
		
		if(beforBidCnt == 0) // 이 아이디로 입찰한적이 없다면,
		{
			log.debug(Debuging.DEBUG+"4 selectBeforeBidCntByMap mapper에서 온 BeforBidId가 null = 입찰한적 없음");
			//없으면, 계산값출력
		} else { // 이 아이디로 입찰한적이 있다면,
			log.debug(Debuging.DEBUG+"4 selectBeforeBidCntByMap mapper에서 온 beforBidCnt가"+beforBidCnt+"= 입찰했음");
			int beforeBidPrice = auctionMapper.selectBeforeBidPrice(map);	//이전 입찰정보를 찾는 mapper
			
			ablePoint = - beforeBidPrice;// 입찰한 값을 줄어준다. 
		}

		log.debug(Debuging.DEBUG+"값 계산 음수,0 가능, 양수 불가.:"+ablePoint);
		
		return ablePoint;
	}
	
	//입찰하는 Service
	public int insertBid(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+"2 addBid controller에서 보낸 map확인"+map.toString());
		log.debug(Debuging.DEBUG+"3 addBid Service에서 mapper로 보낼 map 학인 : "+ map);
		
		int cnt = 210726;

		int beforBidCnt = auctionMapper.selectBeforeBidCntByMap(map); //아이디로 입찰한적 잇는지 확인
		
		if(beforBidCnt == 0) // 이 아이디로 입찰한적이 없다면,
		{
			log.debug(Debuging.DEBUG+"4 selectBeforeBidCntByMap mapper에서 온 BeforBidId가 null = 입찰한적 없음");
			int sellerId = auctionMapper.selectConfirmSellerByUserId(map);
			log.debug(Debuging.DEBUG+"4 selectConfirmSellerByUserId mapper에서 온 sellerId 확인 :"+sellerId);
			boolean confirm = (sellerId == (int)map.get("userId"));
			log.debug(Debuging.DEBUG+"4 기존 sellerId 비교결과 :"+confirm);
			if (confirm) {
				log.debug(Debuging.DEBUG+"4 confirm 비교결과 : 판매자 = 구매자");
				cnt = 210726;
			} else {
				log.debug(Debuging.DEBUG+"4 confirm비교결과 : 판매자 != 구매자");
				cnt = auctionMapper.insertBidding(map); //우선 매퍼로 입찰을 기록하고.
				log.debug(Debuging.DEBUG+"4 insertBidding mapper에서 온 입찰갯수 :"+cnt);
				Map<String, Object> MyBid = auctionMapper.selectBeforeBid(map); //나의 bid정보를 가져온다.
				cnt += auctionMapper.insertBidPointMinusByBid(MyBid); //그 정보로 mihus입찰에 넣는다.
				log.debug(Debuging.DEBUG+"4 insertBidPointMinusByBid mapper에서 온 cnt :"+cnt);
			}
		} else { // 이 아이디로 입찰한적이 있다면,
			log.debug(Debuging.DEBUG+"4 selectBeforeBidCntByMap mapper에서 온 beforBidCnt가"+beforBidCnt+"= 입찰했음");
			Map<String, Object> myOldBid = auctionMapper.selectBeforeBid(map); //나의 bid정보를 가져온다.
			
			List<Map<String, Object>> lastBid = auctionMapper.selectBidList( (int)map.get("applyId") ); //마지막 bid 가져오기
			
			if ( (int)myOldBid.get("price") < (int)lastBid.get(0).get("point") ) { //내 입찰보다 더 높은입찰이 있다면,
				Map<String, Object> myNewBid = new HashMap<String,Object>();
				myNewBid.put("newPrice", map.get("newPrice"));
				myNewBid.put("userId", map.get("userId"));
				myNewBid.put("applyId", map.get("applyId"));
				myNewBid.put("bidId", myOldBid.get("bidId"));
				
				cnt = auctionMapper.updateBidding(myNewBid); //그정보로 bid정보를 수정한다.
				log.debug(Debuging.DEBUG+"4 updateBidding mapper에서 온 cnt :"+cnt);
				cnt += auctionMapper.updateBidPointMinusByBid(myNewBid); //그 정보로 mihus입찰에 넣는다.
				log.debug(Debuging.DEBUG+"4 updateBidPointMinusByBid mapper에서 온 cnt :"+cnt);
			} else {
				cnt = 210727; //마지막입찰자=본인.
			}
		}
		
		return cnt;
	}
	
	//낙찰하는 Service
	public int modifyAuction() {
		log.debug(Debuging.DEBUG+"2 scheduler/modifyAuction controller에서 보낸 map확인"+"없음");
		log.debug(Debuging.DEBUG+"3 modifyAuction Service mapper로 보낼 map 학인 : "+ "없음");
		int cnt = 0;
		int check =0; 
		double commissionRate = auctionMapper.selectBidComissionRateForint(2) ; // 낙찰수수료 계산하기
		log.debug(Debuging.DEBUG+"4 selectBidComissionRateForint(2)에서온 경매수수료 비율 학인 : "+ commissionRate+"%");
		List<Map<String,Object>> timeOutList = auctionMapper.getTimeOutApplyId();
		log.debug(Debuging.DEBUG+"4 timeOutList에서온 시간지난 List 학인 : "+ timeOutList.toString());
		int c = timeOutList.size();
		log.debug(Debuging.DEBUG+"4 timeOutList에서온 시간지난 List.size 만큼 반복 학인 : "+ c);
		
		for(int i=0 ; i < c ; i++ ) {
			int applyId = (int)timeOutList.get(i).get("applyId");
			log.debug(Debuging.DEBUG+i+"번째 시간지난 아이템"+applyId+"등록번호 처리~"); 
			
			int bidCnt = auctionMapper.selectBeforeBidCntByApplyId( applyId );
			log.debug(Debuging.DEBUG+"4 selectBeforeBidCntByApplyId에서온 입찰이 몇개인지 학인 : "+ bidCnt);
			if (bidCnt > 0) { //입찰이 1개 이상 있다.
				int successBid = auctionMapper.selectCommisionByApplyId(applyId, 2);
				if (successBid == 0) { //근데 applyId로 낙찰로 입력된 수수료가 없다면, 유찰 낙찰 처리해야지~
					log.debug(Debuging.DEBUG+"입찰이 있다");
					List<Map<String, Object>> bidList = auctionMapper.selectBidList(applyId); // 마지막 아닌 Bid 리스트 뽑기
					log.debug(Debuging.DEBUG+"4 selectNotLastBidInfo에서온 입찰 학인 : "+ bidList.toString());
					int cc = bidList.size(); // LastBid의 사이즈를 구해서
					log.debug(Debuging.DEBUG+"4 selectNotLastBidInfo에서온 List.size 만큼 반복 학인 : "+ cc);
					
					if (cc > 1) { 
						check = 0;
						for (int j=1 ; j < cc ; j++) { //for문을 돌린다. 
							cnt += 1; //유찰갯수마다 1개.
							log.debug(Debuging.DEBUG+i+"번째 시간지난 아이템의"+j+"번째 유찰 처리중~"); 
							Map<String,Object> map = new HashMap<String,Object> ();
							map.put("applyId", (int)bidList.get(j).get("applyId"));
							map.put("bidId", (int)bidList.get(j).get("bidId"));
							map.put("point", (int)bidList.get(j).get("point"));
							log.debug(Debuging.DEBUG+"applyId 확인"+(int)bidList.get(j).get("applyId")+"="+applyId); 
							//map을 매번 다시 입력한다
							
							check += auctionMapper.insertBidPointPlusHistory( map ); //유찰입력
						}
					}
					//나음 bidList[0] 처리
					log.debug(Debuging.DEBUG+"유찰된 갯수 학인 : "+ check);
					log.debug(Debuging.DEBUG+i+"번째 시간지난 아이템의"+(cc+1)+"번째 경매=낙찰 처리중~"); 
					cnt += 1; //낙찰갯수마다 1개.
					
					Map<String,Object> lastBid= new HashMap<String,Object> ();
					lastBid.put("applyId", (int)bidList.get(0).get("applyId"));
					lastBid.put("bidId", (int)bidList.get(0).get("bidId"));
	
					int oldPoint = (int)bidList.get(0).get("point");
					log.debug(Debuging.DEBUG+"현재 lastBid에 있는 낙찰포인트oldPoint 확인 : "+ oldPoint); 
	
	
					int commission = (int)( oldPoint * commissionRate);
					log.debug(Debuging.DEBUG+"현재 경매수수료 비용으로 계산한 수수료commission 확인 : "+ commission);
					int newPoint = (oldPoint - commission);
					log.debug(Debuging.DEBUG+"현재 경매수수료 비용으로 계산한 판매자 포인트newPoint 확인 : "+ newPoint);
					
					
					lastBid.put("commission", commission );
					log.debug(Debuging.DEBUG+"3 mapper로 보낼 lastBid 확인 : "+ lastBid.toString());
					check = auctionMapper.insertBidCommisionByLastBid(lastBid); //수수료정보 입력
					log.debug(Debuging.DEBUG+"4 insertBidCommisionByLastBid에서온 수수료 입력된 갯수 학인 : "+ check); 
					
					lastBid.put("point", newPoint );
					check = auctionMapper.insertBidPointPlusByLastBid( lastBid ); //판매자에게낙찰입력
					log.debug(Debuging.DEBUG+"4 insertBidPointPlusByLastBid에서온 낙찰 입력된 갯수 학인 : "+ check); 
					
					auctionMapper.updateConfirmationState(applyId ,0); //pcr상태 판매로 변경
					log.debug(Debuging.DEBUG+"4 updateConfirmationState(0)으로 상태변환"); 
				}//success if
			}	else{
				log.debug(Debuging.DEBUG+"입찰이 없다");
			} //입찰갯수 bidCnt if()

		} //timeoutList	
			return cnt;
		}
	//연관상품 보여주기
	public List<Map<String,Object>>  getAuctionListBySubId(int categorySubId) {
		log.debug(Debuging.DEBUG+"2 getAuctionOne controller에서 보낸 int확인 : "+categorySubId);
		log.debug(Debuging.DEBUG+"3 getAuctionListBySubId에서 mapper로 보낼 int 학인 : "+ categorySubId);
		
		List<Map<String,Object>> relatedAuctionList = auctionMapper.selectAuctionListBySubId(categorySubId);
		log.debug(Debuging.DEBUG+"4 selectAuctionListBySubId mapper로 받아온 list 학인 : "+ relatedAuctionList.toString());
		return relatedAuctionList;
		}
	
	//입찰취소
	public int removeBid(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+"2 biddingList controller에서 보낸 map확인"+map.toString());
		log.debug(Debuging.DEBUG+"3 removeBid Service에서 mapper로 보낼 map 학인 : "+ map);
		
		int check = auctionMapper.insertBidPointPlusHistory( map );
		log.debug(Debuging.DEBUG+"4 insertBidPointPlusByLastBid에서온 유찰 입력된 갯수 학인 : "+ check); 
		
		return check;
		}
	
	// 경매상품 수정 페이지에 출력할 경매상품 정보, 모든 이미지
	public List<Map<String, Object>> getAuctionProductAndImgsByKey(int applyId){
		return auctionMapper.selectAuctionProductAndImgsByKey(applyId);
	}
	
	// 경매상품 수정
	public void modifyAuctionProduct(AuctionProductRegistration auctionProductRegistration){
		auctionMapper.updateAuctionProduct(auctionProductRegistration);
	}
	
	// 낙찰상품 배송지 입력
	public void addBiddingProductDelivery(BiddingProductDelivery biddingProductDelivery) {
		auctionMapper.insertBiddingProductDelivery(biddingProductDelivery);
	}
}//class
