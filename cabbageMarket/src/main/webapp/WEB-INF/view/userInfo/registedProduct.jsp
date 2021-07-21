<!-- 작성자 : 이재범 -->
<!-- 수정 : 김희진 0716 -->
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
	<title>내 상품 관리</title>
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
		$('#document').ready(function(){
			$('#delDirectBtn').click(function(){
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('#delDirectForm').submit();
				}
			});
			$('#delUsedBtn').click(function(){
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('#delUsedForm').submit();
				}
			});
			$('#delAuctionBtn').click(function(){
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('#delAuctionForm').submit();
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
				<div class="col-lg-2 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Department</h4>
							<ul style="font-weight: bolder;">
								<li><a href="${pageContext.request.contextPath}/users/userInfo">회원정보</a></li>
								<li><a href="${pageContext.request.contextPath}/users/registedProduct">등록상품</a></li>
								<li><a href="${pageContext.request.contextPath}/users/userPointHistory">포인트 사용 조회</a></li>
								<li><a href="${pageContext.request.contextPath}/users/buyingList">구매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/biddingList">입찰 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/myProductManagement">내 상품 관리</a></li>
								<li><a href="${pageContext.request.contextPath}/users/shippingAddress">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-10 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>등록상품</h2>
						</div>
						<div>
							<div class="col-md-12">
								<h4><b>직거래상품 등록 내역</b></h4>
								<br>
								<div class="card">
									<table class="table table-hover" style="text-align: center">
				                            <thead>
				                                <tr>
				                                	<th>
				                                		순번
				                                	</th>
				                                	<th>
				                                		이미지
				                                	</th>
				                                    <th>
				                                    	제품명
				                                    </th>
				                                    <th>
				                                    	가격
				                                    </th>
				                                    <th>
				                                    	장소
				                                    </th>
				                                    <th>
				                                    	수정
				                                    </th>
				                                    <th>
				                                    	취소
				                                    </th>
				                                </tr>
				                            </thead>
					                            
				                            <tbody>
				                            	<c:set var="index" value = "0"/>
				                            	<c:forEach var="gdpl" items="${getDirectProductList}">
					                                <tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/directTradeImg/${gdpl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td>
					                                    	<h5>
					                                    		<a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${gdpl.registerId}" style="text-decoration: none">
					                                    			${gdpl.productName}
					                                    		</a>
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gdpl.price}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gdpl.location}</h5>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/modifyDirectTrade?directTradeProductRegistrationId=${gdpl.registerId}">
					                                    		<button class="btn btn-success">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" id="delDirectForm" action="${pageContext.request.contextPath}/users/removeDirectProduct">
					                                    		<input type="hidden" name="registerId" value="${gdpl.registerId}">
					                                    		<button type="button" id="delDirectBtn" class="btn btn-success">취소</button>
					                                    	</form>	                                    	
					                                    </td>
					                                </tr>
				                                </c:forEach>
				                            </tbody>
				                        </table>
								</div>
							</div>
							<br>
							<hr>
							<div class="col-md-12">
								<h4><b>중고상품 등록 내역</b></h4>
								<br>
								<div class="card">
									<table class="table table-hover" style="text-align: center">
				                            <thead>
				                                <tr>
				                                	<th>
				                                		순번
				                                	</th>
				                                	<th>
				                                		이미지
				                                	</th>
				                                    <th>
				                                    	제품명
				                                    </th>
				                                    <th>
				                                    	가격
				                                    </th>
				                                    <th>
				                                    	마감날짜
				                                    </th>
				                                     <th>
				                                    	수정
				                                    </th>
				                                    <th>
				                                    	취소
				                                    </th>
				                                </tr>
				                            </thead>
					                            
				                            <tbody>
				                            	<c:set var="total" value = "0"/>
				                            	<c:forEach var="gupl" items="${getUsedProductList}">
					                                <tr>
					                                	<td>
					                                		${total = total+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${gupl.img}" width="70px" height="50px">
					                                    </td>					                                   
					                                    <td>
					                                    	<h5 style="color: #3CC2FF"><a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${gupl.applyProductSalesDeliveryId}">${gupl.productName}</a></h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gupl.price}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gupl.deadline}</h5>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/modifyUsedProduct?applyId=${gupl.applyProductSalesDeliveryId}">
					                                    		<button class="btn btn-success">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" id="delUsedForm" action="${pageContext.request.contextPath}/users/removeUsedProduct">
					                                    		<input type="hidden" name="applyId" value="${gupl.applyProductSalesDeliveryId}">
					                                    		<button type="button" id="delUsedBtn" class="btn btn-success">취소</button>
					                                    	</form>	  				                                    	
					                                    </td>
					                                </tr>
				                                </c:forEach>
				                            </tbody>
				                        </table>
								</div>
							</div>
						</div>
						<br>
							<hr>
							<div class="col-md-12">
								<h4><b>경매상품 등록 내역</b></h4>
								<h6 style="color:red">※ 입찰이 하나 이상 존재하는 경우 취소가 불가능 합니다.</h6>
								<br>
								<div class="card">
									<table class="table table-hover" style="text-align: center">
				                            <thead>
				                                <tr>
				                                	<th>
				                                		순번
				                                	</th>
				                                	<th>
				                                		이미지
				                                	</th>
				                                    <th>
				                                    	제품명
				                                    </th>
				                                    <th>
				                                    	최고 입찰 가격
				                                    </th>
				                                    <th>
				                                    	마감날짜
				                                    </th>
				                                    <th>
				                                    	수정
				                                    </th>
				                                    <th>
				                                    	취소
				                                    </th>
				                                </tr>
				                            </thead>
					                            
				                            <tbody>
				                            	<c:set var="total1" value = "0"/>
				                            	<c:forEach var="gapl" items="${getAuctionProductList}">
					                                <tr>
					                                	<td>
					                                		${total1 = total1+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${gapl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td>
					                                    	<h5>
					                                    		<a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${gapl.applyProductSalesDeliveryId}" style="text-decoration: none">
					                                    			${gapl.productName}
					                                    		</a>
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gapl.maxPrice}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${gapl.deadline}</h5>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/?applyProductSalesDeliveryId=${gapl.applyProductSalesDeliveryId}">
					                                    		<button class="btn btn-success">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" id="delAuctionForm" action="${pageContext.request.contextPath}/users/removeAuctionProduct">
					                                    		<input type="hidden" name="applyId" value="${gupl.applyProductSalesDeliveryId}">
					                                    		<button type="button" id="delAuctionBtn" class="btn btn-success">취소</button>
					                                    	</form>	 
					                                    </td>
					                                </tr>
				                                </c:forEach>
				                            </tbody>
				                        </table>
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

</body>

</html>