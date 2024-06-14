package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.Chart;
import com.smhrd.Mapper.ChartMapper;

@Controller
public class ChartController {

    @Autowired
    ChartMapper cmapper;

    @GetMapping("/chartDetail")
    public String chartDetail(
    		@RequestParam("chart_indx") int chartIndx, 
    		Model model
    	) {
        Chart chart = cmapper.getChartById(chartIndx);
        model.addAttribute("chart", chart);
        return "chartDetail";
    }
}
