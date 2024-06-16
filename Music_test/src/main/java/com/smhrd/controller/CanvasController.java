//package com.smhrd.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.smhrd.service.SeleniumService;
//
//
//
//@Controller
//public class CanvasController {
//	
//    @Autowired
//    private SeleniumService seleniumService;
//
//    @GetMapping("/fetchCanvas")
//    public String fetchCanvas() {
//        seleniumService.clickLink();
//        return "musiccow";
//    }
//	
//	
//	
//	
//	//	@GetMapping("/fetchCanvas")
////	public String fetchCanvas(Model model) {
////        try {
////            // 외부 HTML 페이지를 가져옴
////            Document doc = Jsoup.connect("https://www.musicow.com/song/2001").get();
////            // <canvas> 요소를 선택
////            Element canvas = doc.select("canvas").first();
////            
////            if (canvas != null) {
////                // <canvas> 요소를 문자열로 변환하여 모델에 추가
////                model.addAttribute("canvasHtml", canvas.outerHtml());
////            } else {
////                model.addAttribute("canvasHtml", "No canvas element found");
////            }
////        } catch (IOException e) {
////            e.printStackTrace();
////            model.addAttribute("canvasHtml", "Error fetching canvas element");
////        }
////        
////        return "musiccow";
////    }
//}
