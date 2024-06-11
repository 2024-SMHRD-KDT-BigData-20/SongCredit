package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.smhrd.entity.Like;
import com.smhrd.entity.Member;
import com.smhrd.service.LikeService;


//@ RestController
@Controller
public class LikeController {
	@Autowired(required=true)
	LikeService likeService;
	
	@GetMapping("/LikeList.do")
	public String LikeList(HttpServletRequest request,
			HttpSession session
			,Model model) throws Exception {
		
		System.out.println( session );
		System.out.println( session.getAttribute("loginMember") );
		
		Member newMember = (Member) session.getAttribute("loginMember");
		
		System.out.println( newMember );
		
		List<Like> list = likeService.selectLikeList( newMember.getUser_id() );
		
		System.out.println( list.size() );
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("라이크야 나와라 1 " + list.get(i).getUser_id());
			System.out.println("라이크야 나와라 2 " + list.get(i).getInterest_idx());
			System.out.println("라이크야 나와라 3 " + list.get(i).getMusic_idx());
			System.out.println("라이크야 나와라 4 " + list.get(i).getCreated_at());
			
		}
		
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("라이크야 나와라 1 " + list.get(i).getUser_id());
//			System.out.println("라이크야 나와라 2 " + list.get(i).getInterest_idx());
//			System.out.println("라이크야 나와라 3 " + list.get(i).getMusic_idx());
//			System.out.println("라이크야 나와라 4 " + list.get(i).getCreated_at());
//			
//		}
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
