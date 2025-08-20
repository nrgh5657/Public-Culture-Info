package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.PerformanceVO;
import com.project.domain.ReviewVO;

public interface ReviewMapper {

	//단건 조회
	public ReviewVO read(Long bno);
	
	//데이터 등록
	public void insertReview(ReviewVO review);
	
	//데이터 삭제
	public int delete(Long bno);
	
	//데이터 변경
	public int update(ReviewVO review);
	
	//조회수 증가
	public void updateReadCount(Long bno);
	
	//replyCnt 값
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	// 기본 목록
	public List<ReviewVO> getList();
		
	// 페이징 목록
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	// 총 개수
	public int getTotalCount(Criteria cri);

	public List<ReviewVO> getListWithPagingByImgKey(@Param("cri") Criteria cri, @Param("imgKey") String imgKey);

	public int getTotalCountByImgKey(@Param("imgKey") String imgKey);

}