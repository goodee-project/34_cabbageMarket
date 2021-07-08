<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

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
    </style>
	<script> <!-- 유효성 검사 -->
    $(document).ready(function() {
        $('#summitBtn').click(function() {
            
        	console.log("summitBtn click!");
        	
        	var fileCheck = document.getElementById("imgFileUpload").value;
            if(!fileCheck){
                alert("파일을 첨부해 주세요");
            }else if ($('#productName').val() == '') {
                alert('제목을 입력해 주세요');
                $('#productName').focus();
            } else if ($('#productPrice').val() == '') {
                alert('상품 가격을 입력해 주세요');
                $('#productPrice').focus();
            } else if ($('#productDesc').val() == '') {
                alert('상품 설명을 입력하세요');
                $('#productDesc').focus();
            } else {
                $('#addDirectTradeProductForm').submit();
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
                        <h2>Product Registration</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <a href="${pageContext.request.contextPath}/users/getDirectTradeList">Direct Trade List</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
		<div class="container">
			<form id="addDirectTradeProductForm" action="${pageContext.request.contextPath}/users/addDirectTrade" method="post" enctype="multipart/form-data">
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
					        <img src="${pageContext.request.contextPath}/template/img/productImgUpload.png"/>
					    </label>
					    <input id="imgFileUpload" name="directTradeProductImgs" type="file" style="display: none;" accept="image/*" onchange="setThumbnail(event);" multiple="multiple"/>
					    <div id="image_container" style="display: inline;"></div> <!-- 업로드 된 이미지 미리보기 생성 -->
	                </div>
	                
	                <div class="col-lg-3">
	                </div>
	                <div class="col-lg-9" style="margin-top: 1.5rem; color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
	                	<ul style="list-style:none;">
	                		<li>* 상품 이미지는 640x640에 최적화 되어 있습니다.</li>
	                		<li>- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.</li>
	                		<li>- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.</li>
	                		<li>- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.</li>
	                		<li>- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.</li>
	                		<li>최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)</li>
	                	</ul>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
	                
	                <div class="col-lg-3">
	                	<h4>제목<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<input type="text" id="productName" name="productName" placeholder="상품 제목을 입력해주세요.">
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
	                
	                <div class="col-lg-3">
	                	<h4>카테고리<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input">
	                   	<ul class="categoryUl">
	                       	<li><button class="categoryBtn" type="button">여성의류</button></li>
							<li><button class="categoryBtn" type="button">패션잡화</button></li>
							<li><button class="categoryBtn" type="button">남성의류</button></li>
							<li><button class="categoryBtn" type="button">디지털/가전</button></li>
							<li><button class="categoryBtn" type="button">도서/티켓/취미/반려</button></li>
							<li><button class="categoryBtn" type="button">스타굿즈</button></li>
							<li><button class="categoryBtn" type="button">생활/문구/가구/식품</button></li>
							<li><button class="categoryBtn" type="button">재능</button></li>
							<li><button class="categoryBtn" type="button">기타</button></li>
							<li><button class="categoryBtn" type="button">원룸/함께살아요</button></li>
							<li><button class="categoryBtn" type="button">커뮤니티</button></li>
							<li><button class="categoryBtn" type="button">번개나눔</button></li>
	                    </ul>
	                    
	                    <ul class="categoryUl">
	                       	<li><button class="categoryBtn" type="button">여성의류</button></li>
							<li><button class="categoryBtn" type="button">패션잡화</button></li>
							<li><button class="categoryBtn" type="button">남성의류</button></li>
							<li><button class="categoryBtn" type="button">디지털/가전</button></li>
							<li><button class="categoryBtn" type="button">도서/티켓/취미/반려</button></li>
							<li><button class="categoryBtn" type="button">스타굿즈</button></li>
							<li><button class="categoryBtn" type="button">생활/문구/가구/식품</button></li>
							<li><button class="categoryBtn" type="button">재능</button></li>
							<li><button class="categoryBtn" type="button">기타</button></li>
							<li><button class="categoryBtn" type="button">원룸/함께살아요</button></li>
							<li><button class="categoryBtn" type="button">커뮤니티</button></li>
							<li><button class="categoryBtn" type="button">번개나눔</button></li>
	                    </ul>
	                    
	                    <ul class="categoryUl">
	                       	<li><button class="categoryBtn" type="button">여성의류</button></li>
							<li><button class="categoryBtn" type="button">패션잡화</button></li>
							<li><button class="categoryBtn" type="button">남성의류</button></li>
							<li><button class="categoryBtn" type="button">디지털/가전</button></li>
							<li><button class="categoryBtn" type="button">도서/티켓/취미/반려</button></li>
							<li><button class="categoryBtn" type="button">스타굿즈</button></li>
							<li><button class="categoryBtn" type="button">생활/문구/가구/식품</button></li>
							<li><button class="categoryBtn" type="button">재능</button></li>
							<li><button class="categoryBtn" type="button">기타</button></li>
							<li><button class="categoryBtn" type="button">원룸/함께살아요</button></li>
							<li><button class="categoryBtn" type="button">커뮤니티</button></li>
							<li><button class="categoryBtn" type="button">번개나눔</button></li>
	                    </ul>
	                    
	                    <div class="col-lg-3">
	                	
		                </div>
		                <div class="col-lg-9">
		                	<span style="margin-top: 1.5rem; font-size: 16px; color: #7fad39;">선택한 카테고리:</span>
		                </div>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px; color: rgb(255, 80, 88);"><hr style="border: solid 1px lightgrey;"></div>			
					
					<!-- 직거래 상품 가격 -->
					<div class="col-lg-3">
	                	<h4>가격<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<input type="text" id="productPrice" name="productPrice" placeholder="상품 가격을 입력해주세요." style="width: 90%">&nbsp;원
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
	                
	                <!-- 직거래 상품 상세설명 -->
	                <div class="col-lg-3">
	                	<h4>상세설명<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<textarea id="productDesc" name="productDesc" rows="10" cols="30" placeholder="상품 설명을 입력해주세요."></textarea>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>				
				
					<!-- 직거래 상품 지역 -->
					<div class="col-lg-3">
	                	<h4>지역<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<button class="adrsSearchBtn" type="button">지역 검색</button>
	                	<input type="text" id="location" name="location" readonly="readonly" style="width: 80%">
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
	                
	                <div class="col-lg-12" style="text-align: right;">
	                	<button id="summitBtn" class="summitBtn" type="button">등록하기</button>
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
    <script> 
    	function setThumbnail(event){ 
    		
    		for (var image of event.target.files) {
    			
    			var reader = new FileReader(); 
    			
    			reader.onload = function(event) {
    				var img = document.createElement("img"); 
    				img.setAttribute("src", event.target.result);
    				img.setAttribute("width", 203);
    				img.setAttribute("height", 203);
    				img.setAttribute("style", "margin-right: 4.5px; border: 1px solid rgb(220, 219, 228);");
    				document.querySelector("div#image_container").appendChild(img); 
    			};
    			
    			console.log(image); 
    			reader.readAsDataURL(image); 
    		} 
    	} 
    </script>

</body>

</html>