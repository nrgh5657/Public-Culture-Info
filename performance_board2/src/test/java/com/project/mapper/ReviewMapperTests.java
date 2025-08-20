package com.project.mapper;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;
import com.project.domain.PerformanceVO;
import com.project.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Test
	public void testRead() {
		log.info(mapper.read(1L));
	}
	
	
	@Test
	public void testDelete() {
		int result = mapper.delete(25L);
		log.info("Delete Result>> " + result);
	}
	
	@Test
	public void testUpdate() {
		ReviewVO vo = ReviewVO.builder()
				.img("new image")
				.title("Test New 공연/행사명")
				.content("Test New 내용")
				.bno(24L)
				.build();
		
		int result = mapper.update(vo);
		log.info("Update Result>> " + result);
	}
	
	@Test
	public void updateReadCount() {
		mapper.updateReadCount(24L);
	}
	
	@Test
	public void testPaggin() {
		List<ReviewVO> list = 
				mapper.getListWithPaging(new Criteria(1, 10));
		list.forEach(review -> log.info(review));
	}
	

}