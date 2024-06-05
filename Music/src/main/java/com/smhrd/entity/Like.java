
package com.smhrd.entity;

public class Like {
	private int interest_idx;
	private int music_idx;
	private String user_id;
	private String created_at;
	public int getInterest_idx() {
		return interest_idx;
	}
	public void setInterest_idx(int interest_idx) {
		this.interest_idx = interest_idx;
	}
	public int getMusic_idx() {
		return music_idx;
	}
	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	@ Override
	public String toString() {
		return "LikeList [interest_idx=" + interest_idx + ", music_idx=" + music_idx + ", interest_memo=" +
				", user_id=" + user_id + ", created_at=" + created_at + "]";
	}
	
	
	
}
