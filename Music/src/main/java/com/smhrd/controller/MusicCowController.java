package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.MusicCowMapper;
import com.smhrd.entity.MusicCow;

@RestController
public class MusicCowController {

	@Autowired
	private MusicCowMapper mcmapper;
	
	
	@GetMapping("/musicCow")
	public List<MusicCow> ChartList(){
		List<MusicCow> list = mcmapper.MusicCowList();
		return list;
	}
}