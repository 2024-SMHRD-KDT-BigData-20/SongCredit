package com.smhrd.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Musiccow;
import com.smhrd.entity.Pagination;

@Mapper
public interface MusicCowService {
	ArrayList<Musiccow> getMcList( Pagination pagination );
	int mcListCount( Pagination pagination );
}
