package com.gdj.cabbage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ApplyProductSalesService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class SellIndexController {
	
	@Autowired ApplyProductSalesService applyProductSalesService;
	
	@GetMapping("sellIndex")
	public String sellIndex() {
		return "sellIndex";
	}
	
	@GetMapping("addApplyProductSalesDelivery")
	public String addApplyProductSalesDelivery() {
		return "applyProductSales/addApplyProductSalesDelivery";
	}
	
	@GetMapping("getApplyProductSalesDeliveryList")
	public String getApplyProductSalesDeliveryList(Model model,
			@RequestParam(value="userId") int userId,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value= "rowPerPage", defaultValue = "12") int rowPerPage,
			@RequestParam(value="searchWord", required = false)String searchWord) {
		
		
		
		log.debug(Debuging.DEBUG + "[SellIndexController] [getApplyProductSalesDeliveryList] [param] -> userId : " + userId);
		
		List<Map<String,Object>> applyProductSalesDeliveryList = applyProductSalesService.getApplyProductSalesDeliveryList(userId);
		
		model.addAttribute("applyProductSalesDeliveryList", applyProductSalesDeliveryList);
		
		// 단일 변수 데이터
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		//model.addAttribute("pageSet", pageSet);
		//model.addAttribute("lastPage", lastPage);
				
		return "applyProductSales/getApplyProductSalesDeliveryList";
	}
}