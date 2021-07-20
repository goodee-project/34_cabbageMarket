<!-- 작성자 : 김희진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>cabbageMarket UsedProductOne</title>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css"	type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/heartStyle.css" type="text/css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	
	$(document).ready(function() {
		$('#btn').click(function() {
			var point = ${usersSession.point};
			if( point < ${usedProductDetail.productPrice}){
				alert("포인트가 부족합니다.")
				if(confirm("포인트를 충전하시겠습니까?") == true){
					var url = "${pageContext.request.contextPath}/users/pointRecharge";
					location.href = url;
				
				}else{
					return false;
				}
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
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<!-- Humberger End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>중고상품 Details</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/index">Home</a>
							<a href="${pageContext.request.contextPath}/users/getUsedProductList"> UsedProduct Details</a> 
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
								 src="${pageContext.request.contextPath}/template/img/applyProductImg/${imgNameList[0]}"
								 alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<c:forEach var="img" items="${imgNameList}">
								<img data-imgbigurl="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
									 src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
									 alt="">
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${usedProductDetail.productName}</h3>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
							<i class="fa fa-star-half-o"></i> 
							<span>(18 reviews)</span>
						</div>
						<div class="product__details__price"> <span><fmt:formatNumber value="${usedProductDetail.productPrice}" pattern="#,###" /></span> 원</div>
						<c:if test="${usedProductDetail.productPrice <= usersSession.point}"> 
							<a href="${pageContext.request.contextPath}/users/buyUsedProduct?applyId=${usedProductDetail.applyId}&userId=${usersSession.userId}" class="primary-btn" style="margin-top: 3px; border: 0px;">Buy Now</a>
						</c:if>
						<c:if test="${usedProductDetail.productPrice > usersSession.point}">
							<a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${usedProductDetail.applyId}" class="primary-btn" style="margin-top: 3px; border: 0px;" id="btn">Buy Now</a>
						</c:if>
						<div class="heart-btn">
							<div class="content">
								<span class="heart"></span>
								<span class="text">Like</span>
							</div>
					    </div>
						<ul>
							<li><b>판매자</b> <span>${usedProductDetail.nickname}</span></li>
							<li><b>판매 가격</b> <fmt:formatNumber value="${usedProductDetail.productPrice}" pattern="#,###" />원</li>
							<li><b>마감 기한</b> <span style="color:#CD0000;"> ${usedProductDetail.deadLine.substring(0,10)}</span></li>
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
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Description</h6>
									<p>${usedProductDetail.productDesc}</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Reviews</h6>
									<p> 
										Vestibulum ac diam sit amet quam vehicula elementum sed
										sit amet dui. Pellentesque in ipsum id orci porta dapibus.
										Proin eget tortor risus.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

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