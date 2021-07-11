// 작성자 : 김태훈
package com.gdj.cabbage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.ChattingMapper;

@Service
@Transactional
public class ChattingService {
	
	@Autowired ChattingMapper chattingMapper;
	
	// 채팅방 정보 가져오기 트랜젝션
	//
	// 1. 직거래 상품 id와 userID를 이용해 채팅방 생성 여부를 확인
	// 2. 없으면 만들고 있으면 해당 채팅방 정보를 가져온다.
	
	public Map<String, Object> getChattingRoomOne(Map<String, Object> map){
		
		// 1. 생성 여부 확인
		Map<String, Object> ChattingRoomInfo = chattingMapper.selectChattingRoomOne(map);
		
		// 2. 채팅방 정보가 없으면 채팅방 생성
		if(ChattingRoomInfo == null) {
			chattingMapper.insertChattingRoop(map);
			ChattingRoomInfo = chattingMapper.selectChattingRoomOne(map); // 생성된 채팅방 정보 가져오기
		}
		
		return ChattingRoomInfo;
	}
	// 채팅방 채팅내용 리스트 가져오기
	public int getSellerId(int directTradeProductRegistrationId){
		return chattingMapper.selectSellerId(directTradeProductRegistrationId);
	}
	
	// 채팅방 채팅내용 리스트 가져오기
	public List<Map<String, Object>> getChattingContentList(int chattingRoomId){
		return chattingMapper.selectChattingContentListById(chattingRoomId);
	}
}
