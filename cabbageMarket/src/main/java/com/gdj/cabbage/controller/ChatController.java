package com.gdj.cabbage.controller;

import java.util.HashMap;
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

		chattingService.addChattingContent(chattingContent);
		
		Map<String, Object> map = chattingService.getNickNameAndCreateDate(chattingContent.getChattingContentId());
		map.put("content", chattingContent.getContent());
		map.put("userId", chattingContent.getUserId());
		
		log.debug(Debuging.DEBUG + "[ChatController] [broadcasting] [map] -> map : " + map.toString());
		
		
        return map;
    }
}
