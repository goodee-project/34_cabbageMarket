<!-- 작성자 : 강혜란 -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/heartStyle.css" type="text/css">
    <!-- ajax 사용 -->   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"> <!-- 유효성 검사 -->
    $(document).ready(function() {
    	   	
    	console.log( ${ablePoint} ); //Service에서 (int)map.get("newPrice") - userPoint (있다면)-이전 beforeBidPrice 값. //값 계산 음수,0 가능, 양수 불가
		if (${ablePoint} == 210725){
			console.log('ablePoint 디폴트값 입력됨');
			return false;
			}
    	else if( ${ablePoint} > 0 ){  ///newPrice가 point와 이전입찰금 보다 커서, 포인트 부족.
			if(confirm( ${ablePoint}+'포인트가 부족합니다.\n 포인트 충전으로 이동하시겠습니까?' ) ){
				location.href= "${pageContext.request.contextPath}/users/pointRecharge";
				return false;
			} else {
				alert("입찰불가 : "+ ${ablePoint}+ "포인트 부족");
				return false;
			}
		} else { ///ablePoint가 계산이 음수거나 0이면 입찰가능
    		if(confirm( ${productDetail.newPrice}+'포인트로 입찰 하시겠습니까?\n *포인트가 바로 차감되며, 낙찰시 자동환급됩니다.\n **주소지는 1번으로 자동선택됩니다.')){
    			$('#addNewBidForm').submit();
    		} else {
    			alert("입찰취소");
    			return false;
    		}
        }
    	
    	console.log('호가 가능');
    	$(document).on('click', '#callQuote', function(){
    		console.log('호가 클릭');
    		if ( (int)(usersSession.get("userId")) == ${productDetail.userId} ) { //판매자가 아니면,
    			alert("판매자는 입찰블가");
				return false;
    		} else { //판매자가 다르면
    			$('#calculPointForm').submit();
            }
    	});
    	
    	console.log('이름이동 가능');
    	$(document).on('click', '#nameBtn', function(){
    		console.log('이동 클릭');
    		$('#getAuctionOneForm').submit();
    	})
    	
			}); //document Ready

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
                        <h2>경매상품 상세보기</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <a href="${pageContext.request.contextPath}/users/getAuctionList">경매상품보기</a>
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
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${imgPathList[0]}" alt="">
                        </div>
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
                        
                        <div class="product__details__price"> 
                        <c:if test="${bidInfo[0].userId == null }">
                            	<span> 최초 입찰자가 되어보세요!</span>
                        </c:if>
                        <c:if test="${bidInfo[0].userId != null }">
                        기존 입찰가 : <fmt:formatNumber value="${productDetail.price}" pattern="#,###" />
                        </c:if>
                        </div>
                        <div class="product__details__rating">
                        	<c:set var="bidInfoSize" value="${  bidInfo.size() == 1 ? bidInfo[0].userId == null  ? 0 : bidInfo.size() : bidInfo.size() }"/>
                        	<c:set var="bidInfoUserId" value="${ bidInfo[0].userId == null ? '-' : bidInfo[0].userId }"/>
                        	<c:set var="bidInfoUserName" value="${ bidInfo[0].userId == null ? '없음' : bidInfo[0].userName }"/>
                        	<c:forEach var="i" begin="0" end="${bidInfoSize}">
                        		<c:if test="${i ==0}">
                        		</c:if>
                        		<c:if test="${i !=0}">
	                            	<i class="fa fa-star"></i>
	                            </c:if>
                            </c:forEach>
                            
                            <c:if test="${bidInfo[0].userId != null }">
                            <span>( ${bidInfoSize}  회 입찰됨) 마지막 입찰자 : (${bidInfoUserId}) ${bidInfoUserName} </span>
                            </c:if>
                        </div>
                        <form id="calculPointForm" action="${pageContext.request.contextPath}/users/calculatePoint" method="post" enctype="multipart/form-data">
                        	<input type="hidden" name="applyId" value="${productDetail.applyId}">
                        	<input type="hidden" name="newPrice" value="${productDetail.newPrice}">
                        	<button id="callQuote" class="primary-btn" style="margin-top: 3px;">호가 : <fmt:formatNumber value="${productDetail.newPrice}" pattern="#,###" /></button>
                        	<div class="heart-btn">
						      <div class="content">
						        <span class="heart"></span>
						        <span class="text">Like</span>
						      </div>
						    </div>
                        
                        </form>
                        <form id="addNewBidForm" action="${pageContext.request.contextPath}/users/addBid" method="post" enctype="multipart/form-data">
                        	<input type="hidden" name="applyId" value="${productDetail.applyId}">
                        	<input type="hidden" name="newPrice" value="${productDetail.newPrice}">
                        </form>
                        
					    
                        <ul>
                            <li><b>입찰 남은 기간</b> <span>${productDetail.datediff} 일 ( ${productDetail.deadline} ) </span></li>
                            <li><b>판매자</b> <span>${productDetail.userName}</span></li>
                            <li><b>상품 등록번호</b> <span>${productDetail.applyId}</span></li>
                            <li><b>상품 카테고리</b> <span><span id="categorySubId">${productDetail.categorySubId} : </span>${productDetail.categorySubName}</span></li>
                            <li><b>최초 입찰가</b> <span> <fmt:formatNumber value="${productDetail.minPrice}" pattern="#,###" /> ( <fmt:formatNumber value="${productDetail.quote}" pattern="#,###"/> ) </span></li>
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
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>판매자의 설명</h6>
                                    <p>
                                    	<pre>${productDetail.productDesc}</pre>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
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

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>연관상품</h2>
                    </div>
                </div>
            </div>
            <div class="row" id="relatedProduct">
 				<c:forEach var="ral" items="${relatedAuctionList}">
                        <div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
						
						<div class="product__discount__item__pic set-bg"
                           data-setbg="${pageContext.request.contextPath}/template/img/applyProductImg/${ral.imgName}">
                             <ul class="product__item__pic__hover">
                                 <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                 <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                 <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                             </ul>
                        </div>
						<div class="product__item__text">
					           <h6><a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${ral.applyId}">${ral.productName}</a></h6>
					           <h5>${ral.newPrice}</h5>
	                    </div>
	                   	</div>
	                	</div>
 				</c:forEach>          
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

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