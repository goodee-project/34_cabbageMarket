package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.service.ManagerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ManagerController {
	
@Autowired ManagerService managerService;

	// 관리자 추가 //
	// 폼
	@GetMapping("/addManager")
	public String addManager() {
		
		return "addManager";
	}
	
	// 액션
	@PostMapping("/addManager")
	public String addManager(Model model,
			@RequestParam(value = "managerId", required = false) String managerId,			
			@RequestParam(value = "managerPassword", required = false) String managerPassword,			
			@RequestParam(value = "managerName", required = false) String managerName,			
			@RequestParam(value = "managerNickname", required = false) String managerNickname,			
			@RequestParam(value = "managerAddress", required = false) String managerAddress,			
			@RequestParam(value = "managerPhoneNumber", required = false) Integer managerPhoneNumber,			
			@RequestParam(value = "managerLevel", required = false) Integer managerLevel) {
		
		log.debug("★★★★★★★ManagerController에서 addManager -> managerId : " + managerId);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerPassword : " + managerPassword);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerName : " + managerName);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerNickname : " + managerNickname);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerAddress : " + managerAddress);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerPhoneNumber : " + managerPhoneNumber);
		log.debug("★★★★★★★ManagerController에서 addManager -> managerLevel : " + managerLevel);
		
		Map<String, Object> map = new HashMap<>();
		
		
		
		return "redirect:/admin/index";
	}

}