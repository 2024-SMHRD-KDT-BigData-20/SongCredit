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

	// 로그인
	@RequestMapping("login")
	public ModelAndView login(@RequestParam(value = "targetUrl", required = false, defaultValue = "") String targetUrl,
			HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("Login/login");
		mav.addObject("targetUrl", targetUrl);

		return mav;
	}

	@RequestMapping("join")
	public ModelAndView join(HttpServletRequest request,
			@RequestParam(value = "targetUrl", required = false, defaultValue = "") String targetUrl,
			HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("Login/join");

		mav.addObject("targetUrl", "join");
		return mav;
	}

	@RequestMapping("mypage")
	public ModelAndView mypage(@RequestParam(value = "targetUrl", required = false, defaultValue = "") String targetUrl,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("Login/mypage");
		mav.addObject("targetUrl", "mypage");
		return mav;
	}

	@RequestMapping("findId")
	public ModelAndView findId(@RequestParam(value = "targetUrl", required = false, defaultValue = "") String targetUrl,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("Login/findid");
		mav.addObject("targetUrl", "findid");
		return mav;
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
	@RequestMapping("/Logout")
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
