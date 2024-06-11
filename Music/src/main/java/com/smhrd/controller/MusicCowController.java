package com.smhrd.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.MusicCowMapper;

@RestController
public class MusicCowController {

	@Autowired
	private MusicCowMapper mcmapper;
	
}