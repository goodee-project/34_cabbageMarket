// 작성자 : 백영재
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.Manager;
import com.gdj.cabbage.vo.Page;

@Mapper
public interface ManagerMapper {
	
	// 매니저 상세보기
	Map<String, Object> selectManagerInfo(String managerName);
	// 유저목록보기 토탈
	int selectAllUsersTotal(String searchWord);
	// 유저목록보기 기능
	List<Map<String, Object>> selectAllUsersByManager(Page page);
	// 관리자 토탈
	int selectManagerTotal();
	// 관리자 목록
	List<Manager> selectManagerList(Page page);
	// 관리자 수정
	int updateManager(Manager manager);
	// 관리자 추가
	int insertManager(Map<String, Object> map);
	// 관리자 세션
	Map<String, Object> ManagerloginSession(Manager manager);

}
