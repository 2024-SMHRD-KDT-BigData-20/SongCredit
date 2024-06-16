package com.smhrd.entity;

import lombok.Builder;
import lombok.Getter;


@Builder
@Getter
public class crawledMusicCow {
	private String clickData;
	private String Canvas;
	public crawledMusicCow(String clickData, String Canvas) {
		this.clickData=clickData;
	}
}
