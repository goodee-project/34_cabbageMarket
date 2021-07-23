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
import com.gdj.cabbage.mapper.ApplyProductSalesMapper;
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
	@Autowired ApplyProductSalesMapper applyProductSalesMapper;
	
	// 유저 판매 내역 리스트
	public Map<String, Object> sellList(int userId, int currentPage, int rowPerPage){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		int beginRow = (currentPage-1)*rowPerPage;// 페이지 시작 행
		
		Map<String, Object> serviceMap = new HashMap<>();// 맵에 구매내역 리스트를 받아오기 위한 정보를 저장하기 위한 맵
		serviceMap.put("userId", userId);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rowPerPage", rowPerPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);// 디버깅 코드
		
		
		List<Map<String, Object>> sellList = usersMapper.sellListByUser(serviceMap);// 유저 구매내역 리스트
		
		int totalRow = usersMapper.sellListCount(userId);// 총 행의 수
		int lastPage = totalRow/rowPerPage;// 마지막 페이지
		if(totalRow % rowPerPage != 0) {// 마지막 페이지의 자료 수가 보여줄 행의 수와 나눠 떨어지지 않으면 마지막페이지에 1을 더한다.
			lastPage++;
		}
		
		Map<String, Object> controllerMap = new HashMap<>();
		controllerMap.put("sellList", sellList);
		controllerMap.put("lastPage", lastPage);
		controllerMap.put("beginRow", beginRow);
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);// 디버깅 코드
		
		return controllerMap;
	
	}
	
	// 유저 입찰 내역 리스트
	public Map<String, Object> biddingList(int userId, int currentPage, int rowPerPage){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		int beginRow = (currentPage-1)*rowPerPage;// 페이지 시작 행
		
		Map<String, Object> serviceMap = new HashMap<>();// 맵에 구매내역 리스트를 받아오기 위한 정보를 저장하기 위한 맵
		serviceMap.put("userId", userId);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rowPerPage", rowPerPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);// 디버깅 코드
		
		
		List<Map<String, Object>> biddingList = usersMapper.getBiddingListByUser(serviceMap);// 유저 구매내역 리스트
		
		int totalRow = usersMapper.biddingListCount(userId);// 총 행의 수
		int lastPage = totalRow/rowPerPage;// 마지막 페이지
		if(totalRow % rowPerPage != 0) {// 마지막 페이지의 자료 수가 보여줄 행의 수와 나눠 떨어지지 않으면 마지막페이지에 1을 더한다.
			lastPage++;
		}
		
		Map<String, Object> controllerMap = new HashMap<>();
		controllerMap.put("biddingList", biddingList);
		controllerMap.put("lastPage", lastPage);
		controllerMap.put("beginRow", beginRow);
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);// 디버깅 코드
		
		return controllerMap;
	
	}
	
	// 유저 중고 상품 구매 내역 리스트
	public Map<String, Object> buyingUsedProductByUserId(int userId, int currentPage, int rowPerPage){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		int beginRow = (currentPage-1)*rowPerPage;// 페이지 시작 행
		
		Map<String, Object> serviceMap = new HashMap<>();// 맵에 구매내역 리스트를 받아오기 위한 정보를 저장하기 위한 맵
		serviceMap.put("userId", userId);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rowPerPage", rowPerPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);// 디버깅 코드
		
		
		List<Map<String, Object>> buyingUsedProductByUserId = usersMapper.getBuyingUsedProductByUserId(serviceMap);// 유저 구매내역 리스트
		
		int totalRow = usersMapper.getBuyingUsedProductCount(userId);// 총 행의 수
		int lastPage = totalRow/rowPerPage;// 마지막 페이지
		if(totalRow % rowPerPage != 0) {// 마지막 페이지의 자료 수가 보여줄 행의 수와 나눠 떨어지지 않으면 마지막페이지에 1을 더한다.
			lastPage++;
		}
		
		Map<String, Object> controllerMap = new HashMap<>();
		controllerMap.put("buyingUsedProductByUserId", buyingUsedProductByUserId);
		controllerMap.put("lastPage", lastPage);
		controllerMap.put("beginRow", beginRow);
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);// 디버깅 코드
		
		return controllerMap;
	
	}
	
	// 직거래 등록 취소 서비스
	public int deleteDirectProduct(int regiserId) {
		log.debug(Debuging.DEBUG+" regierId : "+regiserId);// 디버깅 코드
		
		int row = usersMapper.deleteDirectProduct(regiserId);// 직거래 등록 취소 쿼리 호출
		
		return row;
	}
	
	// 경매 등록 취소 서비스
	public int deleteAuctionProduct(int applyProductSalesDeliveryId) {
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryId : "+applyProductSalesDeliveryId);// 디버깅 코드
		int findRow = usersMapper.biddingCount(applyProductSalesDeliveryId);
		if(findRow>0) {// 입찰이 하나라도 있다면 서비스 종료
			return 0;
		}
		int deleteRow = usersMapper.deleteAuctionProduct(applyProductSalesDeliveryId);// 입찰이 없다면 경매 등록 정보 삭제 쿼리 실행
		int updateRow = usersMapper.updateRegistrationState(applyProductSalesDeliveryId);// 입찰이 없다면 등록상품 상태 수정
		
		return deleteRow+updateRow;
	}
	
	// 중고 등록 취소 서비스
	public int deleteUsedProduct(int applyProductSalesDeliveryId) {
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryId : "+applyProductSalesDeliveryId);// 디버깅 코드
		int deleteRow = usersMapper.deleteUsedProduct(applyProductSalesDeliveryId);// 중고 등록 정보 삭제 쿼리실행
		int updateRow = usersMapper.updateRegistrationState(applyProductSalesDeliveryId);// 등록상품 상태 수정
		
		return deleteRow+updateRow;
	}
	
	// 유저 직거래등록 리스트 출력 서비스
	public List<Map<String, Object>> getDirectProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		List<Map<String, Object>> getDirectProductList = usersMapper.getDirectProductListByUserId(userId);// 직거래 리스트 쿼리 
		log.debug(Debuging.DEBUG+" getDirectProductList : "+getDirectProductList);// 디버깅 코드
		
		return getDirectProductList;
	}
	
	// 유저 경매등록 리스트 출력 서비스
	public List<Map<String, Object>> getAuctionProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		List<Map<String, Object>> getAuctionProductList = usersMapper.getAuctionProductListByUserId(userId);// 경매등록 리스트 쿼리
		log.debug(Debuging.DEBUG+" getAuctionProductList : "+getAuctionProductList);// 디버깅 코드
		
		return getAuctionProductList;
	}
	
	// 유저 중고등록 리스트 출력 서비스
	public List<Map<String, Object>> getUserProductList(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		List<Map<String, Object>> getUserProductList = usersMapper.getUsedProductListByUserId(userId);// 중고상품 리스트 쿼리
		log.debug(Debuging.DEBUG+" getUserProductList : "+getUserProductList);// 디버깅 코드
		
		return getUserProductList;
	}
	
	// 배송지 삭제 서비스
	public int deleteAddress(ShippingAddress shippingAddress) {
		log.debug(Debuging.DEBUG+" shippingAddress : "+shippingAddress);
		
		int row = usersMapper.deleteAddress(shippingAddress);
		log.debug(Debuging.DEBUG+" 배송지 삭제 성공 여부 : "+row);
		
		return row;
	}
	
	// 배송지 출력 서비스
	public List<ShippingAddress> getAddressByUserId(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		List<ShippingAddress> getAddressByUserId = usersMapper.getAddressByUserId(userId);// 배송지 출력 쿼리
		log.debug(Debuging.DEBUG+" getAddressByUserId : "+getAddressByUserId);// 디버깅 코드
		
		return getAddressByUserId;
	}
	
	// 배송지 추가 서비스
	public int addAddress(ShippingAddress shippingAddress) {
		log.debug(Debuging.DEBUG+" shippingAddress : "+shippingAddress);// 디버깅 코드
		
		int userId = shippingAddress.getUserId();
		
		int count = usersMapper.getAddressCount(userId);// 유저 배송지 수
		if(count >=5) {// 배송지 수가 5개 이상이면 서비스 종료
			return 0;
		}
		
		int row = usersMapper.addAddress(shippingAddress);// 배송지 추가 성공시 1, 실패시 0
		log.debug(Debuging.DEBUG+" 주소 추가 성공 여부 : "+row);// 디버깅 코드
		
		return row;
		
	}
	
	// 유저 포인트 내역 조회
	public Map<String, Object> userPointHistory(Map<String, Object> map){
		log.debug(Debuging.DEBUG+" map : "+map);// 디버깅 코드
		
		String content = (String)map.get("content");
		int userId = (Integer)map.get("userId");
		int currentPage = (Integer)map.get("currentPage");
		int rowPerPage = (Integer)map.get("rowPerPage");
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> serviceMap = new HashMap<>();// 포인트 내역 조회를 위한 정보를 맵에 담는다.
		serviceMap.put("content", content);
		serviceMap.put("userId", userId);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rowPerPage", rowPerPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);// 디버깅 코드
		
		int totalRow = usersMapper.userPointHistoryCount(serviceMap);// 포인트 조회를 위한 총 행의 수
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {// 총 행의수와 보여질 행의 수가 나누어 떨어지지 않으면 마지막페이지에 +1
			lastPage++;
		}
		
		List<Map<String, Object>> userPointHistory = usersMapper.userPointHistoryList(serviceMap);// 포인트 내역 출력 쿼리
		log.debug(Debuging.DEBUG+" userPointHistory : "+userPointHistory);// 디버깅 코드
		
		
		Map<String, Object> controllerMap = new HashMap<>();// 컨트롤러로 보내기위한 맵
		controllerMap.put("userPointHistory", userPointHistory);
		controllerMap.put("lastPage", lastPage);
		controllerMap.put("beginRow", beginRow);
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);// 디버깅 코드
		
		return controllerMap;
		
	}
	
	// sns 회원 탈퇴 서비스
	public int deleteSnsUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅 코드
		
		int snsRow = usersMapper.deleteSnsInfo(users);// sns 정보 탈퇴로 수정
		log.debug(Debuging.DEBUG+" sns 정보 탈퇴 여부 : "+snsRow);// 디버깅 코드
		
		int row = usersMapper.deleteSnsUser(users);// 회원정보 탈퇴로 수정
		log.debug(Debuging.DEBUG+" 탈퇴 성공 여부 : "+row);// 디버깅 코드
		
		return row;
	}
	
	//회원 탈퇴 서비스
	public int deleteUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅 코드
		
		int row = usersMapper.deleteUser(users);// 회원정보 탈퇴로 수정
		log.debug(Debuging.DEBUG+" 탈퇴 성공 여부 : "+row);// 디버깅 코드
		
		if(row == 0) {// 회원 탈퇴 실패시 서비스 종료
			return 0;
		}
		
		return row;
	}
	
	//회원 정보 수정 서비스
	public int updateUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+ users);// 디버깅 코드
		
		int row = usersMapper.updateUsers(users);
		log.debug(Debuging.DEBUG+" 수정 성공 여부 : "+row);// 디버깅 코드
		
		return row;
	}
	
	// 회원 정보 출력 서비스
	public Map<String, Object> selectUserInfo(int userId){
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		Map<String, Object> userInfo = usersMapper.selectUserInfo(userId);
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);// 디버깅 코드
		
		int registedProductCnt = usersMapper.getDirectProductListByUserId(userId).size()+usersMapper.getUsedProductListByUserId(userId).size()+usersMapper.getAuctionProductListByUserId(userId).size(); // 유저 상품 등록 수
		int myProductCnt = applyProductSalesMapper.selectApplyProductSalesDeliveryList(userId).size();
		int addressCnt = usersMapper.getAddressCount(userId);
		int buyingCnt = usersMapper.getBuyingUsedProductCount(userId);
		int biddingCnt = usersMapper.biddingListCount(userId);
		int sellingCnt = usersMapper.sellListCount(userId);
		
		userInfo.put("registedProductCnt", registedProductCnt);
		userInfo.put("myProductCnt", myProductCnt);
		userInfo.put("addressCnt", addressCnt);
		userInfo.put("buyingCnt", buyingCnt);
		userInfo.put("biddingCnt", biddingCnt);
		userInfo.put("sellingCnt", sellingCnt);
		
		return userInfo;
	}
	
	// 로그인시 배추마켓 회원 정보를 가져오는 서비스
	public Map<String, Object> loginSession(Users users){
		log.debug(Debuging.DEBUG+" users "+users);// 디버깅 코드
		
		Map<String, Object> usersSession = usersMapper.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession"+usersSession);// 디버깅 코드
		
		return usersSession;
	}
	
	// 회원가입 시 이메일, 닉네임 중복검사
	public int insertUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅 코드
		
		int selectEmail = usersMapper.selectEmail(users);
		if(selectEmail != 0) {// 이메일 중복시 1을 리턴
			log.debug(Debuging.DEBUG+" 이메일 중복 검사 : "+selectEmail);// 디버깅 코드
			return 1;
		}
		
		int selectNickname = usersMapper.selectNickname(users);
		if(selectNickname != 0) {// 닉네임 중복시 2를 리턴
			log.debug(Debuging.DEBUG+" 닉네임 중복 검사 : "+selectNickname);// 디버깅 코드
			return 2;
		}
		
		int row = usersMapper.registerUser(users);
		log.debug(Debuging.DEBUG+" 회원가입 성공 여부 : "+row);// 디버깅 코드
		
		return 3;// 회원가입이 성공하면 3을 리턴
	}
	
	// naver sns login 서비스
	public Map<String,Object> naverUserLogin(String access_token) throws ParseException {
        String token = access_token; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가


        String apiURL = "https://openapi.naver.com/v1/nid/me";// 네이버 프로필 조회 api


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);
        Map<String, Object> parsedJson = new JSONParser(responseBody).parseObject();
        log.debug(Debuging.DEBUG+"parsedJson : "+parsedJson);// 디버깅 코드
       
        Map<String, Object> naverUserInfo = (Map<String, Object>) parsedJson.get("response");
        log.debug(Debuging.DEBUG+" naverUserInfo : "+naverUserInfo);// 디버깅 코드
        
        String password = UUID.randomUUID().toString();// 패스워드에 랜덤값 저장
        
        // 핸드폰 번호에 '-'를 빼는 과정
        String mobile = (String)naverUserInfo.get("mobile");
        String m1 = mobile.substring(0, mobile.indexOf("-"));
        String m2 = mobile.substring(mobile.indexOf("-")+1, mobile.lastIndexOf("-"));
        String m3 = mobile.substring(mobile.lastIndexOf("-")+1);
        mobile = m1+m2+m3;
        log.debug(Debuging.DEBUG+" mobile : "+mobile);// 디버깅 코드
        
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
        if(naverUserRow == 0) {// 네이버 id로 회원가입 된적이 없다면 자동으로 회원가입 되게 한다.
        	int insertUserRow = usersMapper.registerUser(users);
        	log.debug(Debuging.DEBUG+" naver user 회원 등록 성공 여부 : "+insertUserRow);// 디버깅 코드
        	userId = users.getUserId();
        	snsInfo.setUserId(userId);
        	int insertNaverUserRow = usersMapper.registerNaverUser(snsInfo);
        	log.debug(Debuging.DEBUG+" naver user 회원 sns 등록 성공 여부"+insertNaverUserRow);// 디버깅 코드    	
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
