package com.smhrd.restController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.MemberMapper;
import com.smhrd.entity.CommonResponse;
import com.smhrd.entity.Member;

@RestController
@RequestMapping("rest/member")
public class MemberRestController {

	@Autowired
	MemberMapper mmaper;

	@PostMapping("/login")
	public CommonResponse memberLogin(@RequestBody Member mvo, HttpSession session,
			@RequestParam(value = "targetUrl", required = false) String targetUrl, HttpServletRequest request) {

		Member loginMember = mmaper.memberLogin(mvo);
		CommonResponse response = new CommonResponse();

		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			session.setMaxInactiveInterval(3600);
			response.setResultCode(200);
		} else {
			response.setResultCode(-100);
		}

		System.out.println("Received targetUrl: " + targetUrl);

		// targetUrl이 없는 경우 기본값 설정
		if (targetUrl == null || targetUrl.isEmpty()) {
			targetUrl = "main";
		} else if (targetUrl == "join") {
			targetUrl = "main";
		}

		// targetUrl이 상대 경로일 경우 절대 경로로 변환
		if (!targetUrl.startsWith("/")) {
			targetUrl = "/" + targetUrl;
		}

		// targetUrl을 contextPath와 합치기
		targetUrl = request.getContextPath() + targetUrl;

		response.setTargetUrl(targetUrl);
		return response;
	}

	@PostMapping("/join")
	public CommonResponse memberJoin(@RequestBody Member mvo, HttpServletRequest request) {

		int result = mmaper.memberJoin(mvo);
		CommonResponse response = new CommonResponse();

		if (result > 0) {
			response.setResultCode(200);
		} else {
			response.setResultCode(-100);
		}

		response.setTargetUrl(request.getContextPath() + "/main");
		return response;
	}

	// 아이디 찾기
	@PostMapping("FindId")
	public String memberFindId(Member mvo, HttpSession session) {
		Member FindIdMember = mmaper.memberFindId(mvo);
		if (FindIdMember != null) {
			session.setAttribute("FindIdMember", FindIdMember);
		} else {
			System.out.println("아이디찾기 실패");
		}
		return "redirect:/mainList.do";
	}
}
