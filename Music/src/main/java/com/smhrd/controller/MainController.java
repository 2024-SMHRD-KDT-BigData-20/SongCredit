package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/mainList.do")
    public String boardList(HttpServletRequest request) {
        return "main";
    }
}
