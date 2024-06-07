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
	
	
	// 로그인
	@PostMapping("/Login.do")
	public String memberLogin(Member mvo, HttpSession session) {
	    Member loginMember = mmaper.memberLogin(mvo);
	    
	    if (loginMember != null) {
	        session.setAttribute("loginMember", loginMember );
	        System.out.println(loginMember);
	        System.out.println( session.getAttribute("loginMember") );
	        session.setMaxInactiveInterval(3600);
	        return "redirect:/mainList.do";
	    } else {
	        // 로그인 실패 시 처리
	    	System.out.println("로그인실패");
	        return "redirect:/mainList.do";
	    }
	}
	
	// 회원가입
	@PostMapping("/Join.do")
	public String memberJoin( Member member) {
	    int result = mmaper.memberJoin(member);
	    if (result > 0) {
	        return "redirect:/mainList.do";
	    } else {
	        return "redirect:/mainList.do";
	    }
	}
	
	// 아이디 찾기
	@PostMapping("/FindId.do")
	public String memberFindId(Member mvo, HttpSession session) {
		Member FindIdMember = mmaper.memberFindId(mvo);
		if(FindIdMember != null) {
			session.setAttribute("FindIdMember", FindIdMember);
		}
		else {
			System.out.println("아이디찾기 실패");
		}
		return "redirect:/mainList.do";
	}
	
	// 비밀번호 찾기
	@PostMapping("/FindPw.do")
	public String memberFindPw(Member mvo,HttpSession session) {
		Member FindPwMember = mmaper.memberFindPw(mvo);
		if(FindPwMember != null) {
			session.setAttribute("FindIdMember", FindPwMember);
		}
		else {
			System.out.println("비밀번호찾기 실패");
		}
		return "redirect:/mainList.do";
	}
	
	// 로그아웃
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session, Member vo) {
		Member memberSession = (Member) session.getAttribute("loginMember"); 
		if( memberSession != null ) {
		session.removeAttribute("loginMember");
		return "redirect:/mainList.do";
		}
		return "redirect:/mainList.do";
		}
	
	
}
