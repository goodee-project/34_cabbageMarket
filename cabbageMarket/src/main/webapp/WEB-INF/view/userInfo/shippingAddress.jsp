<!-- 작성자 : 이재범 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
	<title>배송지 관리</title>
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">
	<style>
		.card{
			padding-left: 10px;
			padding-top: 10px;
			padding-bottom: 10px;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			let numberCode =  /^[0-9]+(.[0-9]+)?$/;
			let row = 0;
			
			$('#btn').click(function(){
				if($('#recipientName').val() == ''){
					$('#recipientName').attr('placeholder','수령인 성함을 작성해주세요');	
				}else if($('#recipientPhoneNumber').val() == ''){
					$('#recipientPhoneNumber').attr('placeholder','수령인 핸드폰 번호를 작성해주세요');
				}else if(!numberCode.test($('#recipientPhoneNumber').val())){
					$('#recipientPhoneNumber').val('');
					$('#recipientPhoneNumber').attr('placeholder','수령인 핸드폰 번호를 숫자로 작성해주세요');
				}else if($('#location2').val() == ''){
					$('#location2').attr('placeholder','상세 주소를 작성해주세요');
				}else{
					$('#addAddressForm').submit();
				}
			});
			

			
			let i=1;
			for(i=1; i<=5; i++){
				alterClick(i);
			};
			
			function alterClick(i){
				$('#alterAddressBtn'+i).click(function(){
					console.log(i+'버튼 클릭');
					if($('#recipientName'+i).val() == ''){
						$('#recipientName'+i).attr('placeholder','수령인 성함을 작성해주세요');	
					}else if($('#recipientPhoneNumber'+i).val() == ''){
						$('#recipientPhoneNumber'+i).attr('placeholder','수령인 핸드폰 번호를 작성해주세요');
					}else if(!numberCode.test($('#recipientPhoneNumber'+i).val())){
						$('#recipientPhoneNumber'+i).val('');
						$('#recipientPhoneNumber'+i).attr('placeholder','수령인 핸드폰 번호를 숫자로 작성해주세요');
					}else if($('#location2_'+i).val() == ''){
						$('#location2_'+i).attr('placeholder','상세 주소를 작성해주세요');
					}else{
						$('#alterAddressForm'+i).submit();
					}
				});
			};
			
			
			
			
		});
	</script>
	
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<!-- Humberger End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/index">Home</a> <span>Cabbage Market</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Department</h4>
							<ul style="font-weight: bolder;">
								<li><a href="${pageContext.request.contextPath}/users/userInfo">회원정보</a></li>
								<li><a href="${pageContext.request.contextPath}/users/registedProduct">등록상품</a></li>
								<li><a href="${pageContext.request.contextPath}/users/userPointHistory">포인트 사용 조회</a></li>
								<li><a href="${pageContext.request.contextPath}/users/buyingList">구매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/sellList">판매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/biddingList">입찰 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/myProductManagement">내 상품 관리</a></li>
								<li><a href="${pageContext.request.contextPath}/users/shippingAddress">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>배송지 관리</h2>
						</div>
						<div>
							<div class="col-md-10">									
								<div class="card">
									<form action="${pageContext.request.contextPath}/users/shippingAddress" method="post" id="addAddressForm">										
										<h4><b>배송지 추가 (최대 5개 등록 가능)</b></h4>
										<br>
										<input type="hidden" name="userId" value='${usersSession.get("userId")}'>											
										<input type="text" id="recipientName" name="recipientName" placeholder="수령인 성함" style="display:inline-block; width: 85%" class="form-control">
										<input type="text" id="recipientPhoneNumber" name="recipientPhoneNumber" placeholder="수령인 핸드폰 번호" style="display:inline-block; width: 85%" class="form-control">
										<input type="text" id="sample5_address" name="location" placeholder="도로명 주소" readonly="readonly" style="display:inline-block; width: 85%" class="form-control">
										<input class="btn btn-dark" type="button" onclick="sample5_execDaumPostcode()" value="검색" style="display:inline-block; width: 10%">
										<input type="text" id="location2" name="location2" placeholder="상세 주소" style="display:inline-block; width: 85%" class="form-control">
										<div>	
											<br>	
											<button type="button" id="btn" class="btn btn-outline-success">추가</button>	
										</div>																										
									</form>
								</div>
							</div>
							<br>
							<hr>
							<div>
								<h3><b>배송지</b></h3>
							</div>
							<br>		
							<div class="col-md-10">
								<c:set var="index" value="0"/>
								<c:forEach var="a" items="${getAddressByUserId}">
						          <div class="card">
						            <div class="card-block">
						              <h4 class="card-title"><b>${a.recipientName}</b></h4>
						              <h6 class="card-subtitle text-muted">${a.recipientPhoneNumber}</h6>
						              <p class="card-text p-y-1">${a.address}</p>
						              <div class="row">
						              	<div class="col-10"></div>
						              	<div class="col-2">						              		
	                                    	<button type="button" data-toggle="modal" data-target="#myModal${index=index+1}" class="btn btn-success">수정</button>                                  		 
						              	</div>
						              </div>						              
						            </div>
						          </div>
						          <br>
						          	<!-- The Modal -->
									  <div class="modal" id="myModal${index}">
									    <div class="modal-dialog">
									      <div class="modal-content">
									      
									        <!-- Modal Header -->
									        <div class="modal-header">
									          <h4 class="modal-title"><b>배송지 수정</b></h4>
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									        </div>
									        
									        <!-- Modal body -->
									        <form method="post" id="alterAddressForm${index}" action="${pageContext.request.contextPath}/users/alterAddress">
										        <input type="hidden" name="shippingAddressId" value="${a.shippingAddressId}">
										        <div class="modal-body">
										        	<input type="hidden" name="userId" value='${usersSession.get("userId")}'>											
													<input type="text" id="recipientName${index}" name="recipientName" placeholder="수령인 성함" style="display:inline-block; width: 80%" class="form-control">
													<input type="text" id="recipientPhoneNumber${index}" name="recipientPhoneNumber" placeholder="수령인 핸드폰 번호" style="display:inline-block; width: 80%" class="form-control">
													<input type="text" id="sample5_address${index}" name="location" placeholder="도로명 주소" readonly="readonly" style="display:inline-block; width: 80%" class="form-control">
													<input class="btn btn-dark" type="button" onclick="sample5_execDaumPostcode()" value="검색" style="display:inline-block; width: 15%">
													<input type="text" id="location2_${index}" name="location2" placeholder="상세 주소" style="display:inline-block; width: 80%" class="form-control">
										        </div>
										        
										        <!-- Modal footer -->
										        <div class="modal-footer">
										          <button type="button" id="alterAddressBtn${index}" class="btn btn-success">수정</button>
										        </div>
										     </form>
									        
									      </div>
									    </div>
									  </div>
						         </c:forEach>
					        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/template/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/main.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6bc720d1861247189aab881a2c94847&libraries=services"></script>
	<!-- 주소 정보 가져오기 (카카오API) -->
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                document.getElementById("sample5_address1").value = addr;
	                document.getElementById("sample5_address2").value = addr;
	                document.getElementById("sample5_address3").value = addr;
	                document.getElementById("sample5_address4").value = addr;
	                document.getElementById("sample5_address5").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>

</body>

</html>