// 작성자 : 김태훈
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.DirectTradeService;
import com.gdj.cabbage.vo.DirectTradeProductRegistration;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class DirectTradeController {
	
	@Autowired DirectTradeService directTradeService;
	
	// 직거래 상품 리스트
	@GetMapping("getDirectTradeList")
	public String getDirectTradeList(Model model,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value= "rowPerPage", defaultValue = "12") int rowPerPage,
			@RequestParam(value="searchWord", required = false)String searchWord) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addManager] [param] -> currentPage : " + currentPage);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addManager] [param] -> rowPerPage : " + rowPerPage);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addManager] [param] -> searchWord : " + searchWord);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// 직거래 상품 리스트
		List<Map<String, Object>> DirectTradeProductRegistrationList = 
				directTradeService.getDirectTradeProductList(paramMap);
		
		// 리스트 데이터
		model.addAttribute("DirectTradeProductRegistrationList", DirectTradeProductRegistrationList);
		
		return "directTrade/getDirectTradeList";
	}
	
	// 직거래 상품 디테일
	@GetMapping("getDirectTradeOne")
	public String getDirectTradeOne(Model model,
			@RequestParam(value="directTradeProductRegistrationId") int directTradeProductRegistrationId) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [directTradeOne] [param] -> directTradeProductRegistrationId : " + directTradeProductRegistrationId);
		
		// 상품 상세정보
		Map<String, Object> productDetail = directTradeService.getDirectTradeProductOne(directTradeProductRegistrationId);
		List<String> imgPathList = directTradeService.getDirectTradeProductImg(directTradeProductRegistrationId);
		
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("imgPathList", imgPathList);
		
		return "directTrade/getDirectTradeOne";
	}
	
	// 직거래 상품 등록
	@GetMapping("addDirectTrade")
	public String addDirectTrade() {
		return "directTrade/addDirectTrade";
	}
	
	@PostMapping("addDirectTrade")
	public String addDirectTrade(DirectTradeProductRegistration directTradeProductRegistration) {
		return "redirect:/users/getDirectTradeList";
	}
}