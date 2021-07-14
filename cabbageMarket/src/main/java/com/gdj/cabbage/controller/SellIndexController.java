package com.gdj.cabbage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ApplyProductSalesService;
import com.gdj.cabbage.vo.ApplyProductSalesDelivery;

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
	
	// 상품 판매 배송 신청 등록
	@GetMapping("addApplyProductSalesDelivery")
	public String addApplyProductSalesDelivery() {
		
		return "applyProductSales/addApplyProductSalesDelivery";
	}
	
	@PostMapping("addApplyProductSalesDelivery")
	public String addApplyProductSalesDelivery(ApplyProductSalesDelivery applyProductSalesDelivery,
			@RequestParam(value = "applyProductSalesDeliveryImgs", required = true)List<MultipartFile> applyProductSalesDeliveryImgs) {
	
		log.debug(Debuging.DEBUG + "--------------------------------[SellIndexController] [addApplyProductSalesDelivery] [applyProductSalesDelivery] -> applyProductSalesDelivery : " + applyProductSalesDelivery.getReturnAddress());
		log.debug(Debuging.DEBUG + "--------------------------------[SellIndexController] [addApplyProductSalesDelivery] [applyProductSalesDelivery] -> applyProductSalesDelivery : " + applyProductSalesDelivery.toString());
		log.debug(Debuging.DEBUG + "--------------------------------[SellIndexController] [addApplyProductSalesDelivery] [multipartFile] -> multipartFile : " + applyProductSalesDeliveryImgs.size());
		
		applyProductSalesService.addApplyProductSalesDelivery(applyProductSalesDelivery, applyProductSalesDeliveryImgs);
		
		return "redirect:/users/getDirectTradeList";
	}
	
	// 상품 판매 배송 신청 등록
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