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
}
