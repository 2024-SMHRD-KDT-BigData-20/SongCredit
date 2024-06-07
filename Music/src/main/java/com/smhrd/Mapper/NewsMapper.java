package com.smhrd.Mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.smhrd.entity.NewsVO;

@Repository
public interface NewsMapper {

	List<NewsVO> topNewsList();

	ArrayList<NewsVO> selectNewsList();

}
