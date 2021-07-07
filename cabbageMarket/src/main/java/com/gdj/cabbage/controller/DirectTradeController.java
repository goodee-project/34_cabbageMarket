// 작성자 : 김태훈
package com.gdj.cabbage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DirectTradeController {
	
	// 직거래 상품 리스트
	@GetMapping("directTradeList")
	public String directTradeList() {
		
		return "directTrade/directTradeList";
	}
	
	// 직거래 상품 디테일
	@GetMapping("directTradeOne")
	public String directTradeOne() {
		return "directTrade/directTradeOne";
	}
}
