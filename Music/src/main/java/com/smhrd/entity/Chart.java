package com.smhrd.entity;

public class Chart {
	private int chart_indx;
	private String music_idx;
	private String music_name;
	private String music_singer;
	private int chart_sl;
	private int chart_now;
	public int getChart_indx() {
		return chart_indx;
	}
	public void setChart_idx(int chart_indx) {
		this.chart_indx = chart_indx;
	}
	public String getMusic_idx() {
		return music_idx;
	}
	public void setMusic_idx(String music_idx) {
		this.music_idx = music_idx;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getMusic_singer() {
		return music_singer;
	}
	public void setMusic_singer(String music_singer) {
		this.music_singer = music_singer;
	}
	public int getChart_sl() {
		return chart_sl;
	}
	public void setChart_sl(int chart_sl) {
		this.chart_sl = chart_sl;
	}
	public int getChart_now() {
		return chart_now;
	}
	public void setChart_now(int chart_now) {
		this.chart_now = chart_now;
	}
	@Override
	public String toString() {
		return "Chart [chart_indx=" + chart_indx + ", music_idx=" + music_idx + ", music_name=" + music_name
				+ ", music_singer=" + music_singer + ", chart_sl=" + chart_sl + ", chart_now=" + chart_now + "]";
	}
}
