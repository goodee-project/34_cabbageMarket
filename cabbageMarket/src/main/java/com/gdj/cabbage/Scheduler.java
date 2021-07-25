package com.gdj.cabbage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.gdj.cabbage.service.AuctionService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Scheduler {
	@Autowired AuctionService auctionService;
	
    @Scheduled(cron = "0 0 0 * * *") //0초 0분 0시 매일 매월 매요일
    public void printDate () {
    	log.debug(Debuging.DEBUG+"0 //0초 0분 0시 매일 매월 매요일: 스케쥴링");
    	log.debug(Debuging.DEBUG+"스케쥴링에서 보낼 map확인:"+"없음");
    	int cnt = auctionService.modifyAuction();
    	log.debug(Debuging.DEBUG+"스케쥴링에서 받은 cnt확인:"+cnt+"개 상태변경");
    }
}
