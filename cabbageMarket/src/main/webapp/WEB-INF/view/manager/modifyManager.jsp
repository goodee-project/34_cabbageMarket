<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BoardOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      console.log("document ready!");
      $('#btn').click(function(){
         console.log("btn click!");
         
         // 폼 유효성 검사
         $('#modifyForm').submit();
      });
   });
</script>
</head>
<body>
<div class="container">

    <h1>BoardOne</h1>
    <form action="${pageContext.request.contextPath}/manager/modifyManager" id="modifyManager" method="post">
	    <table class="table">
	         <tbody>
	            <tr>
	                <td>managerNickname :</td>
	                <td><input type="text" id="managerNickname" name="managerNickname" value="${modifyManager.managerNickname}"></td>
	            </tr>
	            <tr>
	                <td>managerAddress :</td>
	                <td>
	                	<input type="text" id="managerAddress" name="managerAddress" value="${modifyManager.managerAddress}">
	                </td>
	            </tr>

	            <tr>
	                <td>managerPhoneNumber :</td>
	                <td>
	                	<input type="password" id="managerPhoneNumber" name="managerPhoneNumber">
	                </td>
	            </tr>
	            <tr>
	                <td>managerLevel :</td>
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
	        </tbody>
	    </table>
	    <button id="btn" type="button">수정</button>
    </form>
    </div>
</body>
</html> 