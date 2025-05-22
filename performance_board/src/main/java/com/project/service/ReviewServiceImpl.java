package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ReviewVO;
import com.project.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	
	private final ReviewMapper mapper;
	
	@Override
	public ReviewVO get(Long bno) {
		log.info("get..." + bno);
		return mapper.read(bno);
	}

	@Override
	public void register(ReviewVO review) {
		mapper.insertReview(review);
	}

	@Override
	public boolean modifiy(ReviewVO vo) {
		log.info("modify...");
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...");
		return mapper.delete(bno) == 1;
	}

	@Override
	public void updateReadCount(Long bno) {
		log.info("updateReadCount...");
		mapper.updateReadCount(bno);	
	}
	
	@Override
	public List<ReviewVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}
	
}