package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.Mapper.MemberMapper;
import com.smhrd.entity.Member;
import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;

@Controller
public class MainController {

	@Autowired
	MemberMapper mmaper;
	
	@RequestMapping("mainList")
	public ModelAndView mainList(
				HttpServletRequest request,
				@RequestParam(value = "page", defaultValue = "1" ) int page,
				@RequestParam(value = "targetUrl", defaultValue = "" ) String targetUrl,
				HttpSession session
			) throws Exception{
		String targetPath = "main";
		//로그인 정보 확인
		if ( session.getAttribute("loginId") != null  && !session.getAttribute("loginId").equals("") ) {
			//로그인 아이디 정보로 회원 정보 조회
			Member loginMember = mmaper.memberLoginWithId( String.valueOf( session.getAttribute("loginId") ) );
			if( loginMember == null ) {
				targetPath = "login";
			} 
		} else {
			//로그인 안 했을 시 할 행동 -> 로그인 페이지로 다시 이동시킬건지, 메인 페이지에서 다시 시작 시킬건지 
			targetPath = "Login/login";
		}
		ModelAndView mav = new ModelAndView( targetPath ); 
		
		
		
		mav.addObject("targetUrl", !targetUrl.equals("") ? "targetUrl=" + targetUrl : "" );
		return mav;
	}

}
