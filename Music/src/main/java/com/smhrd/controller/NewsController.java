package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;
import com.smhrd.service.NewsService;

@Controller
public class NewsController {
	
	@Autowired(required=true)
	NewsService NewsService;
	
	@GetMapping("/news.do")
	public String NewsList(
				HttpServletRequest request,
				Model model
				) throws Exception{
		
		NewsVO nv = new NewsVO();
		ArrayList<NewsVO> newsList = NewsService.selectNewsList();
		for (int i = 0; i < newsList.size(); i++) {
		nv = newsList.get(i);
		}
		model.addAttribute("NewsList" , newsList);
		
		return "News";
	}

}
