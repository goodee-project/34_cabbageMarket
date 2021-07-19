package com.gdj.cabbage.restapi;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.ShippingAddress;

@RestController
public class ShippingAddressController {
	@Autowired UsersService usersService;

	// 주소 목록 가져오기
	@GetMapping("/getShippingAddress")
	public List<ShippingAddress> shippingAddress(HttpSession session) {
	Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
	int userId = (Integer)usersSession.get("userId");
	
	return usersService.getAddressByUserId(userId);
	}
}