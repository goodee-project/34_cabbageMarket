<!-- 작성자 : 강혜란 210716 http://localhost/cabbageMarket/users/addAuction?applyId=1-->
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
			
			//주소지 비동기 통신
	        console.log('주소지 가져오기');
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/getShippingAddress',
				success: function(jsonData) {
					$(jsonData).each(function(index, item) {
						var html = '';
						html += '<li><button class="categoryBtn categoryMainBtn" type="button" value='+item.shippingAddressId+'>';
						html += item.address+'</button></td>';
						$('#shippingAddress').append(html);
					});
				}
			});
			
			$(document).on('click', '.categoryMainBtn', function(){
				cateCheck = 0;
				console.log('주소지 선택');
				var index = $('.categoryMainBtn').index(this);
				var categoryMainText = $(".categoryMainBtn").eq(index).text();
				$('#selectShippingAddress').empty();
				$("#selectShippingAddress").append(" "+categoryMainText );
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
                        <h2>배송신청상품 환송신청</h2>
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
                                미리보기
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost/cabbageMarket/users/getApplyProductSalesDeliveryList?userId=${usersSession.userId}"
                                    aria-selected="false">취소 : 등록하기로 돌아가기</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    
                                	<div class="container">
									<form id="addAuctionProdeuctForm" action="${pageContext.request.contextPath}/users/addAuction" method="post" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="8"> <!-- userId = 8으로 입력 테스트 -->
										<div class="row">
											<div class="col-lg-6 col-md-6">
							                    <div class="product__details__pic">
							                        <div class="product__details__pic__slider owl-carousel">
							                        	<c:forEach var="img" items="${imgPathList}">
							                        		<img data-imgbigurl="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
							                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}" alt="">
							                        	</c:forEach>
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
							                            <span>(18 reviews)</span>
							                        </div>
							                        <div class="product__details__price">현재 상태 : ${productDetail.registrationState}</div>
							                        <p>${productDetail.productDesc}</p>
							                        
							                    </div>
							                </div>
																		<div class="col-lg-12">
												<div class="section-title product__discount__title" style="margin-top: 30px;">
								                	<h2>반송정보<span style="color: #7fad39; font-size: 1rem; margin-left: 2rem;">*필수항목</span></h2>
								                	<input type="hidden" name="applyProductSalesDeliveryId" value="${applyId }" readonly="readonly">
								                </div>
							                </div>
											<!-- 1배송지 수정 -->
							                <div class="col-lg-3">
							                	<h4>배송지</h4>
							                </div>
							                <div class="col-lg-9 checkout__input">
							                	<!-- 주소 -->
							                   	<ul class="categoryUl" id="shippingAddress" style="width: 100%">
							                    </ul>
							                    
							                    <div class="col-lg-3">
								                </div>
								                <div class="col-lg-9">
								                	<span id="selectCategory" style="margin-top: 1.5rem; font-size: 16px; color: #7fad39;">선택한 주소:
								                	<span id="selectShippingAddress" style="font-weight:bold;"></span>
								                	</span>
								                </div>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px; color: rgb(255, 80, 88);"><hr style="border: solid 1px lightgrey;"></div>			
											<!-- 2 배송 요청사항 -->
							                <div class="col-lg-3">
							                	<h4>요청사항</h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="delivery_requests">
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px grey;"></div>
							                
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

   
</body>

</html>