package com.smhrd.service;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

@Service
@Slf4j
public class SeleniumService {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "webdriver.chrome.driver";

	public SeleniumService() {
		chrome();
	}

	private void chrome() {
    	System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	   ChromeOptions options = new ChromeOptions();
	   options.setHeadless(true);
	   options.addArguments("--lang=ko");
       options.addArguments("--no-sandbox");
       options.addArguments("--disable-dev-shm-usage");
       options.addArguments("--disable-gpu");
       options.setCapability("ignoreProtectedModeSettings", true);

		driver = new ChromeDriver(options);
		driver.manage().timeouts().pageLoadTimeout(30. TimeUnit.SECONDS);			
	    	
    }

}
//    @PostConstruct
//    @Bean
//    public void setup() {
//        // 크롬드라이버 경로 설정
//        System.setProperty("webdriver.chrome.driver", "../resources/chromedriver.exe");
//        driver = new ChromeDriver();
//        ChromeOptions options = new ChromeOptions();
//        options.addArguments("--headless");  // 필요한 경우 headless 모드 사용
//        options.addArguments("--disable-gpu");
//        options.addArguments("--no-sandbox");
//
//        driver = new ChromeDriver(options);
//        driver.get("http://localhost:8080/");
//    }
//
//    @PreDestroy
//    public void teardown() {
//        if (driver != null) {
//            driver.quit();
//        }
//    }
//
//    public void clickLink() {
//        // 웹페이지로 이동
//		driver.get("https://www.musicow.com/song/2001");
//
//		// 페이지 소스를 가져와서 JSoup으로 파싱
//		String pageSource = driver.getPageSource();
//		Document doc = Jsoup.parse(pageSource);
//
//
//		// <li> 태그 아래의 <a> 태그 선택
//		Elements links = doc.select(".t_p on a");
//
//		
//
//		// 원하는 <a> 태그를 선택 (예: 첫 번째 <a> 태그)
//		if (!links.isEmpty()) {
//		    Element link = links.get(0);
//		    String href = link.attr("href");
//
//		    // Selenium을 사용하여 해당 <a> 태그 클릭
//		    List<WebElement> webElements = driver.findElements(By.cssSelector("li > a"));
//		    for (WebElement webElement : webElements) {
//		        if (webElement.getAttribute("href").equals(href)) {
//		            webElement.click();
//		            break;
//		        }
//		    }
//		}
//    }
//}
