package com.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/member")
	public String showLoginPage() {
		return "member";
	}
	
	@RequestMapping("/musiccow")
	public String musicCowpage() {
		return "musicCow";
	}
}
