package com.smhrd.Mapper;

import java.util.ArrayList;
import java.util.List;

import com.smhrd.entity.NewsVO;
import com.smhrd.entity.Pagination;

public interface NewsMapper {
	List<NewsVO> topNewsList();
	ArrayList<NewsVO> selectNewsList( Pagination pagination );
	int selectNewsListCount( Pagination pagination );
}
