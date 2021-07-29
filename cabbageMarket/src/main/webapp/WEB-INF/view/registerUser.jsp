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
	<!-- jqery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			let numberCode =  /^[0-9]+(.[0-9]+)?$/;
			let emailCode = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			$('#btn').click(function(){
				if($('#username').val() == ''){
					$('#username').attr('placeholder','이름을 작성해주세요');
				}else if($('#email').val() == ''){
					$('#email').attr('placeholder','이메일을 작성해주세요');
				}else if(!emailCode.test($('#email').val())){
					$('#email').val('');
					$('#email').attr('placeholder','이메일 형식에 맞게 작성해주세요');
				}else if($('#password').val() == ''){
					$('#password').attr('placeholder','PASSWORD를 작성해주세요');
				}else if($('#nickname').val() == ''){
					$('#nickname').attr('placeholder','닉네임을 작성해주세요');
				}else if($('#mobile').val() == ''){
					$('#mobile').attr('placeholder','핸드폰 번호를 작성해주세요');
				}else if(!numberCode.test($('#mobile').val())){
					$('#mobile').val('');
					$('#mobile').attr('placeholder','핸드폰 번호를 숫자로 작성해주세요');
				}else{
					$('#registerForm').submit();
				}
			});
		});
	</script>
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
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
						  	<div class="humberger__menu__logo">
								<a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""></a>
							</div>
						  	<h3><b>회원가입</b></h3>
						</div>
						<form action="${pageContext.request.contextPath}/registerUser" method="post" id="registerForm">
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
							<button type="button" id="btn" class="btn text-white btn-block btn-primary">회원가입</button>
						</form>
					</div>
				</div>			  
			</div>		  
		</div>
	</div>
</div> 
	
</body>
</html>