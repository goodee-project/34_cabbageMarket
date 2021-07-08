// <!-- 작성자 : 강혜란 210707-->
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

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.AuctionService;
import com.gdj.cabbage.service.CategoryService;
import com.gdj.cabbage.vo.CategoryMain;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class AuctionController {
	@Autowired CategoryService categoryService;
	@Autowired AuctionService auctionService;
	
	@GetMapping("/getAuctionList")
	public String getAuctionList(Model model
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
			, @RequestParam(value="searchWord", required=false) String searchWord) {
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+currentPage+"<--currentPage");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+rowPerPage+"<--rowPerPage");
		log.debug(Debuging.DEBUG+"0 view에서 넘어온 param 확인:"+searchWord+"<--searchWord");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentPage", currentPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		log.debug(Debuging.DEBUG+"1 service에 보낼 map 확인: "+map.toString());
		
		Map<String,Object> resultMap =  auctionService.getAuctionList(map); //경매상품과 검색어에따른 total, lastpage, auctionList가져오는 서비스
		log.debug(Debuging.DEBUG+"5 service에서 받은 resultMap 확인 : "+resultMap.toString());
		
		List<CategoryMain> categoryMainList = categoryService.getCategoryMainList(); //카테고리를 불러오는 서비스
		log.debug(Debuging.DEBUG+"5 service에서 받은 list 확인 categoryMainList : "+categoryMainList);
		
	
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("categoryMainList", categoryMainList);
		model.addAttribute("auctionList", resultMap.get("auctionList"));
		model.addAttribute("total",resultMap.get("total"));
		model.addAttribute("lastPage",resultMap.get("lastPage"));
		model.addAttribute("categoryMainList", resultMap.get("categoryMainList"));		
		return "auction/getAuctionList";
	}
}