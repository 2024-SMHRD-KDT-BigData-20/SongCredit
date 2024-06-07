package com.smhrd.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.smhrd.entity.Chart;

@Mapper
public interface ChartMapper {
    List<Chart> chartList();

	Chart getChartById(int chartIndx);
    
}
