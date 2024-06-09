package com.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;

@Service
public class NewsServiceImpl implements NewsService{
	@Autowired(required=true)
	private NewsMapper nmapper;
	
	@Override
	public ArrayList<NewsVO> selectNewsList()throws Exception{
		return nmapper.selectNewsList();
	}
}
