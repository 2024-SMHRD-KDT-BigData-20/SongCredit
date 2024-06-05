package com.smhrd.Mapper;


import java.util.List;
import org.springframework.stereotype.Repository;
import com.smhrd.entity.Like;

@Repository
public interface LikeMapper {
	public List<Like> selectLikeList(String user_id);
	
	
}
