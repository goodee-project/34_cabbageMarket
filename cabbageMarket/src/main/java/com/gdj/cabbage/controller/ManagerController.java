// 작성자 : 백영재
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ManagerService;
import com.gdj.cabbage.vo.Manager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager")
public class ManagerController {
	
@Autowired ManagerService managerService;

	// 관리자 목록
	@GetMapping("/getManagerList")
	public String getMangerList(Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		
		log.debug(Debuging.DEBUG+" currentPage : " + currentPage);
		log.debug(Debuging.DEBUG+" rowPerPage : " + rowPerPage);
		
		Map<String, Object> map = managerService.getManagerList(currentPage, rowPerPage);
		
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("managerList", map.get("managerList"));
		model.addAttribute("currentPage", currentPage);
		
		return "getManagerList";
	}

	// 관리자 수정 //
	// GET
	@GetMapping("/modifyManager")
	public String modifyBoard(Model model, @RequestParam(value = "managerId", required = true) int managerId) {

		

		return "modifyBoard";
	}

	// POST
	@PostMapping("/modifyBoard")
	public String modifyBoard(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+" map : " + map);
		managerService.modifyManager(map);

		return "redirect:/manager/managerIndex";
	}

	// 관리자 로그인 //
	// GET
	@GetMapping("/managerLogin")
	public String login() {
		return "managerLogin";
	}
	
	// POST
	@PostMapping("/managerLogin")
	public String login(HttpSession session, Manager manager) {
		log.debug(Debuging.DEBUG+" manager " + manager);
		
		Map<String, Object> managerSession = managerService.ManagerloginSession(manager);
		log.debug(Debuging.DEBUG+" managerSession : " + managerSession);
		
		if(managerSession != null) {
			session.setAttribute("managerSession", managerSession);
			
		}
		
		return "redirect:/manager/managerIndex";
	}

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
		
		log.debug("★★★★★★★ManagerController에서 addManager -> map : " + map);
		map.put("managerId", managerId);
		map.put("managerPassword", managerPassword);
		map.put("managerName", managerName);
		map.put("managerNickname", managerNickname);
		map.put("managerAddress", managerAddress);
		map.put("managerPhoneNumber", managerPhoneNumber);
		map.put("managerLevel", managerLevel);
		
		int addManager = managerService.addManager(map);
		log.debug("★★★★★★★ManagerController에서 addManager -> addManager : " + addManager);
		
		model.addAttribute("map", map);
		model.addAttribute("managerId", managerId);
		model.addAttribute("managerPassword", managerPassword);
		model.addAttribute("managerName", managerName);
		model.addAttribute("managerNickname", managerNickname);
		model.addAttribute("managerAddress", managerAddress);
		model.addAttribute("managerPhoneNumber", managerPhoneNumber);
		model.addAttribute("managerLevel", managerLevel);
		
		return "redirect:/manager/managerIndex";
	}

}