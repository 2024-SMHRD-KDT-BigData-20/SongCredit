package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;

@RestController
public class NewsController {

	@Autowired
	private NewsMapper nmapper;

	@GetMapping("/topnewsList")
	public List<NewsVO> ChartList() {
		List<NewsVO> list = nmapper.topNewsList();
		return list;
	}

}
