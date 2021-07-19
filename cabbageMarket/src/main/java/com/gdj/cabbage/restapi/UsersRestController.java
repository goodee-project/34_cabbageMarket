package com.gdj.cabbage.restapi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.UsersMapper;
import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.PointsRechargeHistory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class UsersRestController {
@Autowired UsersMapper usersMapper;
@Autowired UsersService usersService;
	

	@GetMapping("/pointRecharge")
	public void pointRecharge(HttpSession session, @RequestParam(value="amount", required = true) int amount) {
		log.debug(Debuging.DEBUG+" amount : "+ amount);
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		int points = amount;
		
		PointsRechargeHistory prh = new PointsRechargeHistory();
		prh.setUserId(userId);
		prh.setPoints(points);
		log.debug(Debuging.DEBUG+" prh : "+prh);
		
		int row = usersMapper.pointRecharge(prh);
		if(row != 0) {
			usersSession = usersMapper.sessionUpdate(userId);
			session.setAttribute("usersSession", usersSession);
		}
		
		log.debug(Debuging.DEBUG+" 포인트 충전 성공 여부 : "+row);	
	}
	
	
}
