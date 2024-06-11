package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;
import com.smhrd.service.NewsService;
import com.smhrd.service.NewsServiceImpl;

@Controller
public class NewsController {
	
	@Autowired
	NewsServiceImpl NewsService;
	
	@RequestMapping("news")
	public ModelAndView NewsList(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page
				) throws Exception{
		
		ModelAndView mav = new ModelAndView("news");
		
		Pagination pagination = new Pagination();
		pagination.setPage(page);
		
		ArrayList<NewsVO> newsList = NewsService.selectNewsList( pagination );
		
		
		System.out.println( page );
		System.out.println( pagination.getPage() );
		System.out.println( pagination.getStartPage() );
		System.out.println( pagination.getEndPage() );
		System.out.println( newsList );
		
		mav.addObject("NewsList" , newsList );
		mav.addObject("pagination" , pagination );
		mav.addObject("page" , page );
		return mav;
	}

}
