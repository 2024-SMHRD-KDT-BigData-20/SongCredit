package com.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Mapper.NewsMapper;
import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;

@Service
public class NewsServiceImpl implements NewsService{
	@Autowired(required=true)
	NewsMapper nmapper;
	
	@Override
	public ArrayList<NewsVO> selectNewsList( Pagination pagination ) {
		pagination.setTotalCount( nmapper.selectNewsListCount( pagination ) );
		
		return nmapper.selectNewsList( pagination );
	}

	@Override
	public int selectNewsListCount(Pagination pagination) {
		// TODO Auto-generated method stub
		return nmapper.selectNewsListCount( pagination );
	}
}
