package com.smhrd.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.ChartMapper;
import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.Chart;
import com.smhrd.entity.NewsVO;

@RestController
public class MainRestController {

	@Autowired
	NewsMapper nmapper;

	@Autowired
	private ChartMapper cmapper;


	@GetMapping("/topnewsList")
	public List<NewsVO> NewsList() {
		List<NewsVO> list = nmapper.topNewsList();
		return list;
	}
	
	@GetMapping("/chart")
	public List<Chart> ChartList() {
		List<Chart> list = cmapper.chartList();
		return list;
	}
}
