package com.gdj.cabbage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.CategoryMain;

@Mapper
public interface CategoryMapper {
	List<CategoryMain> selectCategoryMain();
}
