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
<title>회원가입</title>
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
					  <p class="mb-3"><b>회원가입</b></p>
					</div>
					<form action="${pageContext.request.contextPath}/registerUser" method="post">
						<div class="form-group first">
							<input type="text" class="form-control" id="username" placeholder="이름" name="username">						  
						</div>	
						<div class="form-group last mb-4">
							<input type="text" class="form-control" id="email" placeholder="email" name="email">					
						</div>						
						<div class="form-group last mb-4">
							<input type="password" class="form-control" id="password" placeholder="password" name="password">						  
						</div>
						<div class="form-group last mb-4">
							<input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname">						  
						</div>
						<div class="form-group last mb-4">
							<input type="text" class="form-control" id="mobile" placeholder="핸드폰 번호" name="mobile">						  
						</div>														
						<input type="submit" value="회원가입" class="btn text-white btn-block btn-primary">
					</form>
					</div>
				</div>			  
			</div>		  
		</div>
	</div>
</div> 
	
</body>
</html>