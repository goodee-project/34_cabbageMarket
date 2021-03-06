// <!-- 작성자 : 강혜란 210712-->
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.UsersMapper;
import com.gdj.cabbage.service.AuctionService;
import com.gdj.cabbage.service.CategoryService;
import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.AuctionProductRegistration;
import com.gdj.cabbage.vo.BiddingProductDelivery;
import com.gdj.cabbage.vo.CategoryMain;
import com.gdj.cabbage.vo.DirectTradeProductRegistration;
import com.gdj.cabbage.vo.ShippingAddress;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class AuctionController {
	@Autowired CategoryService categoryService;
	@Autowired AuctionService auctionService;
	@Autowired UsersService usersService;
	@Autowired UsersMapper usersMapper;
	
	//addAuction ajax
    @RequestMapping(value = "/previewAuction", method = RequestMethod.POST)
    public String test7_1(Model model, AuctionProductRegistration auction) {
        
    	model.addAttribute("Map", auction);
        return "auction/addAuction :: #list";
    }//출처: https://joyhong.tistory.com/104 [옳은 길로..]
	
	
	//경매 상품 등록
	@GetMapping("addAuction")
	public String getApplyList(Model model
			, @RequestParam(value="applyId", defaultValue="1") int applyId) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 applyId 확인:"+applyId);
		
		log.debug(Debuging.DEBUG+"1 service에 보낼 applyId 확인: "+applyId);
		
		// 그냥 경매 상품 상세정보 + 이미지들 불러오기
		Map<String, Object> productDetail = auctionService.getApplyOne(applyId);
		List<String> imgPathList = auctionService.getApplyImg(applyId);
		
		
		model.addAttribute("applyId", applyId);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("imgPathList", imgPathList);
		return "auction/addAuction";
	}
	
	@PostMapping("addAuction")
	public String addDirectTrade(AuctionProductRegistration auctionProductRegistration) {
		
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+auctionProductRegistration+"<--auctionProductRegistration");

		int insertCount = auctionService.addAuctionProduct(auctionProductRegistration);
		log.debug(Debuging.DEBUG+"5 service에서 받은 insertCount 확인 : "+insertCount);
		
		return "redirect:/users/getAuctionList";
	}
	
	//경매 상품 리스트 출력
	@GetMapping("/getAuctionList")
	public String getAuctionList(Model model
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue="12") int rowPerPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="categoryMainId", required=false) String categoryMainId
			, @RequestParam(value="sortValue", defaultValue = "0")Integer sortValue) {
		
		if(searchWord != null && searchWord.equals("")) {
			searchWord = null;
		}
		
		if(categoryMainId != null && categoryMainId.equals("")) {
			categoryMainId = null;
		}
		
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+currentPage+"<--currentPage");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+rowPerPage+"<--rowPerPage");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+searchWord+"<--searchWord");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+categoryMainId+"<--categoryMainId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+sortValue+"<--sortValue");
		
		//페이징에 관한 정보 담기
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("currentPage", currentPage);
		page.put("rowPerPage", rowPerPage);
		page.put("searchWord", searchWord);
		page.put("categoryMainId", categoryMainId);
		page.put("sortValue", sortValue);
		log.debug(Debuging.DEBUG+"1 service에 보낼 map 확인: "+page.toString());
		
		Map<String,Object> resultMap =  auctionService.getAuctionList(page); //경매상품과 검색어에따른 total, lastpage, auctionList가져오는 서비스
		log.debug(Debuging.DEBUG+"5 service에서 받은 resultMap 확인 : "+resultMap.toString());
		
		List<CategoryMain> categoryMainList = categoryService.getCategoryMainList(); //카테고리를 불러오는 서비스
		log.debug(Debuging.DEBUG+"5 service에서 받은 list 확인 categoryMainList : "+categoryMainList);
	
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("categoryMainId",categoryMainId);
		model.addAttribute("sortValue",sortValue);
		model.addAttribute("categoryMainList", categoryMainList);
		model.addAttribute("auctionList", resultMap.get("auctionList"));
		model.addAttribute("total",resultMap.get("total"));
		model.addAttribute("lastPage",resultMap.get("lastPage"));
		model.addAttribute("pageSet",resultMap.get("pageSet"));
		model.addAttribute("categoryMainList", resultMap.get("categoryMainList"));		
		model.addAttribute("deadlineAuctionList", resultMap.get("deadlineAuctionList"));	
		return "auction/getAuctionList";
	}
	
	// 경매상품 상세보기
	@GetMapping("getAuctionOne")
	public String getAuctionOne(Model model
			,HttpServletRequest req
			,@RequestParam(value="applyId") int applyId) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--applyId");
			
		// 상품 상세정보 + 이미지들 불러오기
		Map<String, Object> resultMap = auctionService.getAuctionOne(applyId);
		List<String> imgPathList = auctionService.getApplyImg(applyId);
		log.debug(Debuging.DEBUG + "5 Service에서 받어온 resultMap 확인 : " + resultMap.toString());
		
		Map<String,Object> productDetail = (Map<String,Object>) resultMap.get("auctionList");
		
		// 연관상품 가져오기
		List<Map<String,Object>> relatedAuctionList = auctionService.getAuctionListBySubId( (int)productDetail.get("categorySubId") );
		log.debug(Debuging.DEBUG + "5 Service에서 받어온 relatedAuctionList 확인 : " + relatedAuctionList.toString());
		
		model.addAttribute("productDetail", resultMap.get("auctionList"));
		model.addAttribute("bidInfo", resultMap.get("bidInfo"));
		model.addAttribute("imgPathList", imgPathList);
		model.addAttribute("relatedAuctionList", relatedAuctionList);
		
		//FlashMap에 저장되어 전달된 값을 가져온다.
		 Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(req);
		   if(flashMap !=null) {  
			   if ( (Integer)flashMap.get("cnt") != null ) {
		       model.addAttribute("cnt", (int)flashMap.get("cnt"));
		       return "auction/getAuctionOneCnt";
			   } else {
				   return "auction/getAuctionOne";
			   }
		   } else {
			   model.addAttribute("ablePoint", 210725);
			   return "auction/getAuctionOne";
		   }
	}
	@PostMapping("getAuctionOne")
	public String getAuctionOnePost(Model model
			,HttpServletRequest req
			,@RequestParam(value="applyId") int applyId) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--post.applyId");
			
		// 상품 상세정보 + 이미지들 불러오기
		Map<String, Object> resultMap = auctionService.getAuctionOne(applyId);
		List<String> imgPathList = auctionService.getApplyImg(applyId);
		log.debug(Debuging.DEBUG + "5 Service에서 받어온 resultMap 확인 : " + resultMap.toString());
		
		Map<String,Object> productDetail = (Map<String,Object>) resultMap.get("auctionList");
		
		// 연관상품 가져오기
		List<Map<String,Object>> relatedAuctionList = auctionService.getAuctionListBySubId( (int)productDetail.get("categorySubId") );
		log.debug(Debuging.DEBUG + "5 Service에서 받어온 relatedAuctionList 확인 : " + relatedAuctionList.toString());
		
		model.addAttribute("productDetail", resultMap.get("auctionList"));
		model.addAttribute("bidInfo", resultMap.get("bidInfo"));
		model.addAttribute("imgPathList", imgPathList);
		model.addAttribute("relatedAuctionList", relatedAuctionList);
		//FlashMap에 저장되어 전달된 값을 가져온다.
		 Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(req);
		   if(flashMap !=null) {  
			   if ( (Integer)flashMap.get("cnt") != null ) {
		       model.addAttribute("cnt", (int)flashMap.get("cnt"));
		       return "auction/getAuctionOneCnt";
			   } else {
				   return "auction/getAuctionOne";
			   }
		   } else {
			   return "auction/getAuctionOne";
		   }
	}
	
	// 포인트 계산
	@PostMapping("calculatePoint")
	public String calculatePoint(RedirectAttributes redirectAttributes
			,HttpSession session
			,@RequestParam(value="applyId") int applyId
			,@RequestParam(value="newPrice") int newPrice) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--applyId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+newPrice+"<--newPrice");
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+userId+"<--userId");		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("applyId", applyId);
		map.put("newPrice", newPrice);
		map.put("userId", userId);
		log.debug(Debuging.DEBUG+"1 view에서 넘겨줄 map 확인:"+map.toString());		

		int ablePoint = auctionService.confirmBeforeBid(map);
		log.debug(Debuging.DEBUG+"5 service에서 받은 ablePoint 확인 : "+ablePoint);
		
		redirectAttributes.addFlashAttribute("ablePoint", ablePoint);
		return "redirect:/users/getAuctionOne?applyId="+applyId;
		}
	
	@PostMapping("addBid")
	public String addBid(RedirectAttributes redirectAttributes
			,HttpServletRequest req
			,HttpSession session
			,@RequestParam(value="applyId") int applyId
			,@RequestParam(value="newPrice") int newPrice){
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--applyId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+newPrice+"<--newPrice");
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+userId+"<--userId");		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("applyId", applyId);
		map.put("newPrice", newPrice);
		map.put("userId", userId);
		log.debug(Debuging.DEBUG+"1 view에서 넘겨줄 map 확인:"+map.toString());	
		
		int cnt = auctionService.insertBid(map);
		log.debug(Debuging.DEBUG+"5 service에서 받은 cnt 확인 : "+cnt);
		
		redirectAttributes.addFlashAttribute("cnt", cnt);
		//FlashMap에 전달할 값을 저장한다.
		 FlashMap fm = RequestContextUtils.getOutputFlashMap(req);
		 fm.put("cnt", cnt);
		if ( cnt!=0) {
			usersSession = usersMapper.sessionUpdate(userId);
			session.setAttribute("usersSession", usersSession);
		}
		return "redirect:/users/getAuctionOne?applyId="+applyId;
	}
	
	// 입찰삭제
	@PostMapping("removeBid")
	public String removeBid(Model model
			,HttpSession session
			,@RequestParam(value="bidId") int bidId
			,@RequestParam(value="point") int point) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+bidId+"<--bidId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+point+"<--point");
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+userId+"<--userId");		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bidId", bidId);
		map.put("point", point);
		map.put("userId", userId);
		log.debug(Debuging.DEBUG+"1 view에서 넘겨줄 map 확인:"+map.toString());		

		//결제가능한지 계산까지 해야할까요...
		//와 어차피 유찰인데 수수료무는건 너무한거 아닌가요...
		int cnt = auctionService.removeBid(map);
		if ( cnt!=0) {
			usersSession = usersMapper.sessionUpdate(userId);
			session.setAttribute("usersSession", usersSession);
		}
		return "redirect:/users/biddingList";
		}
	
	// 경매 상품 수정
	@GetMapping("modifyAuction")
	public String modifyAuction(Model model,
			@RequestParam(value="applyId") int applyId
		   ,@RequestParam(value="state") String state) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--applyId");
		
		// 경매정보 + 모든 이미지
		List<Map<String, Object>> AuctionProductAndImgsList = auctionService.getAuctionProductAndImgsByKey(applyId);
		
		model.addAttribute("applyId", applyId);
		model.addAttribute("state", state);
		model.addAttribute("AuctionProductAndImgsList", AuctionProductAndImgsList);
		return "auction/modifyAuction";
	}
	
	@PostMapping("modifyAuction")
	public String modifyAuction(AuctionProductRegistration auctionProductRegistration) {
		
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+auctionProductRegistration.toString()+"<--auctionProductRegistration");
		auctionService.modifyAuctionProduct(auctionProductRegistration);
		
		return "redirect:/users/getAuctionOne?applyId="+auctionProductRegistration.getApplyProductSalesDeliveryId();
	}
	
	// 배송지 입력 
	@GetMapping("addBiddingProductDelivery")
	public String addBiddingProductDelivery(HttpSession session, Model model,
			@RequestParam(value="applyId") int applyId) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+applyId+"<--applyId");
		
		// 상품 상세정보 + 이미지들 불러오기
		Map<String, Object> resultMap = auctionService.getAuctionOne(applyId);
		List<String> imgPathList = auctionService.getApplyImg(applyId);
				
		Map<String,Object> productDetail = (Map<String,Object>) resultMap.get("auctionList");
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		List<ShippingAddress> shippingAddressList = usersService.getAddressByUserId(userId);
		
		model.addAttribute("applyId", applyId);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("imgPathList", imgPathList);
		model.addAttribute("shippingAddressList", shippingAddressList);
		return "auction/addBiddingProductDelivery";
	}
	
	// 배송지 입력 Post처리
	@PostMapping("addBiddingProductDelivery")
	public String addBiddingProductDelivery(BiddingProductDelivery biddingProductDelivery) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+biddingProductDelivery.toString()+"<--biddingProductDelivery");
		
		auctionService.addBiddingProductDelivery(biddingProductDelivery);
		
		return "redirect:/users/boughtProductOne?applyId="+biddingProductDelivery.getApplyProductSalesDeliveryId() +"&type=2";
	}
}