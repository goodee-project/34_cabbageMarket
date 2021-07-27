<!-- 작성자 : 이재범 -->
<!-- 수정 : 김희진 0716 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<style>
	.table td, .table th {
	    vertical-align: middle;
	}
	.productState{
		width: 120px;
		height: 40px;
		font-size: 18px;
	    font-weight: bold;
	}
	</style>
	<script>
		$('#document').ready(function(){
			$('.delDirectBtn').click(function(){				
				var index = $('.delDirectBtn').index(this);
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('.delDirectForm').eq(index).submit();
				}
			});
			$('.delUsedBtn').click(function(){				
				var index = $('.delUsedBtn').index(this);
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('.delUsedForm').eq(index).submit();
				}
			});
			$('.delAuctionBtn').click(function(){				
				var index = $('.delAuctionBtn').index(this);
				val=confirm('취소 하시겠습니까?');
				if(val){
					$('.delAuctionForm').eq(index).submit();
				}
			});
			
			$('.productState').change(function(){
				var index = $('.productState').index(this);
				var stateRegisterId = $('.stateRegisterId').eq(index).val();
				
		    	$.ajax({
					type:'get',
					url:'${pageContext.request.contextPath}/modifyProductState',
					data:{productState : $('.productState').eq(index).val(), directTradeProductRegistrationId : stateRegisterId},
					success: function() {
						alert('수정이 완료 되었습니다');
					}
				});
		    	
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
								<li><a href="${pageContext.request.contextPath}/users/sellList">판매 내역</a></li>
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
				                            <thead style="width: auto;">
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
				                                    	상태
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
					                                	<td style="width: 80px;">
					                                		${index = index+1}
					                                	</td>
					                                    <td style="width: 100px;">
					                                        <img src="${pageContext.request.contextPath}/template/img/directTradeImg/${gdpl.img}" width="50px" height="50px">
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
					                                    	<input type="hidden" class="stateRegisterId" value="${gdpl.registerId}">
					                                    	<c:if test="${gdpl.productState == 1}">
					                                    		<select class="productState">
														        	<option value="1" selected="selected">판매중</option>
														        	<option value="2">예약중</option>
														        	<option value="3">판매완료</option>
														        </select>
					                                    	</c:if>
					                                    	<c:if test="${gdpl.productState == 2}">
					                                    		<select class="productState">
					                                    			<option value="1">판매중</option>
														        	<option value="2" selected="selected">예약중</option>
														        	<option value="3">판매완료</option>
														        </select>
					                                    	</c:if>
					                                    	<c:if test="${gdpl.productState == 3}">
					                                    		<select class="productState">
														        	<option value="1">판매중</option>
														        	<option value="2">예약중</option>
														        	<option value="3" selected="selected">판매완료</option>
														        </select>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/modifyDirectTrade?directTradeProductRegistrationId=${gdpl.registerId}">
					                                    		<button class="btn btn-success" style="width: 50px; padding: 0px;">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" class="delDirectForm" action="${pageContext.request.contextPath}/users/removeDirectProduct">
					                                    		<input type="hidden" name="registerId" value="${gdpl.registerId}">
					                                    		<button type="button" class="btn btn-success delDirectBtn" style="width: 50px; padding: 0px;">취소</button>
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
					                                    	<c:if test="${gupl.state == '등록' && gupl.state != '마감'}">
					                                    		<h5>${gupl.deadline}</h5>
					                                    	</c:if>
					                                    	<c:if test="${gupl.state == '마감'}">
					                                    		<h5 style="color:red">마감</h5>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/modifyUsedProduct?applyId=${gupl.applyProductSalesDeliveryId}&state=${gupl.state}">
					                                    		<button class="btn btn-success">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" class="delUsedForm" action="${pageContext.request.contextPath}/users/removeUsedProduct">
					                                    		<input type="hidden" name="applyId" value="${gupl.applyProductSalesDeliveryId}">
					                                    		<button type="button" id="delUsedBtn" class="btn btn-success delUsedBtn">취소</button>
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
					                                	<td style="width: 80px;">
					                                		${total1 = total1+1}
					                                	</td>
					                                    <td style="width: 100px;">
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${gapl.img}" width="50px" height="50px">
					                                    </td>
					                                    <td>
					                                    	<h5>
					                                    		<a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${gapl.applyProductSalesDeliveryId}" style="text-decoration: none">
					                                    			${gapl.productName}
					                                    		</a>
					                                    	</h5>
					                                    </td>
					                                    <td style="width: 160px;">
					                                    	<h5>${gapl.maxPrice}</h5>
					                                    </td>
					                                    <td style="width: 150px;">
					                                    	<c:if test="${gapl.state == '등록'}">
					                                    		<h5>${fn:substring(gapl.deadline,0,10) }</h5>
					                                    	</c:if>
					                                    	<c:if test="${gapl.state == '마감'}">
					                                    		<h5 style="color:red">마감</h5>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<a href="${pageContext.request.contextPath}/users/modifyAuction?applyId=${gapl.applyProductSalesDeliveryId}&state=${gapl.state}">
					                                    		<button class="btn btn-success" style="width: 50px; padding: 0px;">수정</button>
					                                    	</a>
					                                    </td>
					                                    <td>
					                                    	<form method="post" class="delAuctionForm" action="${pageContext.request.contextPath}/users/removeAuctionProduct">
					                                    		<input type="hidden" name="applyId" value="${gapl.applyProductSalesDeliveryId}">
					                                    		<button type="button" class="btn btn-success delAuctionBtn" style="width: 50px; padding: 0px;">취소</button>
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