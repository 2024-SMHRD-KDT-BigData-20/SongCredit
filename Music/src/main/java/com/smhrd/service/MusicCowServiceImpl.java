package com.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.Mapper.MusicCowMapper;
import com.smhrd.entity.Musiccow;
import com.smhrd.entity.Pagination;

@Service
public class MusicCowServiceImpl implements MusicCowService{
	@Autowired(required=true)
	MusicCowMapper mmapper;
	
	@Override
	public ArrayList<Musiccow> getMcList( Pagination pagination ){
		pagination.setTotalCount( mmapper.mcListCount(pagination));
		return mmapper.getMcList(pagination);
	}
	@Override
	public int mcListCount(Pagination pagination) {
		return mmapper.mcListCount(pagination);
	}
}
