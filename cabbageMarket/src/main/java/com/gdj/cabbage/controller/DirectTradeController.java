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
import org.springframework.web.multipart.MultipartFile;

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
			@RequestParam(value="searchWord", required = false)String searchWord,
			@RequestParam(value="categoryMainId", required = false)String categoryMainId,
			@RequestParam(value="sortValue", required = false)Integer sortValue,
			@RequestParam(value="reservationState", required = false)String reservationState) {
		
		if(searchWord != null && searchWord.equals("")) {
			searchWord = null;
		}
		
		if(categoryMainId != null && categoryMainId.equals("")) {
			categoryMainId = null;
		}
		
		if(reservationState != null && reservationState.equals("")) {
			reservationState = null;
		}
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> currentPage : " + currentPage);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> rowPerPage : " + rowPerPage);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> searchWord : " + searchWord);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> categoryMainId : " + categoryMainId);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> sortValue : " + sortValue);
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> reservationState : " + reservationState);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("categoryMainId", categoryMainId);
		paramMap.put("sortValue", sortValue);
		paramMap.put("reservationState", reservationState);
		
		int pageSet = (currentPage-1)/10;
		int directProductTotal = directTradeService.getDirectTradeProductTotal(paramMap);
		int lastPage = (int)Math.ceil((double)directProductTotal / rowPerPage);
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeList] [param] -> lastPage : " + lastPage);
		
		// 직거래 상품 리스트
		List<Map<String, Object>> DirectTradeProductRegistrationList = 
				directTradeService.getDirectTradeProductList(paramMap);
		
		// 직거래 상품 6개 랜덤 추출
		List<Map<String, Object>> DirectTradeProductRegistrationRand6 = 
				directTradeService.getDirectTradeProductRand6();

		// 리스트 데이터
		model.addAttribute("DirectTradeProductRegistrationList", DirectTradeProductRegistrationList);
		model.addAttribute("DirectTradeProductRegistrationRand6", DirectTradeProductRegistrationRand6);
		
		// 단일 변수 데이터
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("categoryMainId", categoryMainId);
		model.addAttribute("sortValue", sortValue);
		model.addAttribute("pageSet", pageSet);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("directProductTotal", directProductTotal);
		model.addAttribute("reservationState", reservationState);
		
		return "directTrade/getDirectTradeList";
	}
	
	// 직거래 상품 디테일
	@GetMapping("getDirectTradeOne")
	public String getDirectTradeOne(Model model,
			@RequestParam(value="directTradeProductRegistrationId") int directTradeProductRegistrationId) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [getDirectTradeOne] [param] -> directTradeProductRegistrationId : " + directTradeProductRegistrationId);
		
		// 상품 상세정보
		Map<String, Object> productDetail = directTradeService.getDirectTradeProductOne(directTradeProductRegistrationId);
		List<String> imgNameList = directTradeService.getDirectTradeProductImg(directTradeProductRegistrationId);
		String sellerNickname = directTradeService.getNicknameBydtprKey(directTradeProductRegistrationId);
		
		// 관련 상품 정보
		List<Map<String, Object>> relatedDirectProductList = directTradeService.getRelatedDirectProduct((int)productDetail.get("categoryMiddleId"));
		
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("imgNameList", imgNameList);
		model.addAttribute("sellerNickname", sellerNickname);
		model.addAttribute("relatedDirectProductList", relatedDirectProductList);
		
		return "directTrade/getDirectTradeOne";
	}
	
	// 직거래 상품 등록
	@GetMapping("addDirectTrade")
	public String addDirectTrade() {
		return "directTrade/addDirectTrade";
	}
	
	@PostMapping("addDirectTrade")
	public String addDirectTrade(DirectTradeProductRegistration directTradeProductRegistration,
				@RequestParam(value = "directTradeProductImgs", required = true)List<MultipartFile> directTradeProductImgs) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addDirectTrade] [directTradeProductRegistration] -> directTradeProductRegistration : " + directTradeProductRegistration.toString());
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addDirectTrade] [multipartFile] -> multipartFile : " + directTradeProductImgs.size());
		
		directTradeService.addDirectTradeProduct(directTradeProductRegistration, directTradeProductImgs);
		
		return "redirect:/users/getDirectTradeList";
	}
	
	// 직거래 상품 수정
	@GetMapping("modifyDirectTrade")
	public String modifyDirectTrade(Model model,
			@RequestParam(value="directTradeProductRegistrationId") int directTradeProductRegistrationId) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [directTradeOne] [param] -> directTradeProductRegistrationId : " + directTradeProductRegistrationId);
		
		// 상품 상세정보
		Map<String, Object> productDetail = directTradeService.getDirectTradeProductOne(directTradeProductRegistrationId);
		List<String> imgNameList = directTradeService.getDirectTradeProductImg(directTradeProductRegistrationId);
		
		model.addAttribute("directTradeProductRegistrationId", directTradeProductRegistrationId);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("imgNameList", imgNameList);
		
		return "directTrade/modifyDirectTrade";
	}
	
	@PostMapping("modifyDirectTrade")
	public String modifyDirectTrade(DirectTradeProductRegistration directTradeProductRegistration) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeController] [addDirectTrade] [directTradeProductRegistration] -> directTradeProductRegistration : " + directTradeProductRegistration.toString());
		
		// 상품 정보 수정
		directTradeService.modifyDirectTradeProduct(directTradeProductRegistration);
		
		return "redirect:/users/getDirectTradeOne?directTradeProductRegistrationId=" + directTradeProductRegistration.getDirectTradeProductRegistrationId();
	}
}