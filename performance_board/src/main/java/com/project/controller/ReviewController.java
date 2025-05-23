package com.project.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.PageDTO;
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
	
	@GetMapping("/reviewList")
	public String list(Criteria cri, Model model) {
		log.info("review list..." + cri);
		log.info("pageNum: " + cri.getPageNum());
		
		// 1. 페이징 된 리뷰 목록 가져오기
		List<ReviewVO> list = service.getList(cri);
		
		// 2. 전체 리뷰 수 가져오기
		int total = service.getTotal(cri);
		
		// 3. 모델에 목록 + 페이지 정보 담기
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/reviewList";
	}
	
//	@PostMapping("/reviewRegister")
//	public String register(ReviewVO vo) {
//		log.info("register...");
//		
//		service.register(vo);
//		
//		return "redirect:/review/reviewList";
//	}
	
	
	/*20250523 리뷰목록 페이지에서 리뷰작성페이지로*/
	@GetMapping("/reviewRegister")
	public String showReviewForm(Model model) {
	    // 필요시 model.addAttribute()로 초기 데이터 전달
	    return "review/reviewRegister";  // JSP 경로
	}
	
	
	/*공연 상세페이지에서 값을 넘겨받아 리뷰 작성페이지로*/
	@PostMapping("/reviewRegister")
	public String reviewRegister(
	    @RequestParam("imgKey") String imgKey,
	    @RequestParam("title") String title,
	    @RequestParam("img") String img,
	    @RequestParam("category") String category,
	    @RequestParam("place") String place,
	    Model model) {

	    ReviewVO review = ReviewVO.builder()
	        .imgKey(imgKey)
	    	.img(img)
	        .title(title)
	        .category(category)
	        .place(place)
	        .build();

	    // 기본 작성자, 날짜 설정
	    review.setWriter("testWriter");
	    Date now = new Date();
	    review.setRegDate(now);
	    review.setUpdateDate(now);

	    model.addAttribute("review", review);

	    return "review/reviewRegister"; // 뷰 jsp 경로
	}
	
	@PostMapping("submitReview")
	public String submitReview(ReviewVO review, RedirectAttributes rttr) {
		Date now = new Date();
		review.setRegDate(now);
		review.setUpdateDate(now);
		service.register(review);
		System.out.println("img 값: " + review.getImg());
        rttr.addFlashAttribute("message", "리뷰 등록 완료!");
        return "redirect:/review/reviewList";
		
	}
	
	
	@GetMapping({"/reviewGet", "/reviewModify"})
	public void getReview(@RequestParam Long bno, Criteria cri, Model model) {
		log.info("get...modify...");
		
		service.updateReadCount(bno);
		
		model.addAttribute("performance", service.get(bno));
		model.addAttribute("cri", cri);
	}
	
	@PostMapping("/reviewRemove")
	public String remove(Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove...");
		
		service.remove(bno);
		
		rttr.addFlashAttribute("result", "삭제 성공했습니다.");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    rttr.addAttribute("type", cri.getType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/reviewList";
	}
	
	@PostMapping("/reviewModify")
	public String modify(ReviewVO vo, Criteria cri, RedirectAttributes rttr) {
		log.info("modify...");
		
		service.modifiy(vo);
		
		rttr.addFlashAttribute("result", "수정 성공했습니다.");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    rttr.addAttribute("type", cri.getType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/reviewList";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
}