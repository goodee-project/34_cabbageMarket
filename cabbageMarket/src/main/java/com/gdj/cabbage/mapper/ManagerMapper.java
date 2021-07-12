// 작성자 : 백영재
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.Manager;
import com.gdj.cabbage.vo.Page;

@Mapper
public interface ManagerMapper {
	
	// 관리자 토탈
	int selectManagerTotal();
	// 관리자 목록
	List<Manager> selectManagerList(Page page);
	// 관리자 수정
	int updateManager(Map<String, Object> map);
	// 관리자 추가
	int insertManager(Map<String, Object> map);
	// 관리자 세션
	Map<String, Object> ManagerloginSession(Manager manager);

}
