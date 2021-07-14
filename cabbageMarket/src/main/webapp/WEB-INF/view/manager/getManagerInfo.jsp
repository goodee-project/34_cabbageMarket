<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ManagerInfo</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		console.log("document ready!");
		$('#addButton').click(function() {
			console.log("btn click!");
			if ($('#username').val().length < 3) {
				alert('username는 3자이상 이어야 합니다');
				$('#username').focus();
			} else if ($('#commentContent').val().length < 5) {
				alert('commentContent는 5자이상 이어야 합니다');
				$('#commentContent').focus();
			} else {
				$('#addCommentForm').submit();
			}

		});
	});
</script>
</head>
<body>
<div class="container">

    <h1>ManagerInfo</h1>
     <table class="table">
			<tbody>
				<tr>
					<td>managerId :</td>
					<td>${managerMap.managerId}</td>
				</tr>
				<tr>
					<td>managerName :</td>
					<td>${managerMap.managerName}</td>
				</tr>
				<tr>
					<td>managerNickname :</td>
					<td>${managerMap.managerNickname}</td>
				</tr>
				<tr>
					<td>managerAddress :</td>
					<td>${managerMap.managerAddress}</td>
				</tr>
				<tr>
					<td>managerPhoneNumber :</td>
					<td>${managerMap.managerPhoneNumber}</td>
				</tr>
				<tr>
					<td>managerLevel :</td>
					<td>${managerMap.managerLevel}</td>
				</tr>
				<tr>
					<td>createDate :</td>
					<td>${managerMap.createDate}</td>
				</tr>
			</tbody>
		</table>

	</div>
</body>
</html>