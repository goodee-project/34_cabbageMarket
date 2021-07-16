<!-- 작성자 이재범 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="logintemplate/fonts/icomoon/style.css">
	
	<link rel="stylesheet" href="logintemplate/css/owl.carousel.min.css">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="logintemplate/css/bootstrap.min.css">
	
	<!-- Style -->
	<link rel="stylesheet" href="logintemplate/css/style.css">
<title>로그인</title>
</head>
<body>
<div class="content">
	<div class="container">
		<div class="row">
			<div class="col-md-6 order-md-2">
			  <img src="logintemplate/images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
			</div>
			<div class="col-md-6 contents">
				<div class="row justify-content-center">
					<div class="col-md-8">
					  <div class="mb-4">
						<div class="humberger__menu__logo">
							<a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""></a>
						</div>
					  <p class="mb-4"><b>안전한 배송을 추구합니다. 믿고 쓰는 거래 플랫폼</b></p>
					</div>
					<form action="${pageContext.request.contextPath}/usersLogin" method="post">
						<div class="form-group first">
							<input type="text" class="form-control" id="email" placeholder="email" name="email">						
						</div>
						<div class="form-group last mb-4">
							<input type="password" class="form-control" id="password" placeholder="password" name="password">						  
						</div>						
						<div class="d-flex mb-5 align-items-center">
							<label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
								<input type="checkbox" checked="checked"/>
								<div class="control__indicator"></div>
							</label>
							<span class="ml-auto"><a href="${pageContext.request.contextPath}/managerLogin" class="forgot-pass" style="text-decoration: none">관리자 로그인</a></span>
							<span class="ml-auto"><a href="${pageContext.request.contextPath}/registerUser" class="forgot-pass" style="text-decoration: none">회원가입</a></span> 
						</div>
						
						<input type="submit" value="Log In" class="btn text-white btn-block btn-primary">
						
						<span class="d-block text-left my-4 text-muted"> or sign in with</span>
						
						<div class="d-flex mb-5 align-items-center">
							<a href="${apiURL}"><img height="50" width="100%" src="${pageContext.request.contextPath}/logintemplate/images/loginbtn.png"/></a>
						</div>
					</form>
					</div>
				</div>			  
			</div>		  
		</div>
	</div>
</div> 
	
</body>
</html>