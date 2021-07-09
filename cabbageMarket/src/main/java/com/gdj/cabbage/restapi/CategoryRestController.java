package com.gdj.cabbage.restapi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdj.cabbage.service.CategoryService;
import com.gdj.cabbage.vo.CategoryMain;
import com.gdj.cabbage.vo.CategoryMiddle;
import com.gdj.cabbage.vo.CategorySub;

@RestController
public class CategoryRestController {
	@Autowired CategoryService categoryService;

	// 카테고리 목록 가져오기
	@GetMapping("/getCategoryMain")
	public List<CategoryMain> getCategoryMain(){
		return categoryService.getCategoryMainList();
	}

	@GetMapping("/getCategoryMiddle")
	public List<CategoryMiddle> getCategoryMiddle(int categoryMainId){
		return categoryService.getCategoryMiddleList(categoryMainId);
	}
	
	@GetMapping("/getCategorySub")
	public List<CategorySub> getCategorySub(int categoryMiddleId){
		return categoryService.getCategorySubList(categoryMiddleId);
	}
}
