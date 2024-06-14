package com.smhrd.service;

import java.util.List;

import com.smhrd.entity.Like;

public interface LikeService {
	List<Like> selectLikeList(String user_id) throws Exception;
}
