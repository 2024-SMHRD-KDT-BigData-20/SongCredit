package com.smhrd.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.entity.Chart;

@Mapper
public interface ChartMapper {
    List<Chart> chartList();

    Chart getChartById(@Param("music_idx") int music_idx);

	List<Chart> getupper();
	List<Chart> getunder();

    
}
