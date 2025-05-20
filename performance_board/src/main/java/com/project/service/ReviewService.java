package com.project.service;

import com.project.domain.ReviewVO;

public interface ReviewService {
	
	//단건 조회
	public ReviewVO get(Long bno);
}
