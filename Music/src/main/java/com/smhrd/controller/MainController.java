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
import com.smhrd.entity.Member;
import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;

@Controller
public class MainController {

	@Autowired
	MemberMapper mmaper;

	@RequestMapping("/mainList")
	public ModelAndView main(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page,
				HttpSession session
			) throws Exception{
		
		ModelAndView mav = new ModelAndView("main");
		
		return mav;
	}

}
