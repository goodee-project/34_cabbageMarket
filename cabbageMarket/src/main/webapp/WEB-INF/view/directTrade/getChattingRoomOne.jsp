<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
<title>배추 채팅방</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">  
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/chattingRoomOne.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<script>
$(document).ready(function() {
	document.documentElement.scrollTop = document.body.scrollHeight;
	
	$('#chatContent').keyup(function(){
		if (window.event.keyCode == 13) {
			sendName();
			$('#chatContent').val('');
		}
	});
	
	var chattingRoomId = $('#chattingRoomId').val();
	
	var socket = new SockJS("${pageContext.request.contextPath}/endpoint");
	
	stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        
        stompClient.subscribe('/subscribe/chat/'+chattingRoomId, function (chattingContent) {
        	showContent(
        			JSON.parse(chattingContent.body).userId,
        			JSON.parse(chattingContent.body).nickname,
        			JSON.parse(chattingContent.body).createDate,
        			JSON.parse(chattingContent.body).content
        			);
        });

    });

    $( "#send" ).click(function() { sendName(); $('#chatContent').val('');});
    // 채팅 내용 서버 전송 함수 
    // chatting_content 테이블 도메인에 맞는 값을 JSON으로 전송한다.
    function sendName() {
        stompClient.send("/app/sendMessage/"+chattingRoomId, {}, 
        		JSON.stringify({
        			'chattingRoomId': chattingRoomId,
        			'userId': '${usersSession.userId}',  // 로그인한 회원의 userId (채팅을 친사람)
        			'content': $("#chatContent").val()
        		}));
    }
    
    function showContent(userId, nickname, createDate, content) {
    	console.log('userId: ' + userId);
    	console.log('nickname: ' + nickname);
    	console.log('createDate: ' + createDate);
    	console.log('content: ' + content);
    	    	
    	var html = '';
    	var recvUserId = '${usersSession.userId}'
    	console.log("recvUserId : " + recvUserId);
    	
    	if(userId != recvUserId){
    		html += '<li class="left clearfix">';
			html += '<span class="chat-img pull-left"><img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar"></span>';
			html += '<div class="chat-body clearfix">';
			html += '<div class="header">';
			html += '<strong class="primary-font">'+nickname+'</strong>';
			html += '<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>'+createDate+'</small>';
			html += '</div>';
			html += '<p>'+content+'</p>';
			html += '</div>';
			html += '</li>';
    	}
		
    	if(userId == recvUserId){
    		html += '<li class="right clearfix">';
			html += '<span class="chat-img pull-right"><img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar"></span>';
			html += '<div class="chat-body clearfix">';
			html += '<div class="header">';
			html += '<strong class="primary-font">'+nickname+'</strong>';
			html += '<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>'+createDate+'</small>';
			html += '</div>';
			html += '<p>'+content+'</p>';
			html += '</div>';
			html += '</li>';
    	}
		
        $("#chattingContent").append(html);
        document.documentElement.scrollTop = document.body.scrollHeight;
    }
    
    $('#productState').change(function(){
    	
    	$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/modifyProductState',
			data:{productState : $('#productState').val(), directTradeProductRegistrationId : $('#directTradeProductRegistrationId').val()},
			success: function() {
				$('#changeComplete').empty();
				$("#changeComplete").append(" 수정이 완료 되었습니다<br>내정보 -> 등록상품에서 확인 가능합니다");
			}
		});
    	
	});
});
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
</script>
<body>
<div class="container bootstrap snippets bootdey">
    <div class="row">
    
    	<div class="banner">
    		<img class="product__details__pic__item--large" style="width: 50px; height: 50px; margin-right: 10px;"
            	src="${pageContext.request.contextPath}/template/img/directTradeImg/${productDetail.imgName}" alt="">
    		<div style="padding-right: 10px;">
    			<div class="bannerPrice">${productDetail.productPrice}<small>원</small></div>
    			<div class="bannerName"><span style="color: rgb(153, 219, 139);font-weight: bold;">안전</span>
    				<c:if test="${productDetail.productName.length() < 15}">
    					${productDetail.productName}
    				</c:if>
    				<c:if test="${productDetail.productName.length() >= 15}">
    					${productDetail.productName.substring(0,15)}..
    				</c:if>
    			</div>
    		</div>
    		<c:if test="${productDetail.userId == usersSession.userId}">
    			<button class="bannerButton modal_btn" type="button" onclick="onClick()">상태변경</button>
    		</c:if>
    	</div>
    	
    	<div class="black_bg"></div>
			<div class="modal_wrap">
		    	<div class="modal_close"><a href="#" onclick="offClick()">close</a></div>
		        <br><br>
		        <div class="filter__sort">
		        	<input type="hidden" id="directTradeProductRegistrationId" value="${directTradeProductRegistrationId}">
		        	<select id="productState" name="productState">
			        	<option value="1">판매중</option>
			        	<option value="2">예약중</option>
			        	<option value="3">판매완료</option>
			        </select><br>
			        <span id="changeComplete"></span>
		        </div>
			</div>
    	
        <!-- selected chat -->
    	<div class="col-md-8 bg-white ">
            <div class="chat-message">
            	<input type="hidden" id="chattingRoomId" value="${ChattingRoomInfo.chattingRoomId}">
                <ul class="chat" id="chattingContent">
                	<c:forEach var="ccl" items="${chattingContentList}">
                		<!-- 상대방 채팅 왼쪽 -->
                		<c:if test="${ccl.userId != usersSession.userId}">
		                    <li class="left clearfix">
		                    	<span class="chat-img pull-left">
		                    		<img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">
		                    	</span>
		                    	<div class="chat-body clearfix">
		                    		<div class="header">
		                    			<strong class="primary-font">${ccl.nickname}</strong>
		                    			<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>${ccl.createDate}</small>
		                    		</div>
		                    		<p>${ccl.content}</p>
		                    	</div>
		                    </li>
	                    </c:if>

	                    <!-- 내가 작성한 채팅 오른쪽 -->
	                    <c:if test="${ccl.userId == usersSession.userId}">
		                    <li class="right clearfix">
		                    	<span class="chat-img pull-right">
		                    		<img src="https://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
		                    	</span>
		                    	<div class="chat-body clearfix">
		                    		<div class="header">
		                    			<strong class="primary-font">${ccl.nickname}</strong>
		                    			<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>${ccl.createDate}</small>
		                    		</div>
		                    		<p>${ccl.content}</p>
		                    	</div>
		                    </li>  
	                    </c:if>
	                    
                    </c:forEach>     
                     
                </ul>
            </div>
            <div class="chat-box bg-white">
            	<div class="input-group">
            		<input id="chatContent" class="form-control border no-shadow no-rounded" placeholder="Type your message here">
            		<span class="input-group-btn">
            			<button id="send" class="btn btn-success no-rounded" type="button">Send</button>
            		</span>
            	</div><!-- /input-group -->	
            </div>            
		</div>        
	</div>
</div>
</body>
</html>