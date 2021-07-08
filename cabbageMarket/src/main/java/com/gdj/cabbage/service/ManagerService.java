// 작성자 : 백영재
package com.gdj.cabbage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.ManagerMapper;
import com.gdj.cabbage.vo.Manager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ManagerService {
	
@Autowired ManagerMapper managerMapper;

	// 관리자 세션
	public Map<String, Object> ManagerloginSession(Manager manager){
		log.debug(Debuging.DEBUG+" manager "+ manager);
		
		Map<String, Object> managerSession = managerMapper.ManagerloginSession(manager);
		log.debug(Debuging.DEBUG+" managerSession" + managerSession);
		
		return managerSession;
	}

	// 관리자 추가
	public int addManager(Map<String, Object> map) {
		
		return managerMapper.insertManager(map);
	}

}
