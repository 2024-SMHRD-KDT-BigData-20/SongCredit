package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.ChartMapper;
import com.smhrd.entity.Chart;

@RestController
public class ChartController {
	
	@Autowired
	private ChartMapper cmapper;
	
	
	@GetMapping("/chart")
	public List<Chart> ChartList(){
		List<Chart> list = cmapper.chartList();
		return list;
	}
}
