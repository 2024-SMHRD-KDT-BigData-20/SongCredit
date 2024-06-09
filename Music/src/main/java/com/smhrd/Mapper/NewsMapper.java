package com.smhrd.Mapper;

import java.util.ArrayList;
import java.util.List;

import com.smhrd.entity.NewsVO;

public interface NewsMapper {

	List<NewsVO> topNewsList();
	ArrayList<NewsVO> selectNewsList();
}
