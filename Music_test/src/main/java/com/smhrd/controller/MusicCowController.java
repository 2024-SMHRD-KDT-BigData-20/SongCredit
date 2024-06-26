package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.Musiccow;
import com.smhrd.entity.Pagination;
import com.smhrd.service.MusicCowService;
import com.smhrd.service.MusicCowServiceImpl;

@Controller
public class MusicCowController {

	@Autowired
	MusicCowServiceImpl MusiccowService;
	
	@RequestMapping("musiccow")
	public ModelAndView MCList(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1") int page,
				HttpSession session
			)throws Exception{
		ModelAndView mav = new ModelAndView("musiccow");
		Pagination pagination = new Pagination();
		pagination.setPage(page);
		
		ArrayList<Musiccow> mcList = MusiccowService.getMcList( pagination );
		
		mav.addObject("mcList",mcList);
		mav.addObject("pagination",pagination);
		mav.addObject("page",page);		
		mav.addObject("targetUrl", "musiccow" );
		return mav;
	}
	
}