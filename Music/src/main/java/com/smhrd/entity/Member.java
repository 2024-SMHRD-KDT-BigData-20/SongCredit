package com.smhrd.entity;

public class Member {

	// 객체가 잘 설계되었는지 확인하는 방법
	// 어떤 설계가 잘되었는지
	// 1. 정보은닉을 해야함 --> private
	// 2. 멤버변수에 데이터를 넣고 꺼내주는 메소드 --> getter,setter
	// 3. 객체가 가지고 있는 데이터 전체를 string으로 리턴해주는 메소드(디버깅) --> toString()
	// 4. (선택적) 생성자 메소드 
	
	private String memId;
	private String memPw;
	private String memName;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + "]";
	}
	
}
