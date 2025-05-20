package com.project.service;

import org.springframework.stereotype.Service;

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
	
}
