package com.smhrd.Mapper;

import java.util.ArrayList;

import com.smhrd.entity.Musiccow;
import com.smhrd.entity.Pagination;

public interface MusicCowMapper {
	ArrayList<Musiccow>getMcList( Pagination pagination );
	int mcListCount( Pagination pagination );
}
