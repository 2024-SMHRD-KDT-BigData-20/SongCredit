package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.smhrd.Mapper.LikeMapper;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.smhrd.entity.Like;
import com.smhrd.service.LikeService;


//@ RestController
@Controller
public class LikeController {
	@Autowired(required=true)
	LikeService likeService;
	
	@GetMapping("/LikeList.do")
	public String LikeList(
			HttpServletRequest request, 
			String user_id, 
			Model model
		) throws Exception {
		List<Like> list = likeService.selectLikeList(user_id);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("라이크야 나와라 1 " + list.get(i).getUser_id());
			System.out.println("라이크야 나와라 2 " + list.get(i).getInterest_idx());
			System.out.println("라이크야 나와라 3 " + list.get(i).getMusic_idx());
			System.out.println("라이크야 나와라 4 " + list.get(i).getCreated_at());
			
		}
		model.addAttribute("rrr", "sss");
		model.addAttribute("LikeList", list);
		return "LikeList";
	}
	
	
	
	
//	public List<Like> LikeList(String user_id) throws Exception {
//		List<Like> list = likeService.selectLikeList(user_id);
//		System.out.println("라이크야 나와라 = " + list.size());
//		return list;
//	}

	
}
