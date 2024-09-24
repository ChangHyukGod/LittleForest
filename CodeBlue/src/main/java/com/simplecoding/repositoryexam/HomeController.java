package com.simplecoding.repositoryexam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {	
		return "home";
	}
	
	@GetMapping("/basic/gameinfo")
	public String gameinfo() {
		return "/basic/gameinfo";
	}
	
	@GetMapping("/basic/mypage")
	public String mypage() {
		return "/basic/mypage";
	}
	
	@GetMapping("/basic/FaqMain")
	public String faqmain() {
		return "/basic/FaqMain";
	}
	
	@GetMapping("/basic/login")
	public String login() {
		return "/basic/login";
	}
	@GetMapping("/basic/register")
	public String register() {
		return "/basic/register";
	}
	
}
