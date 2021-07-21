package com.gdj.cabbage.restapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.DirectTradeService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class DirectTradeRestController {
	
	@Autowired DirectTradeService directTradeService;
	
	// 주소 목록 가져오기
	@GetMapping("/modifyProductState")
	public void modifyProductState(
			@RequestParam(value="directTradeProductRegistrationId") int directTradeProductRegistrationId,
			@RequestParam(value="productState", defaultValue = "1") int productState) {
		
		log.debug(Debuging.DEBUG + "[DirectTradeRestController] [modifyProductState] [param] -> directTradeProductRegistrationId : " + directTradeProductRegistrationId);
		log.debug(Debuging.DEBUG + "[DirectTradeRestController] [modifyProductState] [param] -> productState : " + productState);
		
		directTradeService.modifyProductStateByKey(directTradeProductRegistrationId, productState);
		
	}
}
