package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.ReviewVO;
import com.project.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
@Log4j
public class ReviewController {
	
	private final ReviewService service;
	
	@PostMapping("/reviewRegister")
	public String register(ReviewVO vo) {
		log.info("register...");
		
		service.register(vo);
		
		return "redirect:/review/reviewList";
	}
	
	@GetMapping("/reviewGet")
	public void getReview(@RequestParam Long bno, Model model) {
		log.info("get...");
		
		model.addAttribute("performance", service.get(bno));
	}
	
	@PostMapping("/reviewRemove")
	public String remove(Long bno) {
		log.info("remove...");
		
		service.remove(bno);
		
		return "redirect:/review/reviewList";
	}
	
	@PostMapping("/reviewModify")
	public String modify(ReviewVO vo) {
		log.info("modify...");
		
		service.modifiy(vo);
		
		return "redirect:/review/reviewList";
	}
	
}