<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Direct Trade Shop">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>Direct Trade Shop</title>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){ // 움직이는 스크롤
			var currentPosition = parseInt($(".scroll").css("top"));
			
			$(window).scroll(function() { 
				var position = $(window).scrollTop();
				if(position < 300)
					position = 300;
				
				if(position > 1900)
					position = 1900;
				
				$(".scroll").stop().animate({"top":position+currentPosition-300+"px"},800); 
			}); 
			
			$('#sortValue').change(function(){
				console.log($('#sortValue').val());
				$('#sortValueForm').submit();
			});
			
			$('#reservCheckbox').change(function(){
				console.log($('#reservCheckbox').val());
				$('#reservationStateForm').submit();
			});
		});
		
		$.ajax({
			   type:'get',
			   url:'${pageContext.request.contextPath}/getCategoryMain',
			   
			   success: function(jsonData) {
			      $(jsonData).each(function(index, item) {
			     	 console.log(item.categoryMainName);
			         $('#categoryMain').append(
			            '<li><a href="${pageContext.request.contextPath}/users/getDirectTradeList?categoryMainId='+item.categoryMainId+'">'+item.categoryMainName+'</a></li>'
			         );
			      });
			   }
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

	<!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${pageContext.request.contextPath}/users/getDirectTradeList" method="get">
                                <input type="text" placeholder="직거래 상품을 검색하세요" name="searchWord">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Direct Trade Shop</h2>
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

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5 scroll" style="height: 0px;">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>CATEGORY</h4>
                            <ul id="categoryMain">
                            </ul>
                        </div>

                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="0" end="2">
                                        	<c:if test="${DirectTradeProductRegistrationList.size() > i}">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${DirectTradeProductRegistrationList[i].directTradeProductRegistrationId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${pageContext.request.contextPath}/template/img/directTradeImg/${DirectTradeProductRegistrationList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                            	<c:if test="${DirectTradeProductRegistrationList[i].productName.length() > 9}">
	                                                	<h6>${DirectTradeProductRegistrationList[i].productName.substring(0,8)}..</h6>
	                                                </c:if>
	                                                <c:if test="${DirectTradeProductRegistrationList[i].productName.length() <= 9}">
	                                                	<h6>${DirectTradeProductRegistrationList[i].productName}</h6>
	                                                </c:if>
	                                                <span><fmt:formatNumber value="${DirectTradeProductRegistrationList[i].productPrice}" pattern="#,###" /></span>
	                                            </div>
	                                        </a>
	                                        </c:if>
										</c:forEach>
                                    </div>
                                    
                                    <c:if test="${DirectTradeProductRegistrationList.size() > 2}">
	                                    <div class="latest-prdouct__slider__item">
	                                        <c:forEach var="i" begin="3" end="5">
	                                        	<c:if test="${DirectTradeProductRegistrationList.size() > i}">
		                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${DirectTradeProductRegistrationList[i].directTradeProductRegistrationId}">
		                                            <div class="latest-product__item__pic">
		                                                <img src="${pageContext.request.contextPath}/template/img/directTradeImg/${DirectTradeProductRegistrationList[i].imgName}" alt="" style="width: 110px; height: 110px;">
		                                            </div>
		                                            <div class="latest-product__item__text">
		                                                <c:if test="${DirectTradeProductRegistrationList[i].productName.length() > 9}">
		                                                	<h6>${DirectTradeProductRegistrationList[i].productName.substring(0,8)}..</h6>
		                                                </c:if>
		                                                <c:if test="${DirectTradeProductRegistrationList[i].productName.length() <= 9}">
		                                                	<h6>${DirectTradeProductRegistrationList[i].productName}</h6>
		                                                </c:if>
		                                                <span><fmt:formatNumber value="${DirectTradeProductRegistrationList[i].productPrice}" pattern="#,###" /></span>
		                                            </div>
		                                        </a>
		                                        </c:if>
											</c:forEach>
	                                    </div>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Sale Off</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
	                            <c:forEach var="dtprl" items="${DirectTradeProductRegistrationRand6}">
	                                <div class="col-lg-4">
	                                    <div class="product__discount__item">
	                                        <div class="product__discount__item__pic set-bg"
	                                            data-setbg="${pageContext.request.contextPath}/template/img/directTradeImg/${dtprl.imgName}">
	                                            <ul class="product__item__pic__hover">
	                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                            </ul>
	                                        </div>
	                                        <div class="product__discount__item__text">
	                                            <span>${dtprl.categorySubName}</span>
	                                            <h5><a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${dtprl.directTradeProductRegistrationId}">${dtprl.productName}</a></h5>
	                                            <div class="product__item__price"><fmt:formatNumber value="${dtprl.productPrice}" pattern="#,###" /></div>
	                                        </div>
	                                    </div>
	                                </div>
	                           </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <form id="sortValueForm" action="${pageContext.request.contextPath}/users/getDirectTradeList" method="get" style="display:inline;">
	                                    <input type="hidden" name="searchWord" value="${searchWord}">
	                                    <input type="hidden" name="categoryMainId" value="${categoryMainId}">
	                                    <input type="hidden" name="reservationState" value="${reservationState}">
	                                    <select id="sortValue" name="sortValue">
	                                    	<c:if test="${sortValue eq 0}">
	                                    		<option value="0" selected="selected">최근 등록순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 0}">
	                                    		<option value="0">최근 등록순</option>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${sortValue eq 1}">
	                                    		<option value="1" selected="selected">높은 가격순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 1}">
	                                    		<option value="1">높은 가격순</option>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${sortValue eq 2}">
	                                    		<option value="2" selected="selected">낮은 가격순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 2}">
	                                    		<option value="2">낮은 가격순</option>
	                                    	</c:if>
	                                    </select>
	                                </form>
                                    <div class="checkout__input__checkbox" style="display: inline;">
	                                    <form id="reservationStateForm" action="${pageContext.request.contextPath}/users/getDirectTradeList" method="get" style="display:inline;">
	                                    	<input type="hidden" name="searchWord" value="${searchWord}">
	                                    	<input type="hidden" name="categoryMainId" value="${categoryMainId}">
	                                    	<input type="hidden" name="sortValue" value="${sortValue}">
		                                    <label style="padding-left: 20px;">
		                                        예약중 포함
		                                        <c:if test="${reservationState eq 'on'}">
		                                        	<input type="checkbox" id="reservCheckbox" name="reservationState" value="on" checked="checked">
		                                        </c:if>
		                                        <c:if test="${reservationState ne 'on'}">
		                                        	<input type="checkbox" id="reservCheckbox" name="reservationState" value="on">
		                                        </c:if>
		                                        <span class="checkmark"></span>
		                                    </label>
	                                    </form>
	                                </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${directProductTotal}</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<c:forEach var="dtprl" items="${DirectTradeProductRegistrationList}">
	                    	<div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/directTradeImg/${dtprl.imgName}">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                	<span style="font-size: 14px; color: #b2b2b2; display: block; margin-bottom: 4px;">${dtprl.categorySubName}</span>
	                                    <h6><a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${dtprl.directTradeProductRegistrationId}">
	                                    <c:if test="${dtprl.productState == 2}">
	                                		<span style="font-weight: 700; color: #7fad39;">예약중 </span>${dtprl.productName}
	                                	</c:if>
	                                    	${dtprl.productName}
	                                    </a></h6>
	                                    <h5><fmt:formatNumber value="${dtprl.productPrice}" pattern="#,###" /></h5>
	                                </div>
	                            </div>
	                        </div>
                    	</c:forEach>
                    </div>
                    
                    <!-- 페이징 -->
                    <div class="product__pagination">
                    	
                    	<c:if test="${currentPage > 1}">
				            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${currentPage-1}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortValue=${sortValue}&reservationState=${reservationState}">
				            	<i class="fa fa-long-arrow-left"></i>
				            </a>
				        </c:if>
				        
				        <c:forEach var="i" begin="1" end="10">
							<c:if test="${(pageSet*10)+i < lastPage+1}">
					            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${(pageSet*10)+i}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortValue=${sortValue}&reservationState=${reservationState}">
									${(pageSet*10)+i}
								</a>
							</c:if>
						</c:forEach>
		
				        <c:if test="${currentPage < lastPage}">
				            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${currentPage+1}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortValue=${sortValue}&reservationState=${reservationState}">
				            	<i class="fa fa-long-arrow-right"></i>
				            </a>
				        </c:if>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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