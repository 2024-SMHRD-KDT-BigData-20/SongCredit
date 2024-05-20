package com.smhrd.controller;
// 그냥 POJO가 아니라
// json 데이터를 통신하는 비동기통신을 이한 컨트롤러

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.BoardMapper;
import com.smhrd.entity.Board;

@RestController
public class BoardRestController {

	// Rest api, RestFul 규약 : 요청의 종류에 따라 전송방식을 변경해서 보내주는 방식
	// get, post, delete, put(update)
	
	@Autowired
	private BoardMapper mapper;
	
	
	// RestController에서는 결과물을 돌려줄때 @Responsebody를 안써도 됨
	// 더이상 return이 jsp 이름이 아니라 데이터임을 지정해줌
	// http://localhost:8082/mvc2/board --> 어떤 요청이든지 데이터만 담겨있는 상태
	// 보내줄때 데이터 전송방식만 정해주면 데이터를 각각의 방식으로 처리를 할 수 있음
	@GetMapping("/board")
	public List<Board> boardAjaxList(){
		List<Board> list = mapper.boardList();
		return list;
	}
	
	// title=____&content=___&writer=___
	// 3가지 데이터를 Board객체로 묶어줄 수 있음
	@PostMapping("/board")
	public void boardAjaxInserst(Board vo) {
		// void : DB에 insert하고 나면 돌려받을 값이 없음
		mapper.boardInsert(vo);
		
	}
	
	// Pathvariable로 데이터가 넘어옴
	@DeleteMapping("/board/{idx}")
	// delete 방식으로 요청이 넘어옴
	public void boardAjaxDelete(@PathVariable("idx") int idx) {
		mapper.boardDelete(idx);
		System.out.println("성공");
	}
	
	@PutMapping("/board")
	public void boardAjaxUpdate(@RequestBody Board vo) {
		// 일반적인 경우엔 Board객체로 바로 묶을 수 있는데
		// json으로 변환된 데이터는 @RequestBody
		
		// content 내용만 바꿀 mapper 메소드, sql문 작성
		mapper.boardContentUpdate(vo);
	}
	
	@GetMapping("/updateCount/{idx}")
	public Board updateCount(@PathVariable("idx") int idx) {
		mapper.updateCount(idx);
		// 조회수가 +1됐으면 해당 게시글의 내용을 가져와서 ajax 결과러 돌려주려고 함
		// 그래야 새로운 조회수를 화면에 출력
		Board vo = mapper.boardContent(idx);
		return vo;
	}
	
	
	
	
}
