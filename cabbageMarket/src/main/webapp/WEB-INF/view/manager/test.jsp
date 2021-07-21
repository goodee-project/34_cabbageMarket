<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
   $('#btn').click(function(){
      console.log('btn click!'); // 웹브라우저 콘솔에서 확인 가능
      // 폼 유효성 검사 코드 추가
      $('#addForm').submit();
   });
});
</script>
<title>addManager</title>
</head>
<body>
	<div class="container">
		<h1>addManager</h1>
		<form id="addForm" method="post" action="${pageContext.request.contextPath}/manager/addManager">
			<table class="table table-striped">
				
				<tr>
					<td>managerId</td>
					<td><input type="text" name="managerId" id="managerId"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerPassword</td>
					<td><input type="password" name="managerPassword" id="managerPassword"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerName</td>
					<td><input type="text" name="managerName" id="managerName"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerNickname</td>
					<td><input type="text" name="managerNickname" id="managerNickname"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerAddress</td>
					<td><input type="text" name="managerAddress" id="managerAddress"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerPhoneNumber</td>
					<td><input type="text" name="managerPhoneNumber" id="managerPhoneNumber"
						class="form-control"></td>
				</tr>
				<tr>
					<td>managerLevel</td>
					<td>
						<select name="managerLevel" id="managerLevel" class="form-control">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</td>
				</tr>
				
			</table>

			<button id="btn" class="btn btn-secondary">관리자 등록</button>
		</form>
	</div>
</body>
</html>
