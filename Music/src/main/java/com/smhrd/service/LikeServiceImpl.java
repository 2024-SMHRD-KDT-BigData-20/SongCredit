package com.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Mapper.LikeMapper;
import com.smhrd.entity.Like;

@Service
public class LikeServiceImpl implements LikeService {
	@Autowired(required=true)
	private LikeMapper lmapper;
	
	@Override
	public List<Like> selectLikeList(String user_id) throws Exception{
		return lmapper.selectLikeList(user_id);
		}
}
