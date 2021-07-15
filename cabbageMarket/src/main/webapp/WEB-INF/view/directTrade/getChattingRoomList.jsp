<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배추톡 목록</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">  
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/chattingRoomList.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container bootstrap snippets bootdey">
    <div class="row">
		<div class="col-md-4 bg-white ">
            <div class="banner"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""><div>배추톡</div><div style="width: 119px; height: 50px"></div></div>
            <!-- =============================================================== -->
            <!-- member list -->
            <ul class="friend-list">
            
	            <c:forEach var="crl" items="${chattingRoomList}">
	            	<c:if test="${crl.sellerId == userId}">
		                <li class="active bounceInDown">
		                	<button class="chattingRoom" type="button" value="${crl.directTradeProductRegistrationId}">
		                		<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
		                		<div class="chattingRoom-info">	
		                			<div class="opponent-name">${crl.buyer}</div>
			                		<c:if test="${crl.lastChatterId == userId}">
				                		<div class="last-content"><img src="${pageContext.request.contextPath}/template/img/content_me.png" alt="">${crl.lastContent}</div>
			                		</c:if>

			                		<c:if test="${crl.lastChatterId != userId}">
				                		<div class="last-content">${crl.lastContent}</div>
			                		</c:if>
			                	</div>
			                	
		                		<div class="create-date">
		                			<small>${crl.createDate}</small><br>
		                			<small>1</small>
		                		</div>
		                	</button>
		                </li>
		                <br>
	                </c:if>
	                
	                <c:if test="${crl.buyerId == userId}">
		                <li class="active bounceInDown">
		                	<button class="chattingRoom" type="button" value="${crl.directTradeProductRegistrationId}">
		                		<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
		                		<div class="chattingRoom-info">	
		                			<div class="opponent-name">${crl.seller}</div>
			                		<c:if test="${crl.lastChatterId == userId}">
				                		<div class="last-content"><img src="${pageContext.request.contextPath}/template/img/content_me.png" alt="">${crl.lastContent}</div>
			                		</c:if>

			                		<c:if test="${crl.lastChatterId != userId}">
				                		<div class="last-content">${crl.lastContent}</div>
			                		</c:if>
			                	</div>
			                	
		                		<div class="create-date">
		                			<small>${crl.createDate}</small><br>
		                			<small>1</small>
		                		</div>
		                	</button>
		                </li>
		                <br>
	                </c:if>
	                
	            </c:forEach>  
    
            </ul>
		</div>
               
	</div>
</div>
</body>
<script>
//채팅방 팝업창
$(document).ready(function() {
	$(document).on('click', '.chattingRoom', function(){
		var index = $('.chattingRoom').index(this);
		var dtprId = $('.chattingRoom').eq(index).val();
		console.log(dtprId);
		
		window.open("${pageContext.request.contextPath}/users/getChattingRoomOne?directTradeProductRegistrationId="+dtprId+"&userId=${usersSession.userId}", "chattingRoom", "width=400, height=600, left=620, top=200"); 
	});
});
</script>
</html>