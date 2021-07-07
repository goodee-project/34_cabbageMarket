package com.gdj.cabbage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsersController {
	@Autowired UsersService usersService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Users users) {
		log.debug(Debuging.DEBUG+" users "+users);
		
		Map<String, Object> usersSession = usersService.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession : "+usersSession);
		
		if(usersSession != null) {
			session.setAttribute("usersSession", usersSession);
		}else {
			return "login";
		}
		
		return "redirect:/index";
	}
	
	@GetMapping("/registerUser")
	public String register() {
		return "registerUser";
	}
	
	
}
