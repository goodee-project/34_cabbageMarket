<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getManagerList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <h1>getManagerList</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/manager/managerIndex">managerIndex</a></li>
	</ul>
    
    <table class="table table-striped">
        <thead>
            <tr>
                
                <th>managerName</th>
                <th>managerNickname</th>
                <th>managerId</th>
                <th>managerLevel</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${managerList}">
                <tr>
                	
                	<td>${b.managerName}</td>
                	<td>${b.managerNickname}</td>
					<td><a href="${pageContext.request.contextPath}/manager/getManagerInfo?managerId=${b.managerId}">${b.managerId}</a></td>
                	<td>${b.managerLevel}</td>
                	
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/manager/getManagerList?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/manager/getManagerList?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/manager/addManager">매니저 추가</a>
    </div>
</div>
</body>
</html>