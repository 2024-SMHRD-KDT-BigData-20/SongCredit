package com.smhrd.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;

@RestController
public class NewsRestController {


	@Autowired
	NewsMapper nmapper;
	
	@GetMapping("/initaliznews")
	public List<NewsVO> NewsList() {
		List<NewsVO> list = nmapper.initalizenews();
		return list;
	}
}
