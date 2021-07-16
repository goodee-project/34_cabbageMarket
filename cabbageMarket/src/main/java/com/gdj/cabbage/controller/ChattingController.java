// 작성자 : 김태훈
package com.gdj.cabbage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ChattingService;
import com.gdj.cabbage.service.DirectTradeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChattingController {
	
	@Autowired ChattingService chattingService;
	@Autowired DirectTradeService directTradeService;
	
	// 채팅방 목록
	@GetMapping("users/getChattingRoomList")
	public String chattingRoomList(Model model,
			@RequestParam(value="userId") int userId) {
		
		log.debug(Debuging.DEBUG + "[ChattingController] [chattingRoomList] [param] -> userId : " + userId);
		
		// 채팅방 채팅내용 가져오기
		List<Map<String, Object>> chattingRoomList = chattingService.getChattingRoomList(userId);
		
		model.addAttribute("chattingRoomList", chattingRoomList);
		model.addAttribute("userId", userId);
		return "directTrade/getChattingRoomList";
	}
	
	// 채팅방 생성 및 채팅방 가져오기
	// 채팅방 정보 가져올때 채팅방이 생성되어있는지 체크
	@GetMapping("users/getChattingRoomOne")
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
		
		// 채팅 내용 정보 가져오기
		List<Map<String, Object>> chattingContentList = chattingService.getChattingContentList((int)ChattingRoomInfo.get("chattingRoomId"));

		// 상품 정보 가져오기
		Map<String, Object> productDetail = directTradeService.getDirectTradeProductOne(directTradeProductRegistrationId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("ChattingRoomInfo", ChattingRoomInfo);
		model.addAttribute("chattingContentList", chattingContentList);
		
		return "directTrade/getChattingRoomOne";
	}
	
}