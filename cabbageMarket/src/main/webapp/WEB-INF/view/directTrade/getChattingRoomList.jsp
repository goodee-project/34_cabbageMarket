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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<script>
$(document).ready(function() {

	var socket = new SockJS("${pageContext.request.contextPath}/endpoint");
	
	stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
    console.log('Connected: ' + frame);
        
    	// 내가 참여하고 있는 모든 채팅방 구독
        $('.chattingRoomId').each( function(index) {
        	// controller에서 받아온 채팅방 id를 input hidden으로 받음
        	var crId = $('.chattingRoomId').eq(index).val();
        	
        	stompClient.subscribe('/subscribe/chat/'+crId, function (chattingContent) {
            	showContent(
            			JSON.parse(chattingContent.body).userId,
            			JSON.parse(chattingContent.body).nickname,
            			JSON.parse(chattingContent.body).createDate,
            			JSON.parse(chattingContent.body).content,
            			JSON.parse(chattingContent.body).chattingRoomId
            			);
            });
        	console.log(crId + '채팅방 구독 완료');
        });
    });

    function showContent(userId, nickname, createDate, content, chattingRoomId) {

    	console.log('userId: ' + userId);
    	console.log('nickname: ' + nickname);
    	console.log('createDate: ' + createDate);
    	console.log('content: ' + content);
    	console.log('chattingRoomId: ' + chattingRoomId);

    	$('#lastContentCR'+chattingRoomId).text(content);
    	$('#lastCreateDateCR'+chattingRoomId).text(createDate);
    }
});
</script>
<body>
<div class="container bootstrap snippets bootdey">
    <div class="row">
		<div class="col-md-4 bg-white ">
            <div class="banner"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""><div>배추톡</div><div style="width: 119px; height: 50px"></div></div>
            <!-- =============================================================== -->
            <!-- member list -->
            <ul class="friend-list">
            	<c:set var="index" value="0"></c:set>
	            <c:forEach var="crl" items="${chattingRoomList}">
	            	<input type="hidden" class="chattingRoomId" value="${crl.chattingRoomId}">
	            	<c:if test="${crl.sellerId == userId}">
		                <li class="active bounceInDown">
		                	<div>내가 올린 상품</div>
		                	<input type="hidden" id="buyerId${index}" value="${crl.buyerId}">
		                	<c:set var="index" value="${index + 1}"/>
		                	<button class="sellerChattingRoom" type="button" value="${crl.directTradeProductRegistrationId}">
		                		<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
		                		<div class="chattingRoom-info">	
		                			<div class="opponent-name">${crl.buyer}</div>
			                		<c:if test="${crl.lastChatterId == userId}">
				                		<div class="last-content"><img src="${pageContext.request.contextPath}/template/img/content_me.png" alt=""><span id="lastContentCR${crl.chattingRoomId}">${crl.lastContent}</span></div>
			                		</c:if>

			                		<c:if test="${crl.lastChatterId != userId}">
				                		<div class="last-content"><span id="lastContentCR${crl.chattingRoomId}">${crl.lastContent}</span></div>
			                		</c:if>
			                	</div>
			                	
		                		<div class="create-date">
		                			<small id="lastCreateDateCR${crl.chattingRoomId}">${crl.createDate}</small><br>
		                			<small>1</small>
		                		</div>
		                	</button>
		                </li>
		                <br>
	                </c:if>
	                
	                <c:if test="${crl.buyerId == userId}">
		                <li class="active bounceInDown">
		                	<div>내가 사려는 상품</div>
		                	<button class="buyerChattingRoom" type="button" value="${crl.directTradeProductRegistrationId}">
		                		<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
		                		<div class="chattingRoom-info">	
		                			<div class="opponent-name">${crl.seller}</div>
			                		<c:if test="${crl.lastChatterId == userId}">
				                		<div class="last-content"><img src="${pageContext.request.contextPath}/template/img/content_me.png" alt=""><span id="lastContentCR${crl.chattingRoomId}">${crl.lastContent}</span></div>
			                		</c:if>

			                		<c:if test="${crl.lastChatterId != userId}">
				                		<div class="last-content"><span id="lastContentCR${crl.chattingRoomId}">${crl.lastContent}</span></div>
			                		</c:if>
			                	</div>
			                	
		                		<div class="create-date">
		                			<small id="lastCreateDateCR${crl.chattingRoomId}">${crl.createDate}</small><br>
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
	
	// 내가 올린 상품과 내가 사려는 상품에 따라 채팅방에 들어갈때 넘겨주는 파라미터를 다르게 주어야한다. 
	$(document).on('click', '.sellerChattingRoom', function(){ // 내가 올린 상품
		var index = $('.sellerChattingRoom').index(this);
		var dtprId = $('.sellerChattingRoom').eq(index).val();
		var buyerId = $('#buyerId'+index).val();
		
		console.log("직거래 상품 ID: "+dtprId);
		window.open("${pageContext.request.contextPath}/users/getChattingRoomOne?directTradeProductRegistrationId="+dtprId+"&userId="+buyerId, "chattingRoom", "width=400, height=600, left=620, top=200"); 
	});
	
	$(document).on('click', '.buyerChattingRoom', function(){ // 내가 사려는 상품
		var index = $('.buyerChattingRoom').index(this);
		var dtprId = $('.buyerChattingRoom').eq(index).val();
		
		console.log("직거래 상품 ID: "+dtprId);
		window.open("${pageContext.request.contextPath}/users/getChattingRoomOne?directTradeProductRegistrationId="+dtprId+"&userId=${usersSession.userId}", "chattingRoom", "width=400, height=600, left=620, top=200"); 
	});
});
</script>
</html>