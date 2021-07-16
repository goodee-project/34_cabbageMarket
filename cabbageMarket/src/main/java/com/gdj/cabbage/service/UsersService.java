package com.gdj.cabbage.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
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
import com.gdj.cabbage.vo.ShippingAddress;
import com.gdj.cabbage.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UsersService {
	@Autowired UsersMapper usersMapper;
	
	// 직거래 등록 취소 서비스]
	public int deleteDirectProduct(int regiserId) {
		log.debug(Debuging.DEBUG+" regierId : "+regiserId);
		
		int row = usersMapper.deleteDirectProduct(regiserId);
		
		return row;
	}
	
	// 경매 등록 취소 서비스
	public int deleteActionProduct(int applyProductSalesDeliveryId) {
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryId : "+applyProductSalesDeliveryId);
		int findRow = usersMapper.biddingCount(applyProductSalesDeliveryId);
		if(findRow>0) {
			return 0;
		}
		int deleteRow = usersMapper.deleteActionProduct(applyProductSalesDeliveryId);
		int updateRow = usersMapper.updateRegistrationState(applyProductSalesDeliveryId);
		
		return deleteRow+updateRow;
	}
	
	// 중고 등록 취소 서비스
	public int deleteUsedProduct(int applyProductSalesDeliveryId) {
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryId : "+applyProductSalesDeliveryId);
		int deleteRow = usersMapper.deleteUsedProduct(applyProductSalesDeliveryId);
		int updateRow = usersMapper.updateRegistrationState(applyProductSalesDeliveryId);
		
		return deleteRow+updateRow;
	}
	
	// 유저 직거래등록 리스트 출력 서비스
	public List<Map<String, Object>> getDirectProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		List<Map<String, Object>> getDirectProductList = usersMapper.getDirectProductListByUserId(userId);
		log.debug(Debuging.DEBUG+" getDirectProductList : "+getDirectProductList);
		
		return getDirectProductList;
	}
	
	// 유저 경매등록 리스트 출력 서비스
	public List<Map<String, Object>> getAuctionProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		List<Map<String, Object>> getAuctionProductList = usersMapper.getAuctionProductListByUserId(userId);
		log.debug(Debuging.DEBUG+" getAuctionProductList : "+getAuctionProductList);
		
		return getAuctionProductList;
	}
	
	// 유저 중고등록 리스트 출력 서비스
	public List<Map<String, Object>> getUserProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		List<Map<String, Object>> getUserProductList = usersMapper.getUsedProductListByUserId(userId);
		log.debug(Debuging.DEBUG+" getUserProductList : "+getUserProductList);
		
		return getUserProductList;
	}
	
	// 배송지 출력 서비스
	public List<ShippingAddress> getAddressByUserId(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		List<ShippingAddress> getAddressByUserId = usersMapper.getAddressByUserId(userId);
		log.debug(Debuging.DEBUG+" getAddressByUserId : "+getAddressByUserId);
		
		return getAddressByUserId;
	}
	
	// 배송지 추가 서비스
	public int addAddress(ShippingAddress shippingAddress) {
		log.debug(Debuging.DEBUG+" shippingAddress : "+shippingAddress);
		
		int userId = shippingAddress.getUserId();
		
		int count = usersMapper.getAddressCount(userId);
		if(count >=5) {
			return 0;
		}
		
		int row = usersMapper.addAddress(shippingAddress);
		log.debug(Debuging.DEBUG+" 주소 추가 성공 여부 : "+row);
		
		return row;
		
	}
	
	// 유저 포인트 내역 조회
	public Map<String, Object> userPointHistory(Map<String, Object> map){
		log.debug(Debuging.DEBUG+" map : "+map);
		
		String content = (String)map.get("content");
		int userId = (Integer)map.get("userId");
		int currentPage = (Integer)map.get("currentPage");
		int rowPerPage = (Integer)map.get("rowPerPage");
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("content", content);
		serviceMap.put("userId", userId);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rowPerPage", rowPerPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);
		
		int totalRow = usersMapper.userPointHistoryCount(serviceMap);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		
		List<Map<String, Object>> userPointHistory = usersMapper.userPointHistoryList(serviceMap);
		log.debug(Debuging.DEBUG+" userPointHistory : "+userPointHistory);
		
		
		Map<String, Object> controllerMap = new HashMap<>();
		controllerMap.put("userPointHistory", userPointHistory);
		controllerMap.put("lastPage", lastPage);
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);
		
		return controllerMap;
		
	}
	
	// sns 회원 탈퇴 서비스
	public int deleteSnsUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int snsRow = usersMapper.deleteSnsInfo(users);
		log.debug(Debuging.DEBUG+" sns 정보 탈퇴 여부 : "+snsRow);
		
		int row = usersMapper.deleteSnsUser(users);
		log.debug(Debuging.DEBUG+" 탈퇴 성공 여부 : "+row);
		
		return row;
	}
	
	//회원 탈퇴 서비스
	public int deleteUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int row = usersMapper.deleteUser(users);
		log.debug(Debuging.DEBUG+" 탈퇴 성공 여부 : "+row);
		
		if(row == 0) {
			return 0;
		}
		
		return row;
	}
	
	//회원 정보 수정 서비스
	public int updateUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+ users);
		
		int row = usersMapper.updateUsers(users);
		log.debug(Debuging.DEBUG+" 수정 성공 여부 : "+row);
		
		return row;
	}
	
	// 회원 정보 출력 서비스
	public Map<String, Object> selectUserInfo(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		Map<String, Object> userInfo = usersMapper.selectUserInfo(userId);
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);
		
		return userInfo;
	}
	
	// 로그인시 배추마켓 회원 정보를 가져오는 서비스
	public Map<String, Object> loginSession(Users users){
		log.debug(Debuging.DEBUG+" users "+users);
		
		Map<String, Object> usersSession = usersMapper.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession"+usersSession);
		
		return usersSession;
	}
	
	// 회원가입 시 이메일, 닉네임 중복검사
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
	
	// naver sns login 서비스
	public Map<String,Object> naverUserLogin(String access_token) throws ParseException {
        String token = access_token; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가


        String apiURL = "https://openapi.naver.com/v1/nid/me";


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);
        Map<String, Object> parsedJson = new JSONParser(responseBody).parseObject();
        log.debug(Debuging.DEBUG+"parsedJson : "+parsedJson);
       
        Map<String, Object> naverUserInfo = (Map<String, Object>) parsedJson.get("response");
        log.debug(Debuging.DEBUG+" naverUserInfo : "+naverUserInfo);
        
        String password = UUID.randomUUID().toString();
        
        String mobile = (String)naverUserInfo.get("mobile");
        String m1 = mobile.substring(0, mobile.indexOf("-"));
        String m2 = mobile.substring(mobile.indexOf("-")+1, mobile.lastIndexOf("-"));
        String m3 = mobile.substring(mobile.lastIndexOf("-")+1);
        mobile = m1+m2+m3;
        log.debug(Debuging.DEBUG+" mobile : "+mobile);
        
        Users users = new Users();
        users.setUsername((String)naverUserInfo.get("name"));
        users.setEmail("N:"+(String)naverUserInfo.get("email"));
        users.setPassword(password);
        users.setNickname("N:"+(String)naverUserInfo.get("nickname"));
        users.setMobile(mobile);
        
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
        
        String snsId = (String)naverUserInfo.get("id");
        Map<String, Object> usersSession = usersMapper.naverLoginSession(snsId);
        
        
        return usersSession;
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
