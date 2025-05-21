package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.PerformanceVO;
@Mapper
public interface PerformanceMapper {
	PerformanceVO selectByImgKey(@Param("imgKey") String imgKey);

	int insert(PerformanceVO performance);
}
