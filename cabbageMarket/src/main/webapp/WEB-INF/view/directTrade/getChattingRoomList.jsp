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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
body {
  padding: 0;
  font-size: 12px;
  color: #777;
  background: #f9f9f9;
  font-family: 'Open Sans',sans-serif;
}

.bg-white {
  padding: 0;
  background-color: #fff;
}

.friend-list {
  list-style: none;
  padding: 0;
}

.friend-list li {
  border-bottom: 1px solid #eee;
}

.friend-list li a img {
  float: left;
  width: 45px;
  height: 45px;
  margin-right: 10px;
}

 .friend-list li a {
  position: relative;
  display: block;
  padding: 10px;
  transition: all .2s ease;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
}

.friend-list li.active a {
  background-color: #f1f5fc;
}

.friend-list li a .friend-name, 
.friend-list li a .friend-name:hover {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    line-height: 1.4;
    font-size: 16px;
    font-weight: 500;
    color: rgb(33, 33, 33);
}

.friend-list li a .last-message {
  font-size: 15px;
  width: 65%;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

.friend-list li a .time {
  position: absolute;
  top: 10px;
  right: 8px;
}

small, .small {
  font-size: 85%;
}

.friend-list li a {
  position: absolute;
  right: 8px;
  top: 27px;
  font-size: 10px;
  padding: 3px 5px;
}

.img-circle{
  width: 45px;
  height: 45px;
}

a:hover, a:active, a:focus {
  text-decoration: none;
  outline: 0;
}
.banner{
	position: relative;
    width: 100%;
    display: flex;
    justify-content: space-between;
    height: 50px;
    align-items: center;
    background: rgb(255, 255, 255);
    z-index: 10;
    padding: 0px 1rem;
    border-bottom: 2px solid #7fad39;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    color: black;
}
.chattingRoom{
	border-style: none;
	width: 100%;
	display: flex;
    background: rgb(255, 255, 255);
    flex-direction: row;
    -webkit-box-orient: horizontal;
    -webkit-box-align: center;
    align-items: center;
    height: 80px;
    justify-content: space-between;
}
.chattingRoom-info{
	width:195px;
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
}
.opponent-name{
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    line-height: 1.4;
    font-size: 18px;
    font-weight: bold;
    color: rgb(33, 33, 33);
}
.last-content{
    max-width: 9.75rem;
    line-height: 1.4;
    text-align:left;
    font-weight: bold;
    font-size: 14px;
    margin-top: 4px;
    color: rgb(102, 102, 102);
    white-space: pre-wrap;
    text-overflow: ellipsis;
    display: -webkit-box;
    word-break: break-all;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow-wrap: break-word;
    max-height: 2.8em;
    overflow: hidden;
}
.create-date{
	padding-top: 16px;
	padding-right: 16px;
    height: 100%;
    font-size: 12px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    line-height: 1.4;
    color: rgb(153, 153, 153);
}
</style>
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
		
		window.open("${pageContext.request.contextPath}/users/getChattingRoomOne?directTradeProductRegistrationId="+dtprId+"&userId=3", "chattingRoom", "width=400, height=600, left=620, top=200"); 
	});
});
</script>
</html>