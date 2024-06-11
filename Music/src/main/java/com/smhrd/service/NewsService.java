package com.smhrd.service;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;

@Mapper
public interface NewsService {
	ArrayList<NewsVO> selectNewsList( Pagination pagination );
	int selectNewsListCount( Pagination pagination );
//	커밋을 위한 주석추가

}
