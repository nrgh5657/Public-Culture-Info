package com.project.mapper;

import java.util.List;

import com.project.domain.ReviewVO;

public interface ReviewMapper {
	
	//단건 조회
	public ReviewVO read(Long bno);
	
	//전체 데이터 조회
	public List<ReviewVO> getList();
	
	//데이터 저장
	public void insertSelectKey(ReviewVO review);
	
	//데이터 삭제
	public int delete(Long bno);
	
	//데이터 변경
	public int update(ReviewVO review);
	
}
