// 작성자 : 백영재
package com.gdj.cabbage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.ManagerMapper;
import com.gdj.cabbage.vo.Manager;
import com.gdj.cabbage.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ManagerService {
	
@Autowired ManagerMapper managerMapper;

	// 관리자 상세보기
	public Map<String, Object> selectManagerInfo(String managerName){
		log.debug(Debuging.DEBUG+" managerName : " + managerName);
		
		Map<String, Object> managerMap = managerMapper.selectManagerInfo(managerName);
		log.debug(Debuging.DEBUG+" managerMap : " + managerMap);
		
		return managerMap;
	}

	// 회원 목록 출력 서비스
	public Map<String, Object> getAllUsersByManager(int currentPage, int rowPerPage, String searchWord){ // <-- controller에서 받아오는 parameter
		log.debug("managerService의 getAllUsersByManager 실행...");
		
		int allUsersTotal = managerMapper.selectAllUsersTotal(searchWord);
		
		int lastPage = allUsersTotal / rowPerPage;
		if(allUsersTotal % rowPerPage != 0) {
			lastPage++;
		}
		// int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Page page = new Page();
		
		page.setBeginRow(beginRow);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		
		List<Map<String, Object>> allUsersList = managerMapper.selectAllUsersByManager(page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lastPage", lastPage);
		map.put("allUsersList", allUsersList);
		
		return map;
	}

	// 관리자 목록
	public Map<String, Object> getManagerList(int currentPage, int rowPerPage){ // <-- controller에서 받아오는 parameter
		
		log.debug(Debuging.DEBUG + "managerService의 getManagerList 실행");
		
		int managerTotal = managerMapper.selectManagerTotal();
		
		int lastPage = managerTotal / rowPerPage;
		if(managerTotal % rowPerPage != 0) {
			lastPage++;
		}
		// int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Page page = new Page();
		
		page.setBeginRow(beginRow);
		page.setRowPerPage(rowPerPage);
		
		List<Manager> managerList = managerMapper.selectManagerList(page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lastPage", lastPage);
		map.put("managerList", managerList);
		
		return map;
	}

	// 관리자 수정
	public int modifyManager(Manager manager) {
		log.debug(Debuging.DEBUG + "manager : " + manager);
		
		int row = managerMapper.updateManager(manager);
		log.debug(Debuging.DEBUG+" 매니저 수정 성공 여부 : "+row);
		
		return row;
	}

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
