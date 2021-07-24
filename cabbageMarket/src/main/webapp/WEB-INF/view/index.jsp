<!-- 작성자 : 김태훈 -->
<!-- 수정자 : 강혜란 210707 localhost/cabbageMarket/index-->
<!-- 수정자 : 강혜란 210712 판매하기 버튼, 배추톡 버튼 링크 수정-->
<!-- 수정자 : 김태훈 210714 배추톡 세션체크 추가-->
<!-- 수정자 : 김희진 210722 index 수정, 상품 출력 -->
<!-- 수정자 : 김희진 210724 scrollTop 추가-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <link rel="icon" href="template/cabbage_CM.ico">   
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
    
    <style>
	.scrolltop {
      display: none;
      position: fixed;
      right: 30px;
      bottom: 50px;
      z-index: 1030;
      font-size: 1.875rem;
      color: #868e96;
      transition: all 0.5s ease-in-out;
      opacity: 0.8;
	}
     .scrolltop:hover,
     .scrolltop:focus {
      color: #dc3545;
      transition: all 0.5s ease-in-out;
	}	
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$(window).scroll(function (){
				if($(this).scrollTop() > 100) {
					$('#scrollTop').fadeIn(500);
				} else {
					$('#scrollTop').fadeOut('slow');
				}
		    });
			
	        $('#scrollTop').click(function (e) {
				e.preventDefault();
				$('html, body').animate({scrollTop: 0}, 200);
		    });
		});		
	</script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- header Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- header End -->


    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__search" >
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <a href="${pageContext.request.contextPath}/users/sellIndex"><i class="fa fa-heart"></i> <span>판매하기</span></a>
                            </div>
                            <div class="hero__search__phone__icon">
                               <a href="${pageContext.request.contextPath}/users/registedProduct"><i class="fa fa-shopping-bag"></i> <span>내 상점</span></a>
                            </div>
                            <div class="hero__search__phone__icon">
                            	<c:if test="${usersSession != null}">
                            		<a type="button" onclick="showPopup();"><i class="fa fa-comment-o"></i> <span>배추톡</span></a>
                            	</c:if>
                            	<c:if test="${usersSession == null}">
                            		<a href="${pageContext.request.contextPath}/usersLogin"><i class="fa fa-comment-o"></i> <span>배추톡</span></a>
                            	</c:if>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="template/img/hero/july.jpg">
                        <div class="hero__text">
                            <span>판매자를 구합니다.</span>
                            <h2>중고상품 <br />보장 100%</h2>
                            <p>중고상품을 안전거래합니다.</p>
                            <a href="${pageContext.request.contextPath}/registerUser" class="primary-btn btn-lg">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
     <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>직거래 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
	            <c:forEach var="dtpl" items="${directTradeProductList}">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/directTradeImg/${dtpl.imgName}">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${dtpl.directTradeProductRegistrationId}">${dtpl.productName}</a></h6>
	                            <h5><fmt:formatNumber value="${dtpl.productPrice}" pattern="#,###"/></h5>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>    
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>경매 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
	            <c:forEach var="apl" items="${auctionProductList}">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/applyProductImg/${apl.imgName}">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${apl.applyId}">${apl.productName}</a></h6>
	                            <h5>현재 입찰가 : <fmt:formatNumber value="${apl.newPrice}" pattern="#,###" /></h5>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>    
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>중고 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
	            <c:forEach var="upl" items="${usedProductList}">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/applyProductImg/${upl.imgName}">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${upl.applyProductSalesDeliveryId}">${upl.productName}</a></h6>
	                            <h5><fmt:formatNumber value="${upl.productPrice}" pattern="#,###"/></h5>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>    
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
    
    <!-- Blog Section Begin -->
    <section class="from-blog spad">
       
    </section>
    <!-- Blog Section End -->

    <!-- Banner Begin -->
    <div class="banner">
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
    </section>
    <!-- Latest Product Section End -->

	<!-- ScrollTop Section Begin -->
	<a id="scrollTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-up"></i>
    </a>
	<!-- ScrollTop Section End -->

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
		// 채팅방 팝업창
	    function showPopup() { 
	  	  window.open("${pageContext.request.contextPath}/users/getChattingRoomList?userId=${usersSession.userId}", "chattingList", "width=400, height=600, left=200, top=200"); 
	    }
	</script>

</body>

</html>