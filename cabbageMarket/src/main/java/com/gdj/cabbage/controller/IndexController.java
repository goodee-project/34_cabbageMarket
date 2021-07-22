//작성자 : 김희진
package com.gdj.cabbage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdj.cabbage.mapper.IndexMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	@Autowired IndexMapper indexMapper;
	
	@GetMapping("/index")
	public String index(Model model) {
	
	List<Map<String, Object>> directTradeProductList = indexMapper.selectDirectProductListForIndex(); //직거래상품
	List<Map<String, Object>> auctionProductList = indexMapper.selectAuctionProductForIndex(); //경매상품
	List<Map<String, Object>> usedProductList = indexMapper.selectUsedProductForIndex(); //중고상품
	
	//디버깅
	log.debug("[CONTROLLER INDEX] directTradeProductList: "+directTradeProductList);
	log.debug("[CONTROLLER INDEX] auctionProductList: "+auctionProductList);
	log.debug("[CONTROLLER INDEX] usedProductList: "+usedProductList);
			
	model.addAttribute("directTradeProductList", directTradeProductList);
	model.addAttribute("auctionProductList", auctionProductList);
	model.addAttribute("usedProductList", usedProductList);
	
	return "index";
	
	}
}