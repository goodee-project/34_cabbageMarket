<!-- 작성자 : 강혜란 210712 http://localhost/cabbageMarket/users/addAuction?applyId=1-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>배추마켓</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/heartStyle.css" type="text/css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- datePicker -->
<script>
	$(function() {
    //input을 datepicker로 선언
		$("#registrationDeadline").datepicker({
			 dateFormat: 'yy-mm-dd' //달력 날짜 형태
			,minDate: "+1d" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			,maxDate: "+3m" //최대 선택일자(+1D:하루후, -1M:한달후,)
		});
	//초기값을 오늘 날짜로 설정
	$('#registrationDeadline').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
  });
</script>

<script>
<!-- 유효성 검사 -->
	$(document).ready(function() {

		// 상품 가격 숫자입력 유효성 검사
    	var enCheck = RegExp( /[^0-9]$/);
		
    	$('#minBidPrice').keyup(function(){
    		if(enCheck.test($('#minBidPrice').val())){
    			alert('숫자만 입력해 주세요');
    			$('#minBidPrice').val('');
    		} else{
    			$('#minPrice').empty();
    			console.log("가격 입력됨");
    			var price = $('#minBidPrice').val();
    			$('#minPrice').append( price);
    		}
    	});
		
    	$('#quote').keyup(function(){
    		if(enCheck.test($('#quote').val())){
    			alert('숫자만 입력해 주세요');
    			$('#quote').val('');
    		} else {
    			$('#minQuote').empty();
    			console.log("호가 입력됨");
    			var price = $('#quote').val();
    			$('#minQuote').append(price);
    		}
    	});
    	
		// 폼 전송 유효성 검사
		$('#summitBtn').click(function() {
			console.log("summitBtn click!");

			if ($('#productDesc').val() == '') {
				alert("상품 설명을 입력하세요");
				$('#productDesc').focus();
			} else if ($('#minBidPrice').val() == '') {
				alert('상품 가격을 입력하세요');
				$('#minBidPrice').focus();
			} else if ($('#quote').val() == '') {
				alert('호가를 입력하세요');
				$('#quote').focus();
			} else if ($('#datepicker').val() == '') {
				alert('마감 일자를 입력하세요');
				$('#datepicker').focus();
			} else {
				$('#addAuctionProductForm').submit();
			}
		});

	});
</script>
</head> 

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- Humberger End -->
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>확인된 상품 등록</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                경매상품으로 등록
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/users/sellIndex"
                                    aria-selected="false">판매하기로 돌아가기</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    
                                	<div class="container">
									<form id="addAuctionProductForm" action="${pageContext.request.contextPath}/users/addAuction" method="post" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="8"> <!-- userId = 8으로 입력 테스트 -->
										<div class="row">
											<div class="col-lg-12">
												<div class="section-title product__discount__title" style="margin-top: 30px;">
								                	<h2>기본정보<span style="color: #7fad39; font-size: 1rem; margin-left: 2rem;">*필수항목</span></h2>
								                	<input type="hidden" name="applyProductSalesDeliveryId" value="${applyId }" readonly="readonly">
								                </div>
							                </div>
											<!-- 1상품이미지 -->
							                <div class="col-lg-3">
							                	<h4>상품이미지</h4>
							                </div>
							                <div class="col-lg-9" style="display: inline;">
											    <div class="row" style="display: inline;">
											    	<c:forEach var="img" items="${imgPathList}">
											    		<img width="230" height="230" 
											    			style="margin-right: 4.5px; border: 1px solid rgb(220, 219, 228);"
											    			src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}" alt="">
											    	</c:forEach>
											    </div> <!-- 업로드 된 이미지 미리보기 생성 -->
							                </div>
							                
							                <div class="col-lg-3">
							                </div>
							                <div class="col-lg-9" style="margin-top: 1.5rem; color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
							                	<ul style="list-style:none;">
							                		<li>* 상품 이미지 수정이 불가합니다.</li>
							                	</ul>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
							                <!-- 2카태고리 입력 -->
							                <div class="col-lg-3">
							                	<h4>카테고리</h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
							                	<input type="text" value="${productDetail.categorySubName}" readonly="readonly">
							                	<ul style="list-style:none; margin-top: 1.5rem;">
							                		<li>* 상품 카테고리는 수정이 불가합니다</li>
							                	</ul>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px; color: rgb(255, 80, 88);"><hr style="border: solid 1px lightgrey;"></div>			
											<!-- 3 제목 -->
							                <div class="col-lg-3">
							                	<h4>제목</h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" value="${productDetail.productName}">
							                	<ul style="list-style:none; margin-top: 1.5rem;">
							                		<li>*상품명은 수정이 불가합니다</li>
							                	</ul>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px grey;"></div>
							                
											<!-- 4 최소 입찰가 -->
											<div class="col-lg-3">
							                	<h4>최소 입찰가<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="minBidPrice" name="minBidPrice" placeholder="추천가: 정가의 80%이하" style="width: 90%">&nbsp;원
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
							                <!-- 경매 상품 호가 -->
											<div class="col-lg-3">
							                	<h4>호가<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="quote" name="quote" placeholder="추천가: 최소 입찰가의 10%" style="width: 90%">&nbsp;원
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <!-- 경매 상품 상세설명 -->
							                <div class="col-lg-3">
							                	<h4>상세설명<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<textarea id="productDesc" name="productDesc" rows="10" cols="30" placeholder="상품 설명을 입력해주세요."></textarea>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                <!-- 마감기한 입력 -->
											<div class="col-lg-3">
												<h4>
													마감 일자<span style="color: #7fad39;">* <span style="font-size: 1rem;">최대 3개월</span></span> 
												</h4>
												
											</div>
											<div class="col-lg-9 checkout__input" style="display: inline;">
												<input type="text" id="registrationDeadline" name="registrationDeadline">
											</div>
											<div class="col-lg-12" style="margin-bottom: 15px;">
												<hr style="border: solid 1px lightgrey;">
											</div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px grey;"></div>				
										
										
