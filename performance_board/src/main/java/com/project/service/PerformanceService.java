package com.project.service;

import java.util.List;

import com.project.domain.PerformanceVO;

public interface PerformanceService {
	List<PerformanceVO> fetchPerformances();
	
	String extractImgKey(String imageUrl);

	PerformanceVO findByImgKey(String imgKey);
	
	PerformanceVO getOrSavePerformance(String imgKey);
}
