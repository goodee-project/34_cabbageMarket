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

	<!-- date -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

		<link rel="stylesheet"
			  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css"/>
		<link rel="stylesheet"
			  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css"/>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap-material-datetimepicker.css" />
		<link href="http://fonts.googleapis.com/css?family=Roboto:400,500" rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	
		<script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
        <!-- ㅇdate -->
          <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		  <script>
		  $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
		  </script>
        
		<!--  <script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>-->
		<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/template/js/bootstrap-material-datetimepicker.js"></script>
  <script>
  $( function() {
	  //https://jqueryui.com/datepicker/
    $( "#registrationDeadline" ).datepicker({ format : 'YYYY-MM-DD'});
    //$('#min-date').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm', minDate : new Date() });
  } );
  </script>
		<script type="text/javascript">
		$(document).ready(function()
		{
			//date https://t00rk.github.io/bootstrap-material-datetimepicker/
			//$('#min-date').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm', minDate : new Date() });

			//$.material.init()
			
			// 폼 전송 유효성 검사
	        $('#summitBtn').click(function() {
	            
	        	console.log("summitBtn click!");
	        	
	            if($('#minBidPrice').val() == '') {
	                alert('최소 입찰가를 입력해 주세요');
	                $('#minBidPrice').focus();
	            } else if ($('#quote').val() == '') {
	                alert('호가를 입력하세요');
	                $('#quote').focus();
	            } else if ($('#productDesc').val() == '') {
	                alert('상품설명을 입력하세요');
	                $('#productDesc').focus();
	            } else if ($('#registrationDeadline').val() == '') {
	                alert('마감기한을 입력하세요');
	                $('#registrationDeadline').focus();
	            } else {
	                $('#addAuctionProdeuctForm').submit();
	            }
	        });
		});
		</script>
	<!--//ajax 미리보기 시도중 -->
    <script>
    function inputData(){
        var auction = $('#form').serialize();
        $.ajax({
            url: "/previewAuction",
            data: auction,
            type:"POST",
            cache: false
        }).done(function (fragment) {
             $("#list").replaceWith(fragment);
        });
        
    }//출처: https://joyhong.tistory.com/104 [옳은 길로..]
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
									<form id="addAuctionProdeuctForm" action="${pageContext.request.contextPath}/users/addAuction" method="post" enctype="multipart/form-data">
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
							                	<span style="color: #7fad39; font-size: 1rem; margin-left: 4rem;">추천: 정가의 80%이하</span>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="minBidPrice" name="minBidPrice" placeholder="상품 가격을 입력해주세요." style="width: 90%">&nbsp;원
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <!-- 경매 상품 호가 -->
											<div class="col-lg-3">
							                	<h4>호가<span style="color: #7fad39;">*</span></h4>
							                	<span style="color: #7fad39; font-size: 1rem; margin-left: 4rem;">추천: 최소 입찰가의 10%</span>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="quote" name="quote" placeholder="상품 가격을 입력해주세요." style="width: 90%">&nbsp;원
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
							                <!-- 경매 상품 마감일 -->
											<div class="col-lg-3">
							                	<h4>마감일<span style="color: #7fad39;">*</span></h4>
							                	<span style="color: #7fad39; font-size: 1rem; margin-left: 4rem;">최대 한달</span>
							                </div>
							                <div class="col-lg-9 checkout__input form-control-wrapper" style="display: inline;">
							                	<!-- https://jqueryui.com/datepicker/-->
							                	<input type="text" id="datepicker">
							                	<input type="text" id="date" name="registrationDeadline" placeholder="날짜를 선택해주세요" value="2021-07-30 00:00:00" style="width: 100%">
							                
							                
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px grey;"></div>				
										
											<!-- 경매 상품 미리보기-->
											<div class="col-lg-3">
							                	<div class="section-title product__discount__title" style="margin-top: 30px;">
								                	<h2>미리보기</h2>
								                </div>
							                </div>
							                <div class="row">
			                                    <div class="col-lg-6 col-md-6">
								                    <div class="product__details__pic">
								                        <div class="product__details__pic__item">
								                            <img class="product__details__pic__item--large"
								                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${imgPathList[0]}" alt="">
								                        </div>
								                        <div class="product__details__pic__slider owl-carousel">
								                        	<div class="ribbon">
						                                        <div class="text">New</div>
						                                    <c:forEach var="img" items="${imgPathList}" begin="1">
								                        		<img data-imgbigurl="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
								                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}" alt="">
								                        	</c:forEach>    
						                                    </div>
								                        	
								                        </div>
								                    </div>
								                </div>
								                <div class="col-lg-6 col-md-6">
								                    <div class="product__details__text">
								                        <h3>${productDetail.productName}</h3>
								                        <div class="product__details__rating">
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star-half-o"></i>
								                            <span>(reviews)</span>
								                        </div>
								                        <div class="product__details__price">ㄱ{productDetail.price}</div>
								                        <p>ㄱ{productDetail.productDesc}</p>
								                        <a href="#" class="primary-btn" style="margin-top: 3px;">호가 : ㄱ{productDetail.quote}</a>
								                        <div class="heart-btn">
													      <div class="content">
													        <span class="heart"></span>
													        <span class="text">Like</span>
													      </div>
													    </div>
								                        <ul>
								                            <li><b>판매자</b> <span>${productDetail.userName}</span></li>
								                            <li><b>상품 카테고리</b> <span>${productDetail.categorySubName}</span></li>
								                            <li><b>현재 입찰가</b> <span> null </span></li>
								                            <li><b>Share on</b>
								                                <div class="share">
								                                    <a href="#"><i class="fa fa-facebook"></i></a>
								                                    <a href="#"><i class="fa fa-twitter"></i></a>
								                                    <a href="#"><i class="fa fa-instagram"></i></a>
								                                    <a href="#"><i class="fa fa-pinterest"></i></a>
								                                </div>
								                            </li>
								                        </ul>
								                    </div>
								                </div>
			                                    </div>
							                
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <div class="col-lg-12" style="text-align: right;">
							                	<button  id="summitBtn" class="summitBtn" type="button">등록하기</button>
							                </div>
							                
										</div>
									</form>
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