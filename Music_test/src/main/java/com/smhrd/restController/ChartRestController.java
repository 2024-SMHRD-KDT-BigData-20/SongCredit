package com.smhrd.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.ChartMapper;
import com.smhrd.entity.Chart;

@RestController
public class ChartRestController {
	@Autowired
    private ChartMapper cmapper;

	@GetMapping("/getChart")
	public Chart getChart(@RequestParam int music_idx) {
        Chart chart = cmapper.getChartById(music_idx);
        return chart;
    }
}
