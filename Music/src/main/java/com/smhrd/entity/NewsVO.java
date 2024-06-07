package com.smhrd.entity;

public class NewsVO {
	private int news_idx;
	private String news_title;
	private String news_content;
	private String news_thumb;
	private String news_maker;
	private String pressed_at;
	private String news_link;
	public int getNews_idx() {
		return news_idx;
	}
	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_thumb() {
		return news_thumb;
	}
	public void setNews_thumb(String news_thumb) {
		this.news_thumb = news_thumb;
	}
	public String getNews_maker() {
		return news_maker;
	}
	public void setNews_maker(String news_marker) {
		this.news_maker = news_marker;
	}
	public String getPressed_at() {
		return pressed_at;
	}
	public void setPressed_at(String pressed_at) {
		this.pressed_at = pressed_at;
	}
	public String getNews_link() {
		return news_link;
	}
	public void setNews_link(String news_link) {
		this.news_link = news_link;
	}
	@Override
	public String toString() {
		return "NewsVO [news_idx=" + news_idx + ", news_title=" + news_title + ", news_content=" + news_content
				+ ", news_thumb=" + news_thumb + ", news_marker=" + news_marker + ", pressed_at=" + pressed_at
				+ ", news_link=" + news_link + "]";
	}
	
	
}
