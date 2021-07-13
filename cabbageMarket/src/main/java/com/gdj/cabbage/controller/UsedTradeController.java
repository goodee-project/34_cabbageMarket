// 작성자: 김희진
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.service.UsedTradeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class UsedTradeController {
	@Autowired UsedTradeService usedTradeService;
	
	//중고상품 목록
	@GetMapping("getUsedProductList")
	public String getUsedProductList(Model model, @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
												  @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
												  @RequestParam(value="searchWord", required = false) String searchWord,
												  @RequestParam(value="categoryName", required = false) String categoryName ) {
		log.debug("★★★★★★★★getUsedProductList() currentPage:" +currentPage);
		log.debug("★★★★★★★★getUsedProductList() rowPerPage:" +rowPerPage);
		log.debug("★★★★★★★★getUsedProductList() searchWord:" +searchWord);
		log.debug("★★★★★★★★getUsedProductList() categoryName:" +categoryName);
		
		if (categoryName != null && categoryName.equals("")) { //카테고리별 조회
			categoryName = null;
		}
		log.debug("★★★★★★★★categoryName : " + categoryName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		map.put("categoryName", categoryName);
		
		//페이징
		int usedProductTotal = usedTradeService.getUsedProductTotal(map);
		int lastPage = (int) Math.ceil((double)usedProductTotal/rowPerPage);
		
		//중고상품 목록 가져오기
		List<Map<String,Object>> usedProductList = usedTradeService.getUsedProductList(map);
		
		//model에 값 넣어주기
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("categoryName",categoryName);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("usedProductList",usedProductList);
		
		return "usedProduct/getUsedProductList";
	}

	
	
	//중고상품 상세
	@GetMapping("getUsedProductOne")
	public String getUsedProductOne() {
		
		return "usedProduct/getUsedProductOne";
	}
}
