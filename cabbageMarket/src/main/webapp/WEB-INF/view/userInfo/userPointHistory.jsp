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
	<title>포인트 사용 조회</title>
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
							<a href="${pageContext.request.contextPath}/index">Home</a> <span>Cabbage
								Market</span>
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
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Department</h4>
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/users/userInfo">회원정보</a></li>
								<li><a href="${pageContext.request.contextPath}/users/registedProduct">등록상품</a></li>
								<li><a href="${pageContext.request.contextPath}/users/userPointHistory">포인트 사용 조회</a></li>
								<li><a href="#">구매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/myProductManagement">내 상품 관리</a></li>
								<li><a href="${pageContext.request.contextPath}/users/shippingAddress">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>포인트 사용 조회</h2>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/users/pointRecharge">
								<button class="btn btn-success">포인트 충전</button><br><br>
							</a>
						</div>
						<div>
							<div class="col-md-12">
								<div class="card">
									<nav class="navbar navbar-expand-sm bg-light navbar-light">
										 <a class="navbar-brand" href="${pageContext.request.contextPath}/users/userPointHistory"><b>전체</b></a>
										  <!-- Links -->
										  <ul class="navbar-nav">
											    <li class="nav-item">
											      	<a class="nav-link" href="${pageContext.request.contextPath}/users/userPointHistory?content=${1}" style="color:black"><b>수입</b></a>
											    </li>
											    <li class="nav-item">
											      	<a class="nav-link" href="${pageContext.request.contextPath}/users/userPointHistory?content=${2}" style="color:black"><b>지출</b></a>
											    </li>
										  </ul>
										  <div>
										  	&nbsp;&nbsp;<b>POINTS: ${usersSession.get("point")}</b>
										  </div>
									</nav>
									<div class="card-body">
										<table class="table table-hover" style="text-align: center">
											<thead>
												<tr>
													<th>
														순번
													</th>
													<th>
														내용
													</th>
													<th>
														포인트
													</th>
													<th>
														날짜
													</th>
												</tr>
											</thead>
											<c:set var="index" value = "0"/>
											<c:forEach var="u" items="${userPointHistory}">
												<c:if test="${u.content == '충전' || u.content == '유찰' || u.content == '판매'}">
													<tr style="color : blue">
														<td>
															${index = index+1}
														</td>
														<td>
															${u.content}
														</td>
														<td>
															${u.point}
														</td>
														<td>
															${u.usedDate}
														</td>
													</tr>
												</c:if>
												<c:if test="${u.content == '낙찰' || u.content == '입찰' || u.content == '구매'}">
													<tr style="color : red">
														<td>
															${total = total+1}
														</td>
														<td>
															${u.content}
														</td>
														<td>
															${u.point}
														</td>
														<td>
															${u.usedDate}
														</td>
													</tr>
												</c:if>																																													
											</c:forEach>
										</table>
									</div>
									<div class="card-footer">
										<c:if test="${lastPage != 1 && lastPage!=0}">
											<a href="${pageContext.request.contextPath}/users/userPointHistory?currentPage=${currentPage-1}&content=${content}">
												<button type="button" class="btn btn-outline-secondary">이전</button>
											</a>
										</c:if>
										<c:if test="${currentPage < lastPage}">
											<a href="${pageContext.request.contextPath}/users/userPointHistory?currentPage=${currentPage+1}&content=${content}">
												<button type="button" class="btn btn-outline-secondary">다음</button>
											</a>
										</c:if>
									</div>
								</div>
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