<!-- 작성자 : 이재범 -->
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
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
	<title>입찰 내역</title>
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
	 <!-- ajax 사용 -->   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"> <!-- 유효성 검사 -->
    $(document).ready(function() {
    	console.log("ajax 시작");
    	
    	console.log( ${userPoint} ); //Service에서 userPoint 검색
    	$('.removeBtn').click(function(){				
			var index = $('.removeBtn').index(this);
			var val=confirm('취소 하시겠습니까?');
			if(val){
				$('.removeBidForm').eq(index).submit();
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
							<h2>입찰 내역</h2>
						</div>
						<div class="col-md-12">
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
			                                    	입찰 가격
			                                    </th>
			                                    <th>
			                                    	입찰 날짜
			                                    </th>
			                                    <th>
			                                    	취소
			                                    </th>
			                                </tr>
			                            </thead>
				                            
			                            <tbody>
			                            	<c:set var="index" value = "${beginRow}"/>
			                            	<c:forEach var="bl" items="${biddingList}">
				                                <c:if test="${bl.auctionState == '경매종료' && bl.auctionResult == 0 }">
					                                <tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${bl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td width="300px">
					                                    	<h5>
					                                    		${bl.productName}
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.point}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.biddingDate}</h5>
					                                    </td>
					                                    <td style="color: red">
					                                    	<b>유찰</b>
					                                    </td>
					                                </tr>
				                                </c:if>
				                                <c:if test="${bl.auctionState == '경매종료' && bl.auctionResult == 1 }">
					                                <tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${bl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td width="250px">
					                                    	<h5>
					                                    		<c:if test="${bl.shippingExist == 1}">
						                                    		<a href="${pageContext.request.contextPath}/users/boughtProductOne?applyId=${bl.applyId}&type=2" style="text-decoration: none">
						                                    			${bl.productName}
						                                    		</a>
						                                    	</c:if>
						                                    	<c:if test="${bl.shippingExist == 0}">
						                                    		${bl.productName}
						                                    	</c:if>
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.point}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.biddingDate}</h5>
					                                    </td>
					                                    <td style="color: blue">
					                                    	<b>낙찰</b>
					                                    	<c:if test="${bl.shippingExist == 0}">
						                                    	<form method="get" action="${pageContext.request.contextPath}/users/addBiddingProductDelivery">
						                                    		<input type="hidden" name="applyId" value="${bl.applyId}">
						                                    		<button class="btn btn-success">배송지 입력</button>
						                                    	</form>
					                                    	</c:if>					                                    	
					                                    </td>
					                                </tr>
				                                </c:if>
				                                <c:if test="${bl.auctionState == '경매중' && bl.bidState =='입찰'}">
				                                	<tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${bl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td width="300px">
					                                    	<h5>
					                                    		<a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${bl.applyId}" style="text-decoration: none">
					                                    			${bl.productName}
					                                    		</a>
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.point}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.biddingDate}</h5>
					                                    </td>
					                                    					                                    
														<td>
															<form class="removeBidForm" action="${pageContext.request.contextPath}/users/removeBid" method="post">
																<input name="bidId" id="bidId" value="${bl.biddingAuctionProductId}"/>
																<input name="point" id="point" value="${bl.point}"/>
						                                    	<button type="button" class="btn btn-success removeBtn">취소</button>
					                                    	</form>
					                                    </td>					                                    
					                                </tr>
					                                
				                                </c:if>
				                               <c:if test="${bl.auctionState == '경매중' && bl.bidState !='입찰'}">
				                                	<tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${bl.img}" width="70px" height="50px">
					                                    </td>
					                                    <td width="300px">
					                                    	<h5>
					                                    		<a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${bl.applyId}" style="text-decoration: none">
					                                    			${bl.productName}
					                                    		</a>
					                                    	</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.point}</h5>
					                                    </td>
					                                    <td>
					                                    	<h5>${bl.biddingDate}</h5>
					                                    </td>
					                                    					                                    
														<td>
															입찰취소
					                                    </td>					                                    
					                                </tr>
					                                
				                                </c:if>
			                                </c:forEach>
			                            </tbody>
			                        </table>
							</div>
							<div class="card-footer">
								<c:if test="${currentPage>1}">
									<a href="${pageContext.request.contextPath}/users/biddingList?currentPage=${currentPage-1}">
										<button type="button" class="btn btn-outline-secondary">이전</button>
									</a>
								</c:if>
								<c:if test="${currentPage < lastPage}">
									<a href="${pageContext.request.contextPath}/users/biddingList?currentPage=${currentPage+1}">
										<button type="button" class="btn btn-outline-secondary">다음</button>
									</a>
								</c:if>
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