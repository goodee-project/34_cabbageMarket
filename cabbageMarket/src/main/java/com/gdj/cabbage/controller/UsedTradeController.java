// 작성자: 김희진
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

import com.gdj.cabbage.service.UsedTradeService;
import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.UsedProductRegistration;

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
												  @RequestParam(value="searchWord", required = false) String searchWord ) {
		//디버깅
		log.debug("★★★★★★★★getUsedProductList() currentPage:" +currentPage);
		log.debug("★★★★★★★★getUsedProductList() rowPerPage:" +rowPerPage);
		log.debug("★★★★★★★★getUsedProductList() searchWord:" +searchWord);

		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		
		//페이징
		int usedProductTotal = usedTradeService.getUsedProductTotal(map);
		int lastPage = (int) Math.ceil((double)usedProductTotal/rowPerPage);
		
		//중고상품 목록 가져오기
		List<Map<String,Object>> usedProductList = usedTradeService.getUsedProductList(map);
		
		//model에 값 넣어주기
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("usedProductList",usedProductList);
		
		//getUsedProductList 페이지로 반환
		return "usedProduct/getUsedProductList";
	}

	
	//중고상품 상세
	@GetMapping("getUsedProductOne")
	public String getUsedProductOne(Model model, @RequestParam(value="applyId")int applyId) {
		log.debug("★★★★★★★controller getUsedProductOne() applyId:" + applyId); //디버깅
		
		//중고상품 상세 details 가져오기
		Map<String,Object> usedProductDetail = usedTradeService.getUsedProductOne(applyId);
		log.debug("★★★★★★★controller getUsedProductOne() UsedProductDetail:" + usedProductDetail); //디버깅
		
		//중고상품 이미지 img 가져오기
		List<String> imgNameList = usedTradeService.getUsedProductImg(applyId);
		log.debug("★★★★★★★controller getUsedProductOne() usedProductImg:" + imgNameList); //디버깅
		
		//model에 값 넣어주기
		model.addAttribute("usedProductDetail", usedProductDetail);
		model.addAttribute("imgNameList", imgNameList);
		
		//getUsedProductOne 페이지로 반환
		return "usedProduct/getUsedProductOne";
	}
	
	
	//중고상품 등록
	@GetMapping("addUsedProduct") //주소창에 요청
	public String addUsedProduct(Model model, @RequestParam (value="applyId", required = true) int applyId) {
		model.addAttribute("applyId", applyId);
		return "usedProduct/addUsedProduct";
	}
	
	@PostMapping("addUsedProduct") //form 요청(처리)
	public String addUsedProduct(UsedProductRegistration usedProductRegistration, ProductConfirmationRegistration productConfirmationRegistration) {
		log.debug("★★★★★★controller addUsedProduct() usedProductRegistration :"+usedProductRegistration);//디버깅
		log.debug("★★★★★★controller addUsedProduct() productConfirmationRegistration :"+productConfirmationRegistration);//디버깅
		
		//서비스호출
		usedTradeService.addUsedProduct(usedProductRegistration, productConfirmationRegistration);
		
		
		//getUsedProductList로 재요청 
		return "redirect:/users/getUsedProductList";
	}
	
}
