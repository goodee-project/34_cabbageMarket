package com.gdj.cabbage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan // servlet 컴포넌트 스캔을 위해 사용
@SpringBootApplication
@EnableScheduling //210722 스케쥴링 추가
public class CabbageMarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(CabbageMarketApplication.class, args);
	}

}
