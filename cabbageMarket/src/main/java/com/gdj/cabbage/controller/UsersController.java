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
	private String clientId = "TRIU2aSfWUYeOof9eMyi";
	private String clientSecret = "6Uba5WIRio";
	private String your_callback_url = "http://localhost:80/cabbageMarket/callback";
	@Autowired UsersService usersService;
	@Autowired ApplyProductSalesService applyProductSalesService;
	@Autowired UsersMapper usersMapper;
	
	@GetMapping("/users/myProductManagement")
	public String myProductManagement(Model model, HttpSession session) {		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		List<Map<String,Object>> applyProductSalesDeliveryList = applyProductSalesService.getApplyProductSalesDeliveryList(userId);
		log.debug(Debuging.DEBUG+" applyProductSalesDeliveryList "+applyProductSalesDeliveryList);
		
		model.addAttribute("applyProductSalesDeliveryList", applyProductSalesDeliveryList);
		
		return "/userInfo/myProductManagement";
	}
	
	@GetMapping("/users/shippingAddress")
	public String shippingAddress(Model model, HttpSession session) {
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		List<ShippingAddress> getAddressByUserId = usersService.getAddressByUserId(userId);
		
		model.addAttribute("getAddressByUserId", getAddressByUserId);
		
		return "/userInfo/shippingAddress";
	}
	
	@PostMapping("/users/shippingAddress")
	public String shippingAddress(ShippingAddress shippingAddress, String location, String location2) {
		log.debug(Debuging.DEBUG+" shippingAddress");
		
		shippingAddress.setAddress(location+" "+location2);
		
		int row = usersService.addAddress(shippingAddress);
		log.debug(Debuging.DEBUG+" 컨트롤러 주소 추가 여부 : "+row);
		
		return "redirect:/users/shippingAddress";
	}
	
	@GetMapping("/users/pointRecharge")
	public String pointRecharge() {
		
		return "/userInfo/pointRecharge";
	}
	
	@GetMapping("/users/userPointHistory")
	public String userPointHistory(Model model, HttpSession session,
												@RequestParam(value="content", required = false) String content,
												@RequestParam(value="currentPage", required = true, defaultValue = "1") int currentPage,
												@RequestParam(value="rowPerPage", required = true, defaultValue = "10") int rowPerPage) {
		
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		int userId = (Integer)usersSession.get("userId");
		
		log.debug(Debuging.DEBUG+"content : "+content);
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage);
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage);
		
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("userId", userId);
		serviceMap.put("content", content);
		serviceMap.put("currentPage", currentPage);
		serviceMap.put("rowPerPage", rowPerPage);
		
		Map<String, Object> map = usersService.userPointHistory(serviceMap);
		log.debug(Debuging.DEBUG+" map : "+map);
		
		model.addAttribute("userPointHistory", map.get("userPointHistory"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "userInfo/userPointHistory";
	}
	
	@GetMapping("/users/removeUsers")
	public String removeUser(Model model, @RequestParam(value="userId", required = true) int userId) {
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		Users users = new Users();
		users.setUserId(userId);
		
		int row = usersMapper.selectSnsUserId(users);
		if(row != 0) {
			usersService.deleteSnsUsers(users);
			
			return "redirect:/users/usersLogout";
		}
		
		model.addAttribute("userId", userId);
		
		return "userInfo/removeUser";
	}
	
	@PostMapping("/users/removeUsers")
	public String removeUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);		
		
		int row = usersService.deleteUsers(users);
		
		if(row == 0) {
			return "redirect:/users/removeUsers";
		}
		
		return "redirect:/users/usersLogout";
	}
	
	@GetMapping("/users/modifyUsers")
	public String modifyUsers(Model model, @RequestParam(value = "userId", required = true) int userId) {
		log.debug(Debuging.DEBUG+" userId : "+userId);
		
		Map<String, Object> userInfo = usersService.selectUserInfo(userId);
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);
		
		model.addAttribute("userId", userId);
		model.addAttribute("username", userInfo.get("username"));
		model.addAttribute("email", userInfo.get("email"));
		model.addAttribute("nickname", userInfo.get("nickname"));
		model.addAttribute("mobile", userInfo.get("mobile"));
		model.addAttribute("createDate", userInfo.get("createDate"));
		model.addAttribute("snsType", userInfo.get("snsType"));
		
		return "userInfo/modifyUsers";
	}
	
	@PostMapping("/users/modifyUsers")
	public String modifyUsers(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int row = usersService.updateUsers(users);
		
		if(row == 0) {
			return "redirect:/users/modifyUsers";
		}
		
		return "redirect:/users/userInfo";
	}
	
	@GetMapping("/users/userInfo")
	public String userInfo(Model model, HttpSession session) {
		Map<String, Object> usersSession = (Map<String, Object>) session.getAttribute("usersSession");
		log.debug(Debuging.DEBUG+" usersSession + "+usersSession);
		
		int userId = (int) usersSession.get("userId");
		
		Map<String, Object> userInfo = usersService.selectUserInfo(userId);
		log.debug(Debuging.DEBUG+" userInfo : "+userInfo);
		
		model.addAttribute("userId", userId);
		model.addAttribute("username", userInfo.get("username"));
		model.addAttribute("email", userInfo.get("email"));
		model.addAttribute("nickname", userInfo.get("nickname"));
		model.addAttribute("mobile", userInfo.get("mobile"));
		model.addAttribute("createDate", userInfo.get("createDate"));
		model.addAttribute("snsType", userInfo.get("snsType"));
		
		return "/userInfo/userInfo";
	}
	
	@GetMapping("/users/usersLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index";
	}
	
	@GetMapping("/usersLogin")
	public String login(HttpSession session, Model model) throws UnsupportedEncodingException{
	    String redirectURI = URLEncoder.encode(your_callback_url, "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	    
	    model.addAttribute("apiURL", apiURL);
		
		return "usersLogin";
	}
	
	@GetMapping("/callback")
	public String callback(HttpSession session, HttpServletRequest request, Model model) throws IOException, ParseException {
		String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/naver/callback1", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    log.debug(Debuging.DEBUG+" apiURL "+apiURL);
	    String res = requestToServer(apiURL);
	    if(res != null && !res.equals("")) {
	    	model.addAttribute("res", res);
			Map<String, Object> parsedJson = new JSONParser(res).parseObject();
			log.debug(Debuging.DEBUG+" parseJson"+parsedJson);
			
			String access_token = (String)parsedJson.get("access_token");
			Map<String, Object> usersSession = usersService.naverUserLogin(access_token);
			log.debug(Debuging.DEBUG+"usersSession : "+usersSession);
			session.setAttribute("usersSession", usersSession);
	    } else {
	      model.addAttribute("res", "Login failed!");
	    }
	    return "index";
	}
	

	
	@PostMapping("/usersLogin")
	public String login(HttpSession session, Users users) {
		log.debug(Debuging.DEBUG+" users "+users);
		
		Map<String, Object> usersSession = usersService.loginSession(users);
		log.debug(Debuging.DEBUG+" usersSession : "+usersSession);
		
		if(usersSession != null) {
			session.setAttribute("usersSession", usersSession);
		}else {
			return "usersLogin";
		}
		
		return "redirect:/index";
	}
	
	@GetMapping("/registerUser")
	public String register() {
		return "registerUser";
	}
		
	@PostMapping("/registerUser")
	public String register(Users users) {
		log.debug(Debuging.DEBUG+" users : "+users);
		
		int row = usersService.insertUsers(users);
		log.debug(Debuging.DEBUG+" 회원가입 성공 여부 : "+row);
		
		if(row == 1) {
			return "redirect:/registerUserEmailError";
		}else if(row == 2) {
			return "redirect:/registerUserNicknameError";
		}
		
		return "redirect:/usersLogin";
	}
	
	@GetMapping("/registerUserEmailError")
	public String registerUserEmailError() {
		return "registerUserEmailError";
	}
	
	@GetMapping("/registerUserNicknameError")
	public String registerUserNicknameError() {
		return "registerUserNicknameError";
	}
	
	
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
	    if(responseCode==200) {
	      return res.toString();
	    } else {
	      return null;
	    }
	  }
	
	 private String requestToServer(String apiURL) throws IOException {
		    return requestToServer(apiURL, "");
	 }
		
}
