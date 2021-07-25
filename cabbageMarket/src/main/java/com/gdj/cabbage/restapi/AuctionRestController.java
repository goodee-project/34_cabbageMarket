package com.gdj.cabbage.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.AuctionService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AuctionRestController {
	
	@Autowired AuctionService auctionService;
	
	// 연관 상품 가져오기
	@GetMapping("/getRelatedProduct")
	public List<Map<String,Object>> getRelatedProduct(
			@RequestParam(value="subId") int subId) {
		
		log.debug(Debuging.DEBUG + "0 view에서 받아온 subId값 확인 : "+subId);
		log.debug(Debuging.DEBUG + "1 view에서 받아온 subId값 확인 : "+subId);

		List<Map<String,Object>> relatedAuctionList = auctionService.getAuctionListBySubId(subId);
		log.debug(Debuging.DEBUG + "5 Service에서 받어온 relatedAuctionList 확인 : " + relatedAuctionList.toString());
		
		return relatedAuctionList;		
	}
}
