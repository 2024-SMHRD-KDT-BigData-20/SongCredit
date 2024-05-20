package com.smhrd.entity;
// 게시판의 내용을 담는 객체 (Object)
// 게시글번호, 제목, 내용, 작성자, 작성일, 조회수 가짐
public class Board {
	// 기왕이면 객체 이름 == 테이블 이름
	
	// 필드 == 속성 == property
	// 객체에서 데이터 담을 형태
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	
	// 스프링에서는 lombok사용을 안하더라도 생성자를 만들 필요 없음
	// getter, setter 만듦	
	
	//========getter, setter========
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

	
}
