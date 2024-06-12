package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.Mapper.MemberMapper;
import com.smhrd.entity.Member;

// 실제로 일할 Controller임을 표시
@Controller
public class MemberController {

	@Autowired
	MemberMapper mmaper;


	@RequestMapping("Login/login")
	public ModelAndView login(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page,
				HttpSession session
			) throws Exception{
		
		ModelAndView mav = new ModelAndView("Login/login");
		
		return mav;
	}
	@RequestMapping("join")
	public ModelAndView join(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page,
				HttpSession session
			) throws Exception{
		
		ModelAndView mav = new ModelAndView("Login/join");
		
		mav.addObject("targetUrl", "join" );
		return mav;
	}
	
	/*
	 * // 로그인
	 * 
	 * @PostMapping("/Login") public String memberLogin( Member mvo, HttpSession
	 * session,
	 * 
	 * @RequestParam( value="targetUrl", required = true) String targetUrl,
	 * HttpServletRequest request ) { Member loginMember = mmaper.memberLogin(mvo);
	 * 
	 * if (loginMember != null) { session.setAttribute("loginMember", loginMember);
	 * System.out.println(loginMember);
	 * System.out.println(session.getAttribute("loginMember"));
	 * session.setMaxInactiveInterval(3600); return "redirect:/" + targetUrl; } else
	 * { request.setAttribute("errorMassage", "로그인에 실패 하였습니다."); return "redirect:/"
	 * + targetUrl; } }
	 */

	// 회원가입
	@PostMapping("/Join.do")
	public String memberJoin(Member member) {
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
		if (FindIdMember != null) {
			session.setAttribute("FindIdMember", FindIdMember);
		} else {
			System.out.println("아이디찾기 실패");
		}
		return "redirect:/mainList.do";
	}

	// 비밀번호 찾기
	@PostMapping("/FindPw.do")
	public String memberFindPw(Member mvo, HttpSession session) {
		Member FindPwMember = mmaper.memberFindPw(mvo);
		if (FindPwMember != null) {
			session.setAttribute("FindIdMember", FindPwMember);
		} else {
			System.out.println("비밀번호찾기 실패");
		}
		return "redirect:/mainList.do";
	}

	// 로그아웃
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session, HttpServletRequest request) {
		Member memberSession = (Member) session.getAttribute("loginMember");
		if (memberSession != null) {
			session.removeAttribute("loginMember");
		}
		// 현재 요청 URL 가져오기
		String referer = request.getHeader("Referer");
		if (referer != null && !referer.isEmpty()) {
			return "redirect:" + referer;
		}
		// 기본적으로 메인 페이지로 리다이렉트
		return "redirect:/mainList.do";
	}

}
