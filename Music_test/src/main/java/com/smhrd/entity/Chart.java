package com.smhrd.entity;

public class Chart {
	private int music_idx;
	private String music_title;
	private String artist;
	private String music_genre;
	private String album_name;
	private String album_img;
	private String music_year;
	private String upper_limit;
	private String under_limit;
	private String net_change;

	public int getMusic_idx() {
		return music_idx;
	}

	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}

	public String getMusic_title() {
		return music_title;
	}

	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getMusic_genre() {
		return music_genre;
	}

	public void setMusic_genre(String music_genre) {
		this.music_genre = music_genre;
	}

	public String getAlbum_name() {
		return album_name;
	}

	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}

	public String getAlbum_img() {
		return album_img;
	}

	public void setAlbum_img(String album_img) {
		this.album_img = album_img;
	}

	public String getMusic_year() {
		return music_year;
	}

	public void setMusic_year(String music_year) {
		this.music_year = music_year;
	}

	public String getUpper_limit() {
		return upper_limit;
	}

	public void setUpper_limit(String upper_limit) {
		this.upper_limit = upper_limit;
	}

	public String getUnder_limit() {
		return under_limit;
	}

	public void setUnder_limit(String under_limit) {
		this.under_limit = under_limit;
	}

	public String getNet_change() {
		return net_change;
	}

	public void setNet_change(String net_change) {
		this.net_change = net_change;
	}

	@Override
	public String toString() {
		return "Chart [music_idx=" + music_idx + ", music_title=" + music_title + ", artist=" + artist
				+ ", music_genre=" + music_genre + ", album_name=" + album_name + ", album_img=" + album_img
				+ ", music_year=" + music_year + ", upper_limit=" + upper_limit + ", under_limit=" + under_limit
				+ ", net_change=" + net_change + "]";
	}

}
