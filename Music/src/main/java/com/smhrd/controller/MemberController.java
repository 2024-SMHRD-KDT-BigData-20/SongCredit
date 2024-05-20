package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.Mapper.MemberMapper;
import com.smhrd.entity.Member;

// 실제로 일할 Controller임을 표시
@Controller
public class MemberController {

	@Autowired
	private MemberMapper mmaper;
	
	
	@PostMapping("/Login.do")
	public String memberLogin(Member mvo, HttpSession session) {
		Member loginMember = mmaper.memberLogin(mvo);
		
		// 스프링에서 session객체 이용방법
		// 1) HttpSession session = request.getSession();
		//    -> 메소드의 매개변수에 HttpServletRequest request를 받아와서
		// 		 객체를 만든 다음에 session사용
		// 2) 메소드의 매개변수에 HttpSession session 받아옴
		session.setAttribute("loginMember", loginMember);
		
		// 로그인 성공하고 나면 다시 basic.jsp로 이동
		// 이미 만든 메소드로 다시 이동 
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("loginMember");
		
		return "redirect:/boardList.do";
	}
	
	
}
