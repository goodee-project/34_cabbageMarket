// 작성자 : 김태훈
// 수정자 : 강혜란 (210716)
package com.gdj.cabbage.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.ApplyProductSalesMapper;
import com.gdj.cabbage.vo.ApplyProductSalesDelivery;
import com.gdj.cabbage.vo.ApplyproductSalesDeliveryImg;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
		
		//modifyApplyProductSalesDeliveryReturn 에 상세정보를 가져오는 Service
		public Map<String, Object> getApplyOne(int applyId) {
			log.debug(Debuging.DEBUG+"2 controller에서 보낸 applyId확인"+applyId);
			log.debug(Debuging.DEBUG+"3 mapper로 보낼 applyId 학인 : "+ applyId);
			Map<String,Object> applyOne = applyProductSalesMapper.selectApplyOne(applyId); //상세정보 가져오는 mapper
			log.debug(Debuging.DEBUG+"4 mapper에서 가져온 applyOne 학인 : "+ applyOne.toString());
			return applyOne;
		}
		//modifyApplyProductSalesDeliveryReturn에 이미지를 가져오는 Service
		public List<String> getApplyImg(int applyId) {
			log.debug(Debuging.DEBUG+"2 controller에서 보낸 applyId확인"+applyId);
			log.debug(Debuging.DEBUG+"3 mapper로 보낼 applyId 학인 : "+ applyId);
			List<String> applyImgs = applyProductSalesMapper.selectApplyImgByKey(applyId); //이미지를 가져오는 mapper
			log.debug(Debuging.DEBUG+"4 mapper에서 가져온 applyImgs 학인 : "+ applyImgs.toString());
			return applyImgs;
		}
		
		//modifyApplyProductSalesDeliveryReturn 에서 가져온값으로 수정하는 Service
		public int modifyApplyRetrun(Map<String, Object> map) {
			log.debug(Debuging.DEBUG+"2 controller에서 보낸 map확인"+map);
			log.debug(Debuging.DEBUG+"3 mapper로 보낼 map 학인 : "+ map);
			
			int cnt = 0 ;
			if (map.get("address") != null) { //address가 있다면 update
				cnt = applyProductSalesMapper.updateApplyOne(map); //업데이트를 하는 mapper
			}
			log.debug(Debuging.DEBUG+"4 mapper에서 가져온 cnt 학인 : "+ cnt); 
			
			if (cnt==0) { //현재 주석처리
				cnt = applyProductSalesMapper.insertPCROne( map.get("applyId"));
			}
			return cnt;
		}
}
