package com.gdj.cabbage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DirectTradeController {
	
	@GetMapping("directTradeList")
	public String directTradeList() {
		
		return "directTrade/directTradeList";
	}
}
