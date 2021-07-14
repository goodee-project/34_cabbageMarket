// 작성자 : 김태훈
package com.gdj.cabbage.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdj.cabbage.mapper.ApplyProductSalesMapper;
import com.gdj.cabbage.vo.ApplyProductSalesDelivery;
import com.gdj.cabbage.vo.ApplyproductSalesDeliveryImg;

@Service
@Transactional
public class ApplyProductSalesService {
	
	@Autowired ApplyProductSalesMapper applyProductSalesMapper;
	
	// 판매 상품 배송 신청 리스트
	public List<Map<String,Object>> getApplyProductSalesDeliveryList(int userId){
		return applyProductSalesMapper.selectApplyProductSalesDeliveryList(userId);
	}
	
	// 직거래 상품 등록
		public void addApplyProductSalesDelivery(ApplyProductSalesDelivery applyProductSalesDelivery, List<MultipartFile> applyProductSalesDeliveryImgs) {
			
			// 직거래 상품 등록
			applyProductSalesMapper.insertApplyProductSalesDelivery(applyProductSalesDelivery);
			
			// 직거래 상품 이미지 등록
			if(applyProductSalesDeliveryImgs != null) {
				int i = 1; // 파일명을 위한 i
				for(MultipartFile f : applyProductSalesDeliveryImgs) {
					
					ApplyproductSalesDeliveryImg applyproductSalesDeliveryImg = new ApplyproductSalesDeliveryImg();
					applyproductSalesDeliveryImg.setApplyProductSalesDeliveryId(applyProductSalesDelivery.getApplyProductSalesDeliveryId()); // auto increment로 입력된 값

					// test.txt -> newname.txt
					String originalFilename = f.getOriginalFilename();
					int p = originalFilename.lastIndexOf("."); // 4
					String ext = originalFilename.substring(p).toLowerCase(); // 확장자 타입
					String prename = "imgId_"+applyproductSalesDeliveryImg.getApplyProductSalesDeliveryId()
									 + "_userId_" + applyProductSalesDelivery.getUserId() + "_" + i;
					
					String filename = prename+ext;
					applyproductSalesDeliveryImg.setImgName(filename);
					applyproductSalesDeliveryImg.setImgSize(f.getSize());
					applyproductSalesDeliveryImg.setImgType(f.getContentType());

					applyProductSalesMapper.insertApplyproductSalesDeliveryImg(applyproductSalesDeliveryImg);

					try {
						File temp = new File("");
						String path = temp.getAbsolutePath();
						f.transferTo(new File(path+"\\src\\main\\webapp\\template\\img\\applyProductImg\\"+filename));
					} catch (Exception e) {
						throw new RuntimeException();
					}
					i++;
				}
			}
			
		}
}
