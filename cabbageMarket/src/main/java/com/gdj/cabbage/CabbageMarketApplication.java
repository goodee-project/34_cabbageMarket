package com.gdj.cabbage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan // servlet 컴포넌트 스캔을 위해 사용
@SpringBootApplication
public class CabbageMarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(CabbageMarketApplication.class, args);
	}

}
