package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.Mapper.MemberMapper;

@Controller
public class MainController {

	@Autowired
	MemberMapper mmaper;

	@RequestMapping("main")
	public ModelAndView main(@RequestParam(value = "targetUrl",
	required = false,
	defaultValue = "") String targetUrl,
			HttpServletRequest request,
			HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("targetUrl", "main");

		return mav;
	}

}
