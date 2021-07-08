package com.gdj.cabbage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.UsersMapper;
import com.gdj.cabbage.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UsersService {
	@Autowired UsersMapper usersMapper;
	
	public Map<String, Object> loginSession(Users users){
		log.debug(Debuging.DEBUG+" users "+users);
		
		Map<String, Object> usersSession = usersMapper.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession"+usersSession);
		
		return usersSession;
	}
	
	public int insertUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int selectEmail = usersMapper.selectEmail(users);
		if(selectEmail != 0) {
			log.debug(Debuging.DEBUG+" 이메일 중복 검사 : "+selectEmail);
			return 1;
		}
		
		int selectNickname = usersMapper.selectNickname(users);
		if(selectNickname != 0) {
			log.debug(Debuging.DEBUG+" 닉네임 중복 검사 : "+selectNickname);
			return 2;
		}
		
		int row = usersMapper.registerUser(users);
		log.debug(Debuging.DEBUG+" 회원가입 성공 여부 : "+row);
		
		return 3;
	}
}
