package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.Mapper.BoardMapper;
import com.smhrd.entity.Board;

// POJO(Plain Old Java Object) : 실제로 일하는 Controller
// 기능을 알려주는 표시 : 주석 - 전처리를 하기 위한 기호
// 초창기 자료 @Component
@Controller
public class BoardController {
	// 생성자 주입
	// MemberDAO dao = new MemberDAO();
	@Autowired
	private BoardMapper mapper;
	
	// 어떤 요청을 처리할지 연결(mapping)할지 맵핑기호
	// @RequestMapping("/요청내용")
	@RequestMapping("/boardList.do")
	public String boardList() {
		// view page name 결과로 돌려준다.
		// WEB-INF / views _____.jsp (ViewResolver에 의해)
		return "basic";
	}
	// ajax에서 get방식으로 요청이 넘어옴
	// ajax결과는 다른 jsp로 이동이 아니라 데이터만 넘겨줌
	/*
	 * @GetMapping("/boardAjaxList.do") public @ResponseBody List<Board>
	 * boardAjaxList(){ // mapper통해서 데이터 가져오기 List<Board> list = mapper.boardList();
	 * // return에 list를 그냥 사용하면 WEB-INF/Views/ ________.jsp로 인식해버림 // 반환타입
	 * 앞에 @ResponseBody // json으로 결과물을 주기로했음 [{key:value, key:value.....},
	 * {key:value, key:value}] // json과 java객체 변환을 도와주는 api: Gson 라이브러리의 toJson() //
	 * 메소드 사용없이 바로 만들어주는 api : jackson-databind return list; }
	 */
}
