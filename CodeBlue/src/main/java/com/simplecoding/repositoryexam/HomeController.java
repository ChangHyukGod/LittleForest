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
	
	@GetMapping("/basic/faqmain")
	public String faqmain() {
		return "/basic/faqmain";
	}
	
	@GetMapping("/shoppingbasket")
	public String shoppingbasket() {
		return "/payment/shoppingbasket";
	}
	
	@GetMapping("/paymentpage")
	public String paymentpage() {
		return "/payment/paymentpage";
	}
	
	
}
