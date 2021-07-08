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
<title>회원가입 닉네임 중복</title>
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
						  <h3 style="color: #01DFA5"><strong>배추마켓</strong></h3>
						  <p class="mb-3"><b>닉네임 중복</b></p>
						</div>
						<a href="${pageContext.request.contextPath}/registerUser" style="text-decoration: none">
							<button class="btn text-white btn-block btn-primary">회원가입 돌아가기</button>
						</a>
					</div>
				</div>			  
			</div>		  
		</div>
	</div>
</div> 
	
</body>
</html>