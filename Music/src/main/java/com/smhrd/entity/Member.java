package com.smhrd.entity;

public class Member {

	// 객체가 잘 설계되었는지 확인하는 방법
	// 어떤 설계가 잘되었는지
	// 1. 정보은닉을 해야함 --> private
	// 2. 멤버변수에 데이터를 넣고 꺼내주는 메소드 --> getter,setter
	// 3. 객체가 가지고 있는 데이터 전체를 string으로 리턴해주는 메소드(디버깅) --> toString()
	// 4. (선택적) 생성자 메소드 
	
	private String user_id;
	private String user_nick;
	private String user_pw;
	private String user_email;
	private String user_birth;
	private String user_gender;
	private String joined_at;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getJoined_at() {
		return joined_at;
	}
	public void setJoined_at(String joined_at) {
		this.joined_at = joined_at;
	}
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_nick=" + user_nick + ", user_pw=" + user_pw + ", user_email="
				+ user_email + ", user_birth=" + user_birth + ", user_gender=" + user_gender + ", joined_at="
				+ joined_at + "]";
	}
	
	
}
