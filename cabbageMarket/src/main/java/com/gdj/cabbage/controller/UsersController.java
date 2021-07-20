package com.gdj.cabbage.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.UsersMapper;
import com.gdj.cabbage.service.ApplyProductSalesService;
import com.gdj.cabbage.service.UsersService;
import com.gdj.cabbage.vo.ShippingAddress;
import com.gdj.cabbage.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsersController {
	private String clientId = "TRIU2aSfWUYeOof9eMyi"; // naver 로그인api 배추마켓 id
	private String clientSecret = "6Uba5WIRio";// naver 로그인api 배추마켓 id 시크릿 코드
	private String your_callback_url = "http://localhost:80/cabbageMarket/callback";// naver 로그인api 로그인 후 응답값을 받기위한 url
	@Autowired UsersService usersService;
	@Autowired ApplyProductSalesService applyProductSalesService;
	@Autowired UsersMapper usersMapper;
	
	@GetMapping("/users/biddingList")
	public String biddingList(Model model, HttpSession session) {
		
		return "/userInfo/biddingList";
	}
	
	// 유저 구매내역 컨트롤러
	@GetMapping("/users/buyingList")
	public String buyingList(Model model, HttpSession session, @RequestParam(value="currentPage" , defaultValue = "1") int currentPage,
																@RequestParam(value="rowPerPage", defaultValue = "5") int rowPerPage) {
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		
		Map<String, Object> serviceMap = usersService.buyingUsedProductByUserId(userId, currentPage, rowPerPage);// 구매내역 리스트 관련 호출 메서드
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);// 디버깅코드
		
		model.addAttribute("byingUsedProductList", serviceMap.get("buyingUsedProductByUserId"));
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("beginRow", serviceMap.get("beginRow"));
		
		return "/userInfo/buyingList";
	}
	
	// 직거래 상품 삭제 컨트롤러
	@GetMapping("/users/removeDirectProduct")
	public String removeDirectProduct(int registerId) {
		log.debug(Debuging.DEBUG+" registerId : "+registerId);//디버깅 코드
		
		int row = usersService.deleteDirectProduct(registerId);// 삭제가 성공하면 1 실패는 0
		log.debug(Debuging.DEBUG+" 직거래 상품 삭제 성공 여부 : "+row);// 디버깅 코드
		
		return "redirect:/users/registedProduct";// 컨트롤러 수행 후 등록상품으로 이동
	}
	
	// 경매 상품 삭제 컨트롤러
	@GetMapping("/users/removeAuctionProduct")
	public String removeAuctionProduct(int applyProductSalesDeliveryId) {
		log.debug(Debuging.DEBUG+" applyProductSalesDeliverId : "+applyProductSalesDeliveryId);// 디버깅 코드
		
		int row = usersService.deleteAuctionProduct(applyProductSalesDeliveryId);// 삭제가 성공하면 1 실패는 0
		log.debug(Debuging.DEBUG+" 경매등록 상품 삭제 성공 여부 : "+row);// 디버깅 코드
		
		return "redirect:/users/registedProduct";// 컨트롤러 수행 후 등록상품으로 이동
	}
	
	// 중고 상품 삭제 컨트롤러
	@GetMapping("/users/removeUsedProduct")
	public String removeUsedProduct(int applyId) {
		log.debug(Debuging.DEBUG+" applyId : "+applyId);//디버깅 코드
		
		int row = usersService.deleteUsedProduct(applyId);// 삭제가 성공하면 1 실패는 0
		log.debug(Debuging.DEBUG+" 중고등록 상품 삭제 성공 여부 : "+row);//디버깅 코드
		
		return "redirect:/users/registedProduct";// 컨트롤러 수행후 등록상품으로 이동
	}
	
	// 등록상품 이동 컨트롤러
	@GetMapping("/users/registedProduct")
	public String registedProduct(Model model, HttpSession session) {
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		List<Map<String, Object>> getUsedProductList = usersService.getUserProductList(userId);// 유저 등록한 중고상품 리스트
		log.debug(Debuging.DEBUG+" getUsedProductList : "+getUsedProductList);// 디버깅 코드
		
		List<Map<String, Object>> getAuctionProductList = usersService.getAuctionProductList(userId);// 유저 등록한 경매상품 리스트
		log.debug(Debuging.DEBUG+" getActionProductList : "+getAuctionProductList);// 디버깅 코드
		
		List<Map<String, Object>> getDirectProductList = usersService.getDirectProductList(userId);// 유저 등록한 직거래상품 리스트
		log.debug(Debuging.DEBUG+" getDirectProductList : "+getDirectProductList);// 디버깅 코드
		
		model.addAttribute("getUsedProductList", getUsedProductList);
		model.addAttribute("getActionProductList", getAuctionProductList);
		model.addAttribute("getDirectProductList", getDirectProductList);
		
		return "/userInfo/registedProduct";
		
	}
	
	// 내 상품 리스트 이동 컨트롤러
	@GetMapping("/users/myProductManagement")
	public String myProductManagement(Model model, HttpSession session) {		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		List<Map<String,Object>> applyProductSalesDeliveryList = applyProductSalesService.getApplyProductSalesDeliveryList(userId);// 안전거래를 위해 배송한 내 상품 리스트
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryList "+applyProductSalesDeliveryList);// 디버깅 코드
		
		model.addAttribute("applyProductSalesDeliveryList", applyProductSalesDeliveryList);
		
		
		return "/userInfo/myProductManagement";
	}
	
	// 내 배송지 삭제 컨트롤러
	@GetMapping("/users/removeAddress")
	public String removeAddress(HttpSession session, int shippingAddressId) {
		log.debug(Debuging.DEBUG+" shippingAddressId : "+shippingAddressId);
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		ShippingAddress shippingAddress = new ShippingAddress();
		shippingAddress.setShippingAddressId(shippingAddressId);
		shippingAddress.setUserId(userId);
		
		int row = usersService.deleteAddress(shippingAddress);
		log.debug(Debuging.DEBUG+" 주소 삭제 성공 여부 : "+row);
		
		return "redirect:/users/shippingAddress";
		
	}
	
	// 내 배송지 관리 이동 컨트롤러
	@GetMapping("/users/shippingAddress")
	public String shippingAddress(Model model, HttpSession session) {
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		List<ShippingAddress> getAddressByUserId = usersService.getAddressByUserId(userId);// 내 배송지 리스트
		log.debug(Debuging.DEBUG+" getAddressByUserId : "+getAddressByUserId); // 디버깅 코드
		
		model.addAttribute("getAddressByUserId", getAddressByUserId);
		
		return "/userInfo/shippingAddress";
	}
	
	// 배숭지 추가 컨트롤러
	@PostMapping("/users/shippingAddress")
	public String shippingAddress(ShippingAddress shippingAddress, String location, String location2) {
		log.debug(Debuging.DEBUG+" shippingAddress");// 디버깅 코드
		
		shippingAddress.setAddress(location+" "+location2);// 도로명 주소+상세주소
		
		int row = usersService.addAddress(shippingAddress);// 추가에 성공하면 1, 실패하면 0
		log.debug(Debuging.DEBUG+" 컨트롤러 주소 추가 여부 : "+row);// 디버깅 코드
		
		return "redirect:/users/shippingAddress";// 추가후 내 배송지 관리로 이동
	}
	
	// 포인트 충전 이동 컨트롤러
	@GetMapping("/users/pointRecharge")
	public String pointRecharge() {
		
		return "/userInfo/pointRecharge";
	}
	
	// 내 포인트 사용 내역 이동 컨트롤러
	@GetMapping("/users/userPointHistory")
	public String userPointHistory(Model model, HttpSession session,
												@RequestParam(value="content", required = false) String content,
												@RequestParam(value="currentPage", required = true, defaultValue = "1") int currentPage,
												@RequestParam(value="rowPerPage", required = true, defaultValue = "5") int rowPerPage) {
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		log.debug(Debuging.DEBUG+"content : "+content);// 디버깅코드
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage);// 디버깅코드
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage);// 디버깅코드
		
		Map<String, Object> serviceMap = new HashMap<>();// 서비스에 넘기기 위한 맵
		serviceMap.put("userId", userId);
		serviceMap.put("content", content);
		serviceMap.put("currentPage", currentPage);
		serviceMap.put("rowPerPage", rowPerPage);
		
		Map<String, Object> map = usersService.userPointHistory(serviceMap);// 포인트 사용 내역 정보를 담은 맵
		log.debug(Debuging.DEBUG+" map : "+map);// 디버깅 코드
		
		model.addAttribute("userPointHistory", map.get("userPointHistory"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginRow", map.get("beginRow"));
		model.addAttribute("currentPage", currentPage);
		
		return "userInfo/userPointHistory";
	}
	
	// 회원 탈퇴 컨트롤러
	@GetMapping("/users/removeUsers")
	public String removeUser(Model model, @RequestParam(value="userId", required = true) int userId) {
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		Users users = new Users();
		users.setUserId(userId);
		
		int row = usersMapper.selectSnsUserId(users);// 네이버 회원인지 검색하는 서비스
		if(row != 0) {
			usersService.deleteSnsUsers(users);// 네이버 회원이라면 탈퇴 서비스 진행
			
			return "redirect:/users/usersLogout";// 네이버 회원이라면 탈퇴 후 로그아웃
		}
		
		model.addAttribute("userId", userId);
		
		return "userInfo/removeUser";
	}
	
	// 회원 탈퇴 컨트롤러
	@PostMapping("/users/removeUsers")
	public String removeUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅 코드
		
		int row = usersService.deleteUsers(users);// 회원 탈퇴 서비스 성공하면 1, 실패하면 0
		
		if(row == 0) {
			return "redirect:/users/removeUsers";// 회원탈퇴 실패시 다시 회원탈퇴로 이동
		}
		
		return "redirect:/users/usersLogout";// 회원탈퇴 성공시 세션 종료
	}
	
	// 회원 수정 페이지 이동 컨트롤러
	@GetMapping("/users/modifyUsers")
	public String modifyUsers(Model model, @RequestParam(value = "userId", required = true) int userId) {
		log.debug(Debuging.DEBUG+" userId : "+userId);// 디버깅 코드
		
		Map<String, Object> userInfo = usersService.selectUserInfo(userId);// 회원 정보가 담긴 맵
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);// 디버깅 코드
		
		model.addAttribute("userId", userId);
		model.addAttribute("username", userInfo.get("username"));
		model.addAttribute("email", userInfo.get("email"));
		model.addAttribute("nickname", userInfo.get("nickname"));
		model.addAttribute("mobile", userInfo.get("mobile"));
		model.addAttribute("createDate", userInfo.get("createDate"));
		model.addAttribute("snsType", userInfo.get("snsType"));
		
		return "userInfo/modifyUsers";
	}
	
	// 회원 수정 컨트롤러
	@PostMapping("/users/modifyUsers")
	public String modifyUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅 코드
		
		int row = usersService.updateUsers(users);// 회원 수정 성공시 1, 실패시 0
		
		if(row == 0) {
			return "redirect:/users/modifyUsers";// 회원 수정 실패시 회원 수정 페이지로 이동
		}
		
		return "redirect:/users/userInfo";// 회원 수정 성공시 유저정보 페이지로 이동
	}
	
	// 유저 정보 페이지 이동 컨트롤러
	@GetMapping("/users/userInfo")
	public String userInfo(Model model, HttpSession session) {
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		log.debug(Debuging.DEBUG+" usersSession + "+usersSession);
		
		int userId = (int) usersSession.get("userId");
		
		Map<String, Object> userInfo = usersService.selectUserInfo(userId);// 유저 정보가 담긴 맵
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);// 디버깅 코드
		
		model.addAttribute("userId", userId);
		model.addAttribute("username", userInfo.get("username"));
		model.addAttribute("email", userInfo.get("email"));
		model.addAttribute("nickname", userInfo.get("nickname"));
		model.addAttribute("mobile", userInfo.get("mobile"));
		model.addAttribute("createDate", userInfo.get("createDate"));
		model.addAttribute("snsType", userInfo.get("snsType"));
		model.addAttribute("registedProductCnt", userInfo.get("registedProductCnt"));
		model.addAttribute("myProductCnt", userInfo.get("myProductCnt"));
		model.addAttribute("addressCnt", userInfo.get("addressCnt"));
		model.addAttribute("buyingCnt", userInfo.get("buyingCnt"));
		
		
		return "/userInfo/userInfo";
	}
	
	// 유저 세션 종료 로그아웃 컨트롤러
	@GetMapping("/users/usersLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index";// 세션 종료후 index 페이지로 이동
	}
	
	// 로그인 페이지 이동 컨트롤러
	@GetMapping("/usersLogin")
	public String login(HttpSession session, Model model) throws UnsupportedEncodingException{
	    String redirectURI = URLEncoder.encode(your_callback_url, "UTF-8");// 네이버 로그인api 호출 후 정보를 전달 받을 url
	    SecureRandom random = new SecureRandom();// 보안랜덤 숫자 객체 생성
	    String state = new BigInteger(130, random).toString();// 130개 숫자 보안랜덤 숫자 생성
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";// 네이버 로그인api 호출 url
	    apiURL += "&client_id=" + clientId;// 배추마켓 플랫폼 id을 더한다
	    apiURL += "&redirect_uri=" + redirectURI;// 네이버 로그인api 호출 후 정보를 전달 받을 url을 더한다
	    apiURL += "&state=" + state;// 랜덤으로 생성된 보안 숫자를 더한다.
	    session.setAttribute("state", state);// 랜덤으로 생성된 보안 숫자를 세션에 저장
	    
	    model.addAttribute("apiURL", apiURL);
		
		return "usersLogin";
	}
	
	// 네이버 로그인 후 전달 받을 컨트롤러
	@GetMapping("/callback")
	public String callback(HttpSession session, HttpServletRequest request, Model model) throws IOException, ParseException {
		String code = request.getParameter("code");// 로그인 후 네이버에서 받은 code
	    String state = request.getParameter("state");// 로그인 후 네이버에서 받은 랜덤 숫자값
	    String redirectURI = URLEncoder.encode("http://localhost:8080/naver/callback1", "UTF-8");// 콜백url
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";// 네이버 로그인을 위한 토큰 검증 url
	    apiURL += "client_id=" + clientId;// 배추마켓 플랫폼 id 을 더한다.
	    apiURL += "&client_secret=" + clientSecret;// 배추마켓 플랫폼 시크릿id을 더한다.
	    apiURL += "&redirect_uri=" + redirectURI;// 콜백 url을 더한다.
	    apiURL += "&code=" + code;// 로그인 후 네이버에서 받은 code을 더한다.
	    apiURL += "&state=" + state;// 로그인 후 네이버에서 받은 랜덤 숫자값을 더한다.
	    log.debug(Debuging.DEBUG+" apiURL "+apiURL);// 디버깅 코드
	    
	    String res = requestToServer(apiURL);// 로그인 요청후 네이버에서 받은 값(json)
	    if(res != null && !res.equals("")) {
	    	model.addAttribute("res", res);
			Map<String, Object> parsedJson = new JSONParser(res).parseObject();// res를 json으로 파싱
			log.debug(Debuging.DEBUG+" parseJson"+parsedJson);// 디버깅 코드
			
			String access_token = (String)parsedJson.get("access_token");// 파싱된 res값에서 access_token 추출
			Map<String, Object> usersSession = usersService.naverUserLogin(access_token);// access_token을 이용하여 프로필 조회 후 유저 정보를 맵에 받아온다.
			log.debug(Debuging.DEBUG+"usersSession : "+usersSession);// 디버깅 코드
			session.setAttribute("usersSession", usersSession);// 유저 정보를 세션에 저장
	    } else {
	      model.addAttribute("res", "Login failed!");// 로그인 실패
	    }
	    return "index";
	}
	

	// 일반 배추마켓 회원 로그인
	@PostMapping("/usersLogin")
	public String login(HttpSession session, Users users) {
		log.debug(Debuging.DEBUG+" users "+users);// 디버깅 코드
		
		Map<String, Object> usersSession = usersService.loginSession(users);// 유저정보를 받아온다.
		log.debug(Debuging.DEBUG+" usersSession : "+usersSession);// 디버깅 코드
		
		if(usersSession != null) {
			session.setAttribute("usersSession", usersSession);// 유저 정보를 받아왔다면 세션에 유저정보 저장
		}else {
			return "usersLogin";// 실패시 다시 로그인 페이지로 이동
		}
		
		return "redirect:/index";// 로그인 성공하면 index페이지로 이동
	}
	
	// 회원가입 페이지 이동 컨트롤러
	@GetMapping("/registerUser")
	public String register() {
		return "registerUser";
	}
	
	// 회원가입 컨트롤러
	@PostMapping("/registerUser")
	public String register(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);// 디버깅코드
		
		int row = usersService.insertUsers(users);// 회원 가입 성공시 1, 실패시 0
		log.debug(Debuging.DEBUG+" 회원가입 성공 여부 : "+row);//디버깅 코드
		
		if(row == 1) {
			return "redirect:/registerUserEmailError";// 회원가입시 이메일 중복이면 이메일 중복 오류 페이지로 이동
		}else if(row == 2) {
			return "redirect:/registerUserNicknameError";// 회원가입시 닉네임 중복이면 닉네임 중복 오류 페이지로 이동
		}
		
		return "redirect:/usersLogin";// 회원 가입 성공시 로그인 페이지로 이동
	}
	
	// 이메일 중복 오류 페이지 이동 컨트롤러
	@GetMapping("/registerUserEmailError")
	public String registerUserEmailError() {
		return "registerUserEmailError";
	}
	
	// 닉네임 중복 오류 페이지 이동 컨트롤러
	@GetMapping("/registerUserNicknameError")
	public String registerUserNicknameError() {
		return "registerUserNicknameError";
	}
	
	// 서버로 호출 url을 보내기 위한 메서드
	private String requestToServer(String apiURL, String headerStr) throws IOException {
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    System.out.println("header Str: " + headerStr);
	    if(headerStr != null && !headerStr.equals("") ) {
	      con.setRequestProperty("Authorization", headerStr);
	    }
	    int responseCode = con.getResponseCode();
	    BufferedReader br;
	    System.out.println("responseCode="+responseCode);
	    if(responseCode == 200) { // 정상 호출
	      br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {  // 에러 발생
	      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    String inputLine;
	    StringBuffer res = new StringBuffer();
	    while ((inputLine = br.readLine()) != null) {
	      res.append(inputLine);
	    }
	    br.close();
	    if(responseCode==200) {// 정상 호출이라면 받아온 값을 String값으로 변환하여 리턴
	      return res.toString();
	    } else {
	      return null;// 실패시 null값 리턴
	    }
	  }
	
	// 헤더 정보가 없으면 빈 값을 리턴
	 private String requestToServer(String apiURL) throws IOException {
		 return requestToServer(apiURL, "");
	 }
		
}
