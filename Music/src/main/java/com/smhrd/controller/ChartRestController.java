package com.smhrd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.Mapper.ChartMapper;
import com.smhrd.entity.Chart;

@RestController
public class ChartRestController {

    @Autowired
    private ChartMapper cmapper;

    @GetMapping("/chart")
    public List<Chart> ChartList() {
        List<Chart> list = cmapper.chartList();
        return list;
    }
    @GetMapping("/chartData.do")
    public Map<String, Object> getChartData(@RequestParam String type) {
        Map<String, Object> response = new HashMap<>();	
        int[] data = new int[13];

        // 임의 데이터 설정
        switch (type) {
            case "시세":
                data = new int[]{198, 212, 241, 221, 289, 278, 500, 222, 200, 344, 210, 156, 111};
                break;
            case "조회수":
                data = new int[]{150, 180, 210, 190, 250, 230, 270, 200, 190, 300, 180, 140, 100};
                break;
            case "좋아요수":
                data = new int[]{120, 150, 170, 160, 200, 180, 220, 170, 160, 250, 150, 120, 90};
                break;
            case "스트리밍수":
                data = new int[]{130, 160, 180, 170, 210, 190, 230, 180, 170, 260, 160, 130, 100};
                break;
            case "키워드":
                data = new int[]{110, 140, 160, 150, 190, 170, 210, 160, 150, 240, 140, 110, 80};
                break;
            case "거래량":
                data = new int[]{140, 170, 190, 180, 220, 200, 240, 190, 180, 270, 170, 140, 110};
                break;
            case "감정분석":
                data = new int[]{198, 212, 241, 221, 289, 278, 300, 222, 200, 344, 210, 156, 111};
                break;
            default:
                break;
        }

        response.put("values", data);
        return response;
    }
    
}
