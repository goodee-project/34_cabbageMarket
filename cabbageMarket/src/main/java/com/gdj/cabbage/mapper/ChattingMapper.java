// 작성자 : 김태훈
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.ChattingContent;

@Mapper
public interface ChattingMapper {
	Map<String, Object> selectChattingRoomOne(Map<String, Object> map); // 채팅방 정보 가져오기
	void insertChattingRoom(Map<String, Object> map); // 채팅방 생성
	Integer selectSellerId(int directTradeProductRegistrationId); // 직거래 상품 등록 (판매자) Id 가져오기
	
	List<Map<String, Object>> selectChattingContentListById(int chattingRoomId); // 채팅방에 있는 채팅 내용 리스트
	void insertChattingContent(ChattingContent chattingContent); // 채팅 내용 입력
	Map<String, Object> selectNickNameAndCreateDateBykey(int chattingContentId); // 방금 입력된 채팅의 닉네임, 시간 가져오기
	
	List<Map<String, Object>> selectChattingRoomListById(int userId); // 채팅방 목록 가져오기
}
