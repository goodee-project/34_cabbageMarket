// 작성자 : 백영재
package com.gdj.cabbage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerIndexController {
	
	@GetMapping("/managerIndex")
	public String index() {
		return "managerIndex";
	}
}