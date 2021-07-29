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
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
	<title>배추마켓 중고상품 구매</title>
	
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
	$(document).ready(function () {
        $('#buyBtn').click(function() {
        	if($('input[name="shippingAddressId"]:checked').length < 1) {
        		alert('배송정보를 선택하세요');
        	} else {
        		$('#buyUsedProduct').submit();
        	}
        });	
	});
	
    function openWin() {
    	window.open("${pageContext.request.contextPath}/users/shippingAddress");
    }
	</script>
</head>
<body>
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>중고상품 구매</h2>
					</div>
					<form id="buyUsedProduct" action="${pageContext.request.contextPath}/users/buyUsedProduct" method="post">
						<input type="hidden" name="applyProductSalesDeliveryId" value="${productForBuy.applyId}">
						<input type="hidden" name="userId" value="${usersSession.userId}">
						<input type="hidden" name="productPrice" value="${productForBuy.productPrice}">
						
						<div class="col-md-12">
							<div class="card">
								<table class="table table-hover" style="text-align: center">
									<thead>
										<tr>
											<th>이미지</th>
											<th>제품명</th>
											<th>판매자</th>
											<th>가격</th>
											<th style="color:#CD0000;">Point</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><img src="${pageContext.request.contextPath}/template/img/applyProductImg/${productForBuy.imgName}" height="40px" width="40px"></td>
											<td>${productForBuy.productName}</td>
											<td>${productForBuy.nickName}</td>
											<td><fmt:formatNumber value="${productForBuy.productPrice}" pattern="#,###" /></td>
											<td style="color:#CD0000;"><fmt:formatNumber value="${usersSession.point}" pattern="#,###" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br><br>
						<div class="col-md-12">
							<div class="card">
								<table class="table table-hover" style="text-align: center">
									<thead>
										<tr>
											<th>수령인</th>
											<th>배송지</th>
											<th>연락처</th>
											<th>Select</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="sa" items="${shippingAddress}">
											<tr>
												<td>${sa.recipientName}</td>
												<td>${sa.address}</td>
												<td>${sa.recipientPhoneNumber}</td>
												<td><input id="radioBtn" name="shippingAddressId" type="radio" value="${sa.shippingAddressId}"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<div> 
								<button style="float: right;" class="btn btn-outline-success btn-sm" type="button" onclick="openWin();" >+ 배송지 추가</button>
							</div>	
							<br><br><br>	
							<div class="card">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>배송 요청사항</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<textarea name="deliveryRequests" rows="5" cols="80"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br>
						<div style="float: right;">
							<button class="btn btn-success" id="buyBtn" name="button" type="button">구매</button>
							<a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${productForBuy.applyId}">
								<button class="btn btn-success" type="button">취소</button>
							</a>
						</div>
					</form>
				</div>
			</div>	
		</div>
	</div>
</section>
</body>
</html>