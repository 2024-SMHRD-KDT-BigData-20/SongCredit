package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.Chart;
import com.smhrd.entity.Musiccow;
import com.smhrd.entity.Pagination;
import com.smhrd.service.MusicCowServiceImpl;
import com.smhrd.Mapper.ChartMapper;

@Controller
public class ChartController {

	@Autowired
	ChartMapper cmapper;

	@RequestMapping("/chartDetail")
	public ModelAndView chartDetail(@RequestParam(value = "item", required = false, defaultValue = "0") int music_idx) throws Exception {
	    System.out.println("Received music_idx: " + music_idx);
	    ModelAndView mav = new ModelAndView("chartDetail");
	    mav.addObject("music_idx", music_idx);
	    return mav;
	}
	@Autowired
	MusicCowServiceImpl MusiccowService;

	@RequestMapping("chartList")
	public ModelAndView MCList(HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") int page,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("chartList");
		Pagination pagination = new Pagination();
		pagination.setPage(page);

		ArrayList<Musiccow> mcList = MusiccowService.getMcList(pagination);

		mav.addObject("mcList", mcList);
		mav.addObject("pagination", pagination);
		mav.addObject("page", page);
		mav.addObject("targetUrl", "chartList");
		return mav;
	}
}
