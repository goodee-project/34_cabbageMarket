// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.CategoryMapper;
import com.gdj.cabbage.vo.CategoryMain;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	public List<CategoryMain> getCategoryMainList(){ //카테고리 메인을 불러오는 클래스
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 paramMap확인"+"없음");
		
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 map확인:"+"없음");
		List<CategoryMain> categoryMainList = categoryMapper.selectCategoryMain();//카테고리 메인을 불러오는 매퍼
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 categoryMainList확인"+categoryMainList.toString());
		
		return categoryMainList;
	}
}