<!-- 경매 상품 미리보기-->						<div class="col-lg-3">
<!-- 경매 상품 미리보기-->		                	<div class="section-title product__discount__title" style="margin-top: 30px;">
<!-- 경매 상품 미리보기-->			                	<h2>미리보기</h2>
<!-- 경매 상품 미리보기-->			                </div>
<!-- 경매 상품 미리보기-->		                </div>
<!-- 경매 상품 미리보기-->		                <div class="row">
<!-- 경매 상품 미리보기-->                          <div class="col-lg-6 col-md-6">
<!-- 경매 상품 미리보기-->			                    <div class="product__details__pic">
<!-- 경매 상품 미리보기-->			                        <div class="product__details__pic__item">
<!-- 경매 상품 미리보기-->			                            <img class="product__details__pic__item--large"
								                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${imgPathList[0]}" alt="">
<!-- 경매 상품 미리보기-->			                        </div>
<!-- 경매 상품 미리보기-->			                        <!-- 세부사진 안보이기 -->
<!-- 경매 상품 미리보기-->			                    </div>
<!-- 경매 상품 미리보기-->			                </div>
<!-- 경매 상품 미리보기-->			                <div class="col-lg-6 col-md-6">
<!-- 경매 상품 미리보기-->			                    <div class="product__details__text">
<!-- 경매 상품 미리보기-->			                        <h3>${productDetail.productName}</h3>
<!-- 경매 상품 미리보기-->			                        <div class="product__details__rating">
<!-- 경매 상품 미리보기-->			                            <span>( 0 회 입찰됨) 마지막 입찰자 : 없음</span>
<!-- 경매 상품 미리보기-->			                        </div>
<!-- 경매 상품 미리보기-->			                        <div class="product__details__price">최조 입찰가 : <span id="minPrice"></span></div>
<!-- 경매 상품 미리보기-->			                        <a class="primary-btn" style="margin-top: 3px;">호가 : <span id="minQuote"></span></a>
<!-- 경매 상품 미리보기-->			                        <div class="heart-btn">
<!-- 경매 상품 미리보기-->								      <div class="content">
<!-- 경매 상품 미리보기-->								        <span class="heart"></span>
<!-- 경매 상품 미리보기-->								        <span class="text">Like</span>
<!-- 경매 상품 미리보기-->							      </div>
<!-- 경매 상품 미리보기-->								    </div>
<!-- 경매 상품 미리보기-->			                        <ul>
<!-- 경매 상품 미리보기-->			                            <li><b>판매자</b> <span>${productDetail.userName}</span></li>
<!-- 경매 상품 미리보기-->			                            <li><b>상품 등록번호</b> <span>${productDetail.applyId}</span></li>
<!-- 경매 상품 미리보기-->			                            <li><b>상품 카테고리</b> <span>${productDetail.categorySubName}</span></li>
<!-- 경매 상품 미리보기-->			                            <li><b>현재 입찰가</b> <span> null </span></li>
<!-- 경매 상품 미리보기-->			                            <li><b>Share on</b>
<!-- 경매 상품 미리보기-->			                                <div class="share">
<!-- 경매 상품 미리보기-->			                                    <a href="#"><i class="fa fa-facebook"></i></a>
<!-- 경매 상품 미리보기-->			                                    <a href="#"><i class="fa fa-twitter"></i></a>
<!-- 경매 상품 미리보기-->			                                    <a href="#"><i class="fa fa-instagram"></i></a>
<!-- 경매 상품 미리보기-->			                                    <a href="#"><i class="fa fa-pinterest"></i></a>
<!-- 경매 상품 미리보기-->			                                </div>
<!-- 경매 상품 미리보기-->			                            </li>
<!-- 경매 상품 미리보기-->			                        </ul>
<!-- 경매 상품 미리보기-->			                    </div>
<!-- 경매 상품 미리보기-->			                </div>
<!-- 경매 상품 미리보기-->                           </div>
<!-- 경매 상품 미리보기-->		                
<!-- 경매 상품 미리보기-->		                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
<!-- 경매 상품 미리보기-->		                
<!-- 경매 상품 미리보기-->		                <div class="col-lg-12" style="text-align: right;">
<!-- 경매 상품 미리보기-->		                	<button  id="summitBtn" class="summitBtn" type="button">등록하기</button>
<!-- 경매 상품 미리보기-->		                </div>
<!-- 경매 상품 미리보기-->		                
<!-- 경매 상품 미리보기-->					</div>
<!-- 경매 상품 미리보기-->				</form>
								</div>
								<!-- Product Details Section Begin -->
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="tab-pane" id="list tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 스펙</h6>
                                    <p>
                                    	<table class="table table-light">
                                    		<tr>
                                    			<th>판매자 구입가격</th>
                                    			<td></td>
                                    		</tr>
                                    		<tr>
                                    			<th>판매자 사용기한</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    	<hr>	
                                    	<table class="table table-dark">	
                                    		<tr>
                                    			<th>현재 최저가</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    	<hr>	
                                    	<table class="table table-light">	
                                    		<tr>
                                    			<th>현재 최저가</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 확인 직원 : ${productDetail.managerName} 후기</h6>
                                    <p> comment</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp"/>
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

    <script>
      $(document).ready(function(){
        $('.content').click(function(){
          $('.content').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
      });
    </script>
</body>

</html>