<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>배추마켓 경매 상품 수정</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style type="text/css">
    	.imgBtn {
		    border: none;
		    outline: none;
		    white-space: nowrap;
		    width: 100%;
		    height: 100%;
		    padding: 0px;
		}
    	.categoryBtn {
    		background-color: transparent;
		    cursor: pointer;
		    border: none;
		    outline: none;
		    white-space: nowrap;
		    text-align: left;
		    width: 100%;
		    height: 100%;
		    padding: 0px 1.5rem;
		}
		.categoryBtn:hover {
		    background-color: rgb(244, 244, 250);
		}
		.categoryBtn:active {
			background-color: rgb(234, 233, 241);
		}
		.categoryUl{
			display:inline-block; 
			list-style:none; 
			overflow-y:scroll; 
			width:250px; 
			height:400px;
			border: 1px solid rgb(220,219,224);
		}
		.adrsSearchBtn{
			height: 46px;
		    width: 6.5rem;
		    text-align: center;
		    border: 1px solid rgb(195, 194, 204);
		    margin-right: 1rem;
		    border-radius: 2px;
			white-space: nowrap;
			background-color: white;
			padding-right: 20px;
			padding-left: 20px;
		}
		.adrsSearchBtn:hover {
		    background-color: rgb(244, 244, 250);
		}
		.adrsSearchBtn:active {
			background-color: rgb(234, 233, 241);
		}
		.summitBtn{
			height: 60px;
		    width: 180px;
			background-color: #7fad39;
			color: white;
		    border: none;
		    outline: none;
		    white-space: nowrap;
		}
		.images{
			width: 203px;
    		height: 203px;
    		margin-right: 4.5px; 
    		border: 1px solid rgb(220, 219, 228);
		}
    </style>
	<!-- datePicker -->
	<script>
		$(function() {
	    //input을 datepicker로 선언
			$("#registrationDeadline").datepicker({
				 dateFormat: 'yy-mm-dd' //달력 날짜 형태
				,minDate: "+1d" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				,maxDate: "+3m" //최대 선택일자(+1D:하루후, -1M:한달후,)
			});	
		//초기값을 내일 날짜로 설정
		$('#registrationDeadline').datepicker('setDate', '+1d'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) 
	
		$('#datediff').append('　1일　');
		$("#registrationDeadline").on("change",function(){
				console.log("날짜새로입력");
		            $(this).css("color", "black");
		            $(this).css("font-weight", "normal");
		            var date = new Date ($(this).val());
		            console.log("입력 date:"+date);
		            var now = new Date();
		            console.log("오늘 date:"+now);
		            var dateDiff = Math.ceil((date.getTime()-now.getTime())/(1000*3600*24));
		            console.log("diff:"+dateDiff);
		            $('#datediff').empty();
		            $('#datediff').append("　"+dateDiff+"일　");
		         }
		      );
	  });
	</script>
	<script> <!-- 유효성 검사 -->
    $(document).ready(function() {
    	
    	
    	// 상품 가격 숫자입력 유효성 검사
    	var enCheck = RegExp( /[^0-9]$/);
    	
    	$('#minBidPrice').keyup(function(){
    		if(enCheck.test($('#minBidPrice').val())){
    			alert('숫자만 입력해 주세요');
    			$('#minBidPrice').val('');
    		}
    	});
    	
    	$('#quote').keyup(function(){
    		if(enCheck.test($('#quote').val())){
    			alert('숫자만 입력해 주세요');
    			$('#quote').val('');
    		}
    	});
    	
    	// 폼 전송 유효성 검사
        $('#summitBtn').click(function() {
            
        	console.log("summitBtn click!");

            if ($('#minBidPrice').val() == '') {
                alert('최소 입찰 가격을 입력해 주세요');
                $('#minBidPrice').focus();
            } else if ($('#quote').val() == '') {
                alert('상품 호가를 입력하세요');
                $('#quote').focus();
            } else if ($('#productDesc').val() == '') {
                alert('상품 설명을 입력하세요');
                $('#productDesc').focus();
            } else {
                $('#modifyAuctionProductForm').submit();
            }
        });
		
    });
  </script>
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- Humberger End -->
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>경매상품 정보수정</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <a href="${pageContext.request.contextPath}/users/getAuctionList">경매상품보기</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
		<div class="container">
			<form id="modifyAuctionProductForm" action="${pageContext.request.contextPath}/users/modifyAuction" method="post">
				<input type="hidden" name="applyProductSalesDeliveryId" value="${applyId}">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title product__discount__title" style="margin-top: 30px;">
		                	<h2>기본정보<span style="color: #7fad39; font-size: 1rem; margin-left: 2rem;">*필수항목</span></h2>
		                </div>
	                </div>
	
	                <div class="col-lg-3">
	                	<h4>상품이미지<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9" style="display: inline;">
	                	<label for="imgFileUpload">
					        <c:forEach var="img" items="${AuctionProductAndImgsList}">
                        		<img class="images" data-imgbigurl="${pageContext.request.contextPath}/template/img/applyProductImg/${img.imgName}"
                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${img.imgName}" alt="">
                        	</c:forEach>
					    </label>
	                </div>
	                
	                <div class="col-lg-3">
	                </div>
	                <div class="col-lg-9" style="margin-top: 1.5rem; color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
	                	<ul style="list-style:none;">
	                		<li>* 사진 수정은 불가합니다.</li>
	                	</ul>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
	                

	                <c:if test="${state eq '마감'}">
						<div class="col-lg-3">
		                	<h4>경매 마감 일자 재설정<span style="color: #7fad39;">*</span></h4>
		                </div>
		                <div class="col-lg-9 checkout__input" style="display: inline;">
		                	<input type="text" id="registrationDeadline" name="registrationDeadline" style="color:#7fad39; font-weight:bold;">
		                </div>
		                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
	                </c:if>
	                

					<!-- 직거래 상품 가격 -->
					<div class="col-lg-3">
	                	<h4>최소 입찰 가격<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<input type="text" id="minBidPrice" name="minBidPrice" value="${AuctionProductAndImgsList[0].minBidPrice}" style="width: 90%">&nbsp;원
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
	                
	                <!-- 직거래 상품 가격 -->
					<div class="col-lg-3">
	                	<h4>호가<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<input type="text" id="quote" name="quote" value="${AuctionProductAndImgsList[0].quote}" style="width: 90%">&nbsp;원
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
	                
	                <!-- 직거래 상품 상세설명 -->
	                <div class="col-lg-3">
	                	<h4>상세설명<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<textarea id="productDesc" name="productDesc" rows="10" cols="30">${AuctionProductAndImgsList[0].productDesc}</textarea>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>				
				   
	                <div class="col-lg-12" style="text-align: right;">
	                	<button id="summitBtn" class="summitBtn" type="button">수정하기</button>
	                </div>
	                
				</div>
			</form>
		</div>
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
	
    </section>
    <!-- Product Details Section End -->



    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/template/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/main.js"></script>
</body>

</html>