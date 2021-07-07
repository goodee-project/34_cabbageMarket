// 작성자 : 백영재
package com.gdj.cabbage.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerMapper {
	
	// 관리자 추가
	int insertManager(Map<String, Object> map);

}
