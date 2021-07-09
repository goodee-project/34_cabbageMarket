// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.CategoryMain;
import com.gdj.cabbage.vo.CategoryMiddle;
import com.gdj.cabbage.vo.CategorySub;

@Mapper
public interface CategoryMapper {
	List<CategoryMain> selectCategoryMain();
	List<CategoryMiddle> selectCategoryMiddle(int categoryMainId);
	List<CategorySub> selectCategorySub(int categoryMiddleId);
}