package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;
import com.smhrd.service.NewsServiceImpl;

@Controller
public class NewsController {
	
	@Autowired
	NewsServiceImpl NewsService;
	
	@RequestMapping("news")
	public ModelAndView NewsList(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page,
				HttpSession session
			) throws Exception{
		
		ModelAndView mav = new ModelAndView("news");
		Pagination pagination = new Pagination();
		pagination.setPage(page);
		
		ArrayList<NewsVO> newsList = NewsService.selectNewsList( pagination );
		
		mav.addObject("NewsList" , newsList );
		mav.addObject("pagination" , pagination );
		mav.addObject("page" , page );
		mav.addObject("targetUrl", "news" );
		return mav;
	}

}
