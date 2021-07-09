package com.gdj.cabbage.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.UsersMapper;
import com.gdj.cabbage.vo.SNSInfo;
import com.gdj.cabbage.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UsersService {
	@Autowired UsersMapper usersMapper;
	
	public Map<String, Object> loginSession(Users users){
		log.debug(Debuging.DEBUG+" users "+users);
		
		Map<String, Object> usersSession = usersMapper.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession"+usersSession);
		
		return usersSession;
	}
	
	public int insertUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int selectEmail = usersMapper.selectEmail(users);
		if(selectEmail != 0) {
			log.debug(Debuging.DEBUG+" 이메일 중복 검사 : "+selectEmail);
			return 1;
		}
		
		int selectNickname = usersMapper.selectNickname(users);
		if(selectNickname != 0) {
			log.debug(Debuging.DEBUG+" 닉네임 중복 검사 : "+selectNickname);
			return 2;
		}
		
		int row = usersMapper.registerUser(users);
		log.debug(Debuging.DEBUG+" 회원가입 성공 여부 : "+row);
		
		return 3;
	}
	
	public int naverUserLogin(String access_token) throws ParseException {
        String token = access_token; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가


        String apiURL = "https://openapi.naver.com/v1/nid/me";


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);
        Map<String, Object> parsedJson = new JSONParser(responseBody).parseObject();
        log.debug(Debuging.DEBUG+"parsedJson : "+parsedJson);
       
        String response = (String)parsedJson.get("response");
        Map<String, Object> naverUserInfo = new JSONParser(response).parseObject();
        
        String password = UUID.randomUUID().toString();
        Users users = new Users();
        users.setUsername((String)naverUserInfo.get("name"));
        users.setEmail("N:"+(String)naverUserInfo.get("email"));
        users.setPassword(password);
        users.setNickname("N:"+(String)naverUserInfo.get("nickname"));
        users.setMobile((String)naverUserInfo.get("mobile"));
        
        SNSInfo snsInfo = new SNSInfo();
        snsInfo.setSnsId((String)naverUserInfo.get("id"));
        snsInfo.setSnsName((String)naverUserInfo.get("name"));
        snsInfo.setSnsType("naver");
        snsInfo.setSnsProfile((String)naverUserInfo.get("nickname"));
        
        int userId = 0;
        
        int naverUserRow = usersMapper.selectSnsId((String)naverUserInfo.get("id"));
        if(naverUserRow == 0) {
        	int insertUserRow = usersMapper.registerUser(users);
        	log.debug(Debuging.DEBUG+" naver user 회원 등록 성공 여부 : "+insertUserRow);
        	userId = users.getUserId();
        	snsInfo.setUserId(userId);
        	int insertNaverUserRow = usersMapper.registerNaverUser(snsInfo);
        	log.debug(Debuging.DEBUG+" naver user 회원 sns 등록 성공 여부"+insertNaverUserRow);    	
        }
        
        return userId;
    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
