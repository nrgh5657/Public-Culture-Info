package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.PerformanceVO;
import com.project.service.PerformanceService;


@Controller
@RequestMapping("/performance")
public class PerformanceController {
	
	 private final PerformanceService performanceService;

	    @Autowired
	    public PerformanceController(PerformanceService performanceService) {
	        this.performanceService = performanceService;
	    }

	    @GetMapping("/performanceList")
	    public String showList(Model model) {
	    	System.out.println(">>>>> /performance/performanceList 요청 들어옴");
	    	
	        List<PerformanceVO> list = performanceService.fetchPerformances();
	        list.forEach(vo -> vo.setImgKey(performanceService.extractImgKey(vo.getImage())));
	        System.out.println("🎯 Controller에서 받은 list 크기: " + list.size());
	        model.addAttribute("performanceList", list);
	        return "performance/performanceList";
	    }
	    
	/*    @GetMapping("/performanceGet")
	    public String getPerformanceDetail(String imgKey, Model model) {
	        System.out.println("imgKey: " + imgKey);
	        PerformanceVO performance = performanceService.findByImgKey(imgKey);
	        System.out.println("performance 객체: " + performance);
	        model.addAttribute("performance", performance);
	        return "performance/performanceGet"; 
	    }*/
	    
	    @GetMapping("/performanceGet")
	    public String getPerformanceDetail(String imgKey, Model model) {
	        System.out.println("imgKey: " + imgKey);
	        PerformanceVO performance = performanceService.getOrSavePerformance(imgKey);
	        System.out.println("performance 객체: " + performance);
	        model.addAttribute("performance", performance);
	        return "performance/performanceGet"; 
	    }

}
