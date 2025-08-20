package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public void accessDenied(Authentication authentication, Model model) {
		log.info("access Denied : " + authentication );
		model.addAttribute("msg", "접근이 거부되었습니다.");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	

    @Autowired
    private UserService userService;

	
	@GetMapping("/signUp")
	public String showSignUp() {
		return "signUp";
	}
	
	@PostMapping("/signUp")
	public String processSignUp(@RequestParam String username,
								@RequestParam String password,
								@RequestParam String email,
								Model model) {
        // 회원가입 로직 (예: UserService 호출)
		log.info("회원가입 시도: " + username + ", " + email);
        
	    if(userService.getUserById(username) != null) {
	        model.addAttribute("errorMsg", "이미 존재하는 아이디입니다.");
	        return "signUp";
	    }
		
		boolean success = userService.registerUser(username, password, email);

        if (success) {
            return "redirect:/customLogin"; // 가입 후 로그인 페이지로 리다이렉트
        } else {
            model.addAttribute("errorMsg", "회원가입 실패: 이미 존재하는 아이디일 수 있습니다.");
		
		
		return "signUp";
        }
	}
	
	@GetMapping("/checkUsername")
	@ResponseBody
	public String checkUsername(@RequestParam String username) {
	    boolean exists = userService.getUserById(username) != null;
	    return exists ? "unavailable" : "available";
	}
	
}
