package com.gdj.cabbage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.service.ChattingService;
import com.gdj.cabbage.vo.ChattingContent;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@Autowired ChattingService chattingService;
	
	@MessageMapping("/sendMessage/{chattingRoomId}")
	@SendTo("/subscribe/chat/{chattingRoomId}")
	public Map<String, Object> broadcasting(ChattingContent chattingContent) {
	 	
		log.debug(Debuging.DEBUG + "[ChatController] [broadcasting] [chattingContent] -> chattingContent : " + chattingContent.toString());
		
		// DB에 채팅내용 입력
		chattingService.addChattingContent(chattingContent);
		
		// 입력한 채팅내용을 반환하기 위한 map
		Map<String, Object> map = chattingService.getNickNameAndCreateDate(chattingContent.getChattingContentId());
		map.put("content", chattingContent.getContent());
		map.put("userId", chattingContent.getUserId());
		map.put("chattingRoomId", chattingContent.getChattingRoomId());
		
		log.debug(Debuging.DEBUG + "[ChatController] [broadcasting] [map] -> map : " + map.toString());
		
		// 해당 채팅방을 구독한 클라이언트에게 전송
        return map;
    }
}
