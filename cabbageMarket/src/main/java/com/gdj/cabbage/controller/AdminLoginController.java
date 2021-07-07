package com.gdj.cabbage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@GetMapping("/managerLogin")
	public String login() {
		return "managerLogin";
	}

}
