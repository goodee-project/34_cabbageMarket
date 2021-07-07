// 작성자 : 백영재
package com.gdj.cabbage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.ManagerMapper;

@Service
@Transactional
public class ManagerService {
	
@Autowired ManagerMapper managerMapper;

	// 관리자 추가
	public int addManager(Map<String, Object> map) {
		
		return managerMapper.insertManager(map);
	}

}
