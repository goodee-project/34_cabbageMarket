// 작성자 : 김태훈
package com.gdj.cabbage.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdj.cabbage.mapper.DirectTradeProductRegistrationMapper;
import com.gdj.cabbage.vo.DirectTradeProductImg;
import com.gdj.cabbage.vo.DirectTradeProductRegistration;

@Service
@Transactional
public class DirectTradeService {
	
	@Autowired DirectTradeProductRegistrationMapper directTradeProductRegistrationMapper; // 직거래 상품 등록 테이블 접근 맵퍼
	
	// 직거래 상품 리스트
	public List<Map<String, Object>> getDirectTradeProductList(Map<String, Object> map){
		return directTradeProductRegistrationMapper.selectDirectTradeProductList(map);
	}
	
	// 직거래 상품 6개 랜덤 추출
	public List<Map<String, Object>> getDirectTradeProductRand6(){
		return directTradeProductRegistrationMapper.selectDirectTradeProductRand6();
	}
	
	// 직거래 상품 리스트
	public int getDirectTradeProductTotal(Map<String, Object> map){
		return directTradeProductRegistrationMapper.selectDirectTradeProductTotal(map);
	}
	
	// 직거래 상품 상세정보
	public Map<String, Object> getDirectTradeProductOne(int directTradeProductRegistrationId){
		return directTradeProductRegistrationMapper.selectDirectTradeProductOneByKey(directTradeProductRegistrationId);
	}
	
	// 직거래 상품 이미지
	public List<String> getDirectTradeProductImg(int directTradeProductRegistrationId){
		return directTradeProductRegistrationMapper.selectDirectTradeProductImgByKey(directTradeProductRegistrationId);
	}
	
	// 직거래 상품 등록
	public void addDirectTradeProduct(DirectTradeProductRegistration directTradeProductRegistration, List<MultipartFile> directTradeProductImgs) {
		
		// 직거래 상품 등록
		directTradeProductRegistrationMapper.insertDirectTradeProductRegistration(directTradeProductRegistration);
		
		// 직거래 상품 이미지 등록
		if(directTradeProductImgs != null) {
			int i = 1; // 파일명을 위한 i
			for(MultipartFile f : directTradeProductImgs) {
				
				DirectTradeProductImg directTradeProductImg = new DirectTradeProductImg();
				directTradeProductImg.setDirectTradeProductRegistrationId(directTradeProductRegistration.getDirectTradeProductRegistrationId()); // auto increment로 입력된 값

				// test.txt -> newname.txt
				String originalFilename = f.getOriginalFilename();
				int p = originalFilename.lastIndexOf("."); // 4
				String ext = originalFilename.substring(p).toLowerCase(); // 확장자 타입
				String prename = "imgId_"+directTradeProductImg.getDirectTradeProductRegistrationId()
								 + "_userId_" + directTradeProductRegistration.getUserId() + "_" + i;
				
				String filename = prename+ext;
				directTradeProductImg.setImgName(filename);
				directTradeProductImg.setImgSize(f.getSize());
				directTradeProductImg.setImgType(f.getContentType());

				directTradeProductRegistrationMapper.insertDirectTradeProductImg(directTradeProductImg);

				try {
					File temp = new File("");
					String path = temp.getAbsolutePath();
					f.transferTo(new File(path+"\\src\\main\\webapp\\template\\img\\directTradeImg\\"+filename));
				} catch (Exception e) {
					throw new RuntimeException();
				}
				i++;
			}
		}
		
	}
}