// 작성자 : 김태훈
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ChattingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/users")
public class ChattingController {
	
	@Autowired ChattingService chattingService;
	
	// 채팅방 목록
	@GetMapping("getChattingRoomList")
	public String chattingRoomList(Model model,
			@RequestParam(value="userId") int userId) {
		
		log.debug(Debuging.DEBUG + "[ChattingController] [chattingRoomList] [param] -> userId : " + userId);
		
		// 채팅방 채팅내용 가져오기
		List<Map<String, Object>> chattingRoomList = chattingService.getChattingRoomList(userId);
		
		model.addAttribute("chattingRoomList", chattingRoomList);
		model.addAttribute("userId", userId);
		return "directTrade/getChattingRoomList";
	}
	
	// 채팅방 가져오기
	@GetMapping("getChattingRoomOne")
	public String chattingRoom(Model model,
			@RequestParam(value="directTradeProductRegistrationId") int directTradeProductRegistrationId,
			@RequestParam(value="userId") int userId) {
		
		log.debug(Debuging.DEBUG + "[ChattingController] [chattingRoom] [param] -> directTradeProductRegistrationId : " + directTradeProductRegistrationId);
		log.debug(Debuging.DEBUG + "[ChattingController] [chattingRoom] [param] -> userId : " + userId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("directTradeProductRegistrationId", directTradeProductRegistrationId);
		map.put("userId", userId);
		
		// 판매자 ID 가져오기
		Integer sellerId = chattingService.getSellerId(directTradeProductRegistrationId);
		map.put("sellerId", sellerId);
		
		// 채팅방 정보 가져오기
		Map<String, Object> ChattingRoomInfo = chattingService.getChattingRoomOne(map);
		
		// 채팅방 채팅내용 가져오기
		List<Map<String, Object>> chattingContentList = chattingService.getChattingContentList((int)ChattingRoomInfo.get("chattingRoomId"));
		
		model.addAttribute("userId", userId);
		model.addAttribute("ChattingRoomInfo", ChattingRoomInfo);
		model.addAttribute("chattingContentList", chattingContentList);
		
		return "directTrade/getChattingRoomOne";
	}
}