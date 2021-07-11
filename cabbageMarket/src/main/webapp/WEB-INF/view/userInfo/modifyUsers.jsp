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
	<title>userInfo</title>
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
		$(document).ready(function(){
			let numberCode =  /^[0-9]+(.[0-9]+)?$/;
			let row = 0;
			
			$('#btn').click(function(){
				if($('#username').val() == ''){
					$('#username').attr('placeholder','이름을 작성해주세요');				
				}else if($('#password').val() == ''){
					$('#password').attr('placeholder','PASSWORD를 작성해주세요');				
				}else if($('#mobile').val() == ''){
					$('#mobile').attr('placeholder','핸드폰 번호를 작성해주세요');
				}else if(!numberCode.test($('#mobile').val())){
					$('#mobile').val('');
					$('#mobile').attr('placeholder','핸드폰 번호를 숫자로 작성해주세요');
				}else{
					$('#modifyUserForm').submit();
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
								<li><a href="#">등록상품</a></li>
								<li><a href="#">포인트 사용 조회</a></li>
								<li><a href="#">구매 내역</a></li>
								<li><a href="#">내 상품 관리</a></li>
								<li><a href="#">채팅 관리</a></li>
								<li><a href="#">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>회원 정보 수정</h2>
						</div>
						<div>
							<form action="${pageContext.request.contextPath}/users/modifyUsers" method="post" id="modifyUserForm">
								<input type="hidden" name="userId" value="${userId}">
								<div class="col-md-10">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>이름</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" id="username" name="username" value="${username}" class="form-control">
												</div>
											</div>
											<hr>											
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>Email</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" value="${email}" class="form-control" disabled="disabled">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>Password</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="password" id="password" name="password" class="form-control">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>Phone</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" id="mobile" name="mobile" value="${mobile}" class="form-control">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>가입날짜</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" value="${createDate}" class="form-control" disabled="disabled">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<h6 class="mb-0">
														<b>SNS</b>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" value="${snsType}" class="form-control" disabled="disabled">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-12">
													<button type="button" id="btn" class="btn btn-success">Edit</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
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