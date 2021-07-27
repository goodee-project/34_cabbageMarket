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
import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.BuyingCommissionsHistory;
import com.gdj.cabbage.vo.BuyingPointsUsingHistory;
import com.gdj.cabbage.vo.BuyingProductDelivery;
import com.gdj.cabbage.vo.BuyingUsedProduct;
import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.ShippingAddress;
import com.gdj.cabbage.vo.UsedProductRegistration;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class UsedTradeController {
	@Autowired
	UsedTradeService usedTradeService;
	@Autowired
	UsersService usersService;

	// 중고상품 목록
	@GetMapping("getUsedProductList")
	public String getUsedProductList(Model model,
												 @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
												 @RequestParam(value = "rowPerPage", defaultValue = "9") int rowPerPage,
												 @RequestParam(value = "searchWord", required = false) String searchWord,
												 @RequestParam(value = "categoryMainId", required = false) String categoryMainId,
												 @RequestParam(value = "sortBy", required = false) Integer sortBy) {
		
		// 디버깅
		log.debug("★★★★★getUsedProductList() currentPage:" + currentPage);
		log.debug("★★★★★getUsedProductList() rowPerPage:" + rowPerPage);
		log.debug("★★★★★getUsedProductList() searchWord:" + searchWord);
		log.debug("★★★★★getUsedProductList() categoryMainId:" + categoryMainId);
		log.debug("★★★★★getUsedProductList() sortBy:" + sortBy);

		// 검색 searchWord
		if (searchWord != null && searchWord.equals("")) {
			searchWord = null;
		}
		// 카테고리 대분류 조회
		if (categoryMainId != null && categoryMainId.equals("")) {
			categoryMainId = null;
		}
		
		// HashMap 생성 - > map에 값 넣어주기
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage - 1) * rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		map.put("categoryMainId", categoryMainId);
		map.put("sortBy", sortBy);

		// 페이징
		int usedProductTotal = usedTradeService.getUsedProductTotal(map); // 중고상품 Total
		int lastPage = (int) Math.ceil((double) usedProductTotal / rowPerPage); // 마지막 페이지
		int pageSet = (currentPage - 1) / 10;

		// 중고상품 목록 가져오기
		List<Map<String, Object>> usedProductList = usedTradeService.getUsedProductList(map);
		
		// 마감입박한 상품 목록 
		List<Map<String, Object>> deadlineImminentProduct = usedTradeService.getDeadlineImminentProduct6();

		// model에 값 넣어주기
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("categoryMainId", categoryMainId);
		model.addAttribute("sortBy", sortBy);
		model.addAttribute("usedProductTotal", usedProductTotal);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageSet", pageSet);
		model.addAttribute("usedProductList", usedProductList); //중고상품 목록
		model.addAttribute("deadlineImminentProduct", deadlineImminentProduct); //마감 임박한 중고상품 6개

		// getUsedProductList 페이지로 반환
		return "usedProduct/getUsedProductList";
	}

	// 중고상품 상세
	@GetMapping("getUsedProductOne")
	public String getUsedProductOne(Model model, @RequestParam(value = "applyId", required = true) int applyId) {
		log.debug("★★★★★controller getUsedProductOne() applyId:" + applyId); // 디버깅

		// 중고상품 상세 details
		Map<String, Object> usedProductDetail = usedTradeService.getUsedProductOne(applyId);
		log.debug("★★★★★controller getUsedProductOne() UsedProductDetail:" + usedProductDetail); // 디버깅

		// 중고상품 이미지 img
		List<String> imgNameList = usedTradeService.getUsedProductImg(applyId);
		log.debug("★★★★★controller getUsedProductOne() usedProductImg:" + imgNameList); // 디버깅

		// 관련된 중고상품(random 4개)
		List<Map<String, Object>> relatedUsedProductList = usedTradeService.getRelatedUsedProduct((int)usedProductDetail.get("categoryMiddleId"));
		log.debug("★★★★★controller getUsedProductOne() relatedUsedProductList:" + relatedUsedProductList); // 디버깅

		// model에 값 넣어주기
		model.addAttribute("usedProductDetail", usedProductDetail);
		model.addAttribute("imgNameList", imgNameList);
		model.addAttribute("relatedUsedProductList", relatedUsedProductList);

		// getUsedProductOne 페이지로 반환
		return "usedProduct/getUsedProductOne";
	}

	// 중고상품 등록
	@GetMapping("addUsedProduct") // 주소창에 요청
	public String addUsedProduct(Model model, @RequestParam(value = "applyId", required = true) int applyId) {
		model.addAttribute("applyId", applyId);
		
		return "usedProduct/addUsedProduct";
	}

	@PostMapping("addUsedProduct") // form 요청 - 처리
	public String addUsedProduct(UsedProductRegistration usedProductRegistration,
			ProductConfirmationRegistration productConfirmationRegistration) {
		// 디버깅 - 객체 디버깅은 toString() 사용.
		log.debug("★★★★★controller addUsedProduct() usedProductRegistration :" + usedProductRegistration.toString());
		log.debug("★★★★★controller addUsedProduct() productConfirmationRegistration :"
				+ productConfirmationRegistration.toString());

		// 서비스호출
		usedTradeService.addUsedProduct(usedProductRegistration, productConfirmationRegistration);

		// getUsedProductList로 재요청
		return "redirect:/users/getUsedProductList";
	}

	// 중고상품 수정
	@GetMapping("modifyUsedProduct")
	public String modifyUsedProduct(Model model, @RequestParam(value = "applyId", required = true) int applyId,
												 @RequestParam(value = "state", required = true) String state) {
		log.debug("★★★★★modifyUsedProduct() applyId :" + applyId); // 디버깅
		log.debug("★★★★★modifyUsedProduct() state :" + state); // 디버깅

		// 중고상품 상세 details 
		Map<String, Object> usedProductDetail = usedTradeService.getUsedProductOne(applyId);
		log.debug("★★★★★controller modifyUsedProduct() UsedProductDetail:" + usedProductDetail); // 디버깅
		
		//중고상품 이미지
		List<String> imgNameList = usedTradeService.getUsedProductImg(applyId);
		log.debug("★★★★★controller modifyUsedProduct() imgNameList:" + imgNameList); // 디버깅

		// model에 usedProductDetail (중고상품 상세 정보) 넣어주기.
		model.addAttribute("usedProductDetail", usedProductDetail);
		model.addAttribute("imgNameList", imgNameList);
		model.addAttribute("state", state);

		return "usedProduct/modifyUsedProduct";
	}

	@PostMapping("modifyUsedProduct")
	public String modifyUsedProduct(UsedProductRegistration usedProductRegistration) {
		// 디버깅 - 객체 디버깅은 toString() 사용.
		log.debug("☆☆☆☆☆controller modifyUsedProduct() usedProductRegistration :" + usedProductRegistration.toString());

		usedTradeService.modifyUsedProduct(usedProductRegistration);

		return "redirect:/users/getUsedProductOne?applyId=" + usedProductRegistration.getApplyProductSalesDeliveryId();
	}

	// 중고상품 구매
	@GetMapping("buyUsedProduct")
	public String buyUsedProduct(Model model, @RequestParam(value = "applyId", required = true) int applyId,
			@RequestParam(value = "userId", required = true) int userId) {
		log.debug("★★★★★controller getUsedProductForBuy() applyId :" + applyId); // 디버깅

		Map<String, Object> productForBuy = usedTradeService.getUsedProductOneForBuy(applyId);// 구매할 상품 정보
		log.debug("★★★★★controller getUsedProductForBuy() productForBuy :" + productForBuy); // 디버깅

		List<ShippingAddress> shippingAddress = usersService.getAddressByUserId(userId);// 배송지 정보
		log.debug("★★★★★controller getUsedProductForBuy() ShippingAddress :" + shippingAddress); // 디버깅

		model.addAttribute("productForBuy", productForBuy);
		model.addAttribute("shippingAddress", shippingAddress);

		return "usedProduct/buyUsedProduct";

	}

	@PostMapping("buyUsedProduct")
	public String buyUsedProduct(
			@RequestParam(value = "applyProductSalesDeliveryId", required = true) int applyProductSalesDeliveryId,
			@RequestParam(value = "userId", required = true) int userId,
			@RequestParam(value = "productPrice", required = true) int productPrice,
			@RequestParam(value = "shippingAddressId", required = true) int shippingAddressId,
			@RequestParam(value = "deliveryRequests") String deliveryRequests) {
		// 디버깅
		log.debug("applyProductSalesDeliveryId :" + applyProductSalesDeliveryId);
		log.debug("userId :" + userId);
		log.debug("productPrice :" + productPrice);
		log.debug("shippingAddressId :" + shippingAddressId);
		log.debug("deliveryRequests :" + deliveryRequests);

		Map<String, Object> map = new HashMap<>();
		map.put("applyProductSalesDeliveryId", applyProductSalesDeliveryId);
		map.put("userId", userId);
		map.put("productPrice", productPrice);
		map.put("shippingAddressId", shippingAddressId);
		map.put("deliveryRequests", deliveryRequests);

		usedTradeService.buyUsedProduct(map);

		return "redirect:/users/buyingList";
	}
}
