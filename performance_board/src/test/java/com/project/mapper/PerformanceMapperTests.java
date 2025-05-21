package com.project.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;
import com.project.domain.PerformanceVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PerformanceMapperTests {
	
	@Autowired
	private PerformanceMapper mapper;

	@Test
	public void testPaggin() {
		List<PerformanceVO> list = 
				mapper.getListWithPaging(new Criteria(1, 10));
		list.forEach(performance -> log.info(performance));
	}

}
