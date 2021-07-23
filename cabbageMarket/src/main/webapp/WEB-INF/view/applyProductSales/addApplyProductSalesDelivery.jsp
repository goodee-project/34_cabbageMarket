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
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>배추마켓 상품 배송 신청</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css" type="text/css">
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
			height: 42px;
		    width: 6.5rem;
		    text-align: center;
		    border: 1px solid rgb(195, 194, 204);
		    margin-right: 1rem;
		    margin-left: 1rem;
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
		
		#returnAddress{
			-webkit-tap-highlight-color: transparent;
		    background-color: #fff;
		    border-radius: 5px;
		    border: solid 1px #e8e8e8;
		    box-sizing: border-box;
		    clear: both;
		    cursor: pointer;
		    display: block;
		    float: left;
		    font-family: inherit;
		    font-size: 14px;
		    font-weight: normal;
		    height: 42px;
		    line-height: 40px;
		    outline: none;
		    padding-left: 18px;
		    padding-right: 30px;
		    position: relative;
		    text-align: left !important;
		    -webkit-transition: all 0.2s ease-in-out;
		    transition: all 0.2s ease-in-out;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    white-space: nowrap;
		    width: auto;
		}
    </style>
	<script> <!-- 유효성 검사 -->
    $(document).ready(function() {
    	
    	// 상품 가격 숫자입력 유효성 검사
    	var enCheck = RegExp( /[^0-9]$/);
    	// 카테고리 유효성 검사
    	var cateCheck = 0;
    	
    	// 폼 전송 유효성 검사
        $('#summitBtn').click(function() {
            
        	console.log("summitBtn click!");
        	$('#imgFileUpload').remove();
        	
        	var fileCheck = document.getElementById("imgFileUpload").value;

            if(!fileCheck){
                alert("파일을 첨부해 주세요");
            }else if ($('#productName').val() == '') {
                alert('제목을 입력해 주세요');
                $('#productName').focus();
            } else if ($('#deliveryRequests').val() == '') {
                alert('상품 설명을 입력하세요');
                $('#deliveryRequests').focus();
            } else if (cateCheck == 0) {
                alert('카테고리를 선택해 주세요');
                $('#categorySubId').focus();
            } else {
                $('#addApplyProductSalesDeliveryForm').submit();
            }
        });
        
        
    	// 카테고리 비동기 통신
        console.log('카테고리 대분류');
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/getCategoryMain',
			success: function(jsonData) {
				$(jsonData).each(function(index, item) {
					var html = '';
					html += '<li><button class="categoryBtn categoryMainBtn" type="button" value='+item.categoryMainId+'>';
					html += item.categoryMainName+'</button></td>';
					$('#categoryMain').append(html);
				});
			}
		});

		$(document).on('click', '.categoryMainBtn', function(){
			cateCheck = 0;
			console.log('카테고리 중분류');
			var index = $('.categoryMainBtn').index(this);
			
			var categoryMainText = $(".categoryMainBtn").eq(index).text();
			$('#selectCategoryMain').empty();
			$('#selectCategoryMiddle').empty();
			$('#selectCategorySub').empty();
			$("#selectCategoryMain").append(" "+categoryMainText);

			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/getCategoryMiddle',
				data:{categoryMainId : $('.categoryMainBtn').eq(index).val()},
				success: function(jsonData) {
					
					$('#categoryMiddle').empty();
					$('#categorySub').empty();
					
					$(jsonData).each(function(index, item) {
						var html = '';
						html += '<li><button class="categoryBtn categoryMiddleBtn" type="button" value='+item.categoryMiddleId+'>';
						html += item.categoryMiddleName+'</button></td>';
						$('#categoryMiddle').append(html);
					});
				}
			});
		});
		
		$(document).on('click', '.categoryMiddleBtn', function(){
			cateCheck = 0;
			console.log('카테고리 소분류');
			var index = $('.categoryMiddleBtn').index(this);
			
			var categoryMiddleText = $(".categoryMiddleBtn").eq(index).text();
			$('#selectCategoryMiddle').empty();
			$('#selectCategorySub').empty();
			$("#selectCategoryMiddle").append(" >> "+categoryMiddleText);
			
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/getCategorySub',
				data:{categoryMiddleId : $('.categoryMiddleBtn').eq(index).val()},
				success: function(jsonData) {
					
					$('#categorySub').empty();
					
					$(jsonData).each(function(index, item) {
						var html = '';
						html += '<li><input type="hidden" id="categorySubId" name="categorySubId" value="'+item.categorySubId+'">';
						html += '<button class="categoryBtn categorySubBtn" type="button">';
						html += item.categorySubName+'</button></td>';
						$('#categorySub').append(html);
					});
				}
			});
		});
		
		$(document).on('click', '.categorySubBtn', function(){
			cateCheck = 1;
			var index = $('.categorySubBtn').index(this);
			var categorySubText = $(".categorySubBtn").eq(index).text();
			$('#selectCategorySub').empty();
			$("#selectCategorySub").append(" >> "+categorySubText);
			
		});
		
		// 배송지 목록 비동기로 가져오기
		console.log('shipping Address 목록');
		$.ajax({
			type:'get',
			url:'http://localhost/cabbageMarket/getShippingAddress',
			success: function(jsonData) {
				$(jsonData).each(function(index, item) {
					var html = '<option value="'+item.address+'">'+item.address+'</option>';
					$('#returnAddress').append(html);
				});
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
                        <h2>Apply Product Sales</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
		<div class="container">
			<form id="addApplyProductSalesDeliveryForm" action="${pageContext.request.contextPath}/users/addApplyProductSalesDelivery" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="${usersSession.userId}">
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
	                	<label for="imgFileUpload"> <span id="target"></span>
					        <img src="${pageContext.request.contextPath}/template/img/productImgUpload.png"/>
					    </label>
					    <input id="imgFileUpload" name="applyProductSalesDeliveryImgs" type="file" style="display: none;" accept="image/*" onchange="setThumbnail(event);" multiple="multiple"/>
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
	                	<!-- 대분류 카테고리 -->
	                   	<ul class="categoryUl" id="categoryMain">
	                    </ul>
	                    <!-- 중분류 카테고리 -->
	                    <ul class="categoryUl" id="categoryMiddle">
	                    </ul>
	                    <!-- 소분류 카테고리 -->
	                    <ul class="categoryUl" id="categorySub">
	                    </ul>
	                    
	                    <div class="col-lg-3">
		                </div>
		                <div class="col-lg-9">
		                	<span id="selectCategory" style="margin-top: 1.5rem; font-size: 16px; color: #7fad39;">선택한 카테고리:
		                	<span id="selectCategoryMain" style="font-weight:bold;"></span>
		                	<span id="selectCategoryMiddle" style="font-weight:bold;"></span>
		                	<span id="selectCategorySub" style="font-weight:bold;"></span>
		                	</span>
		                </div>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px; color: rgb(255, 80, 88);"><hr style="border: solid 1px lightgrey;"></div>			
					
					<!-- 판매 상품 등록 운송장 번호 -->
					<div class="col-lg-3">
	                	<h4>운송장 번호<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<input type="text" id="waybillNumber" name="waybillNumber" placeholder="운송장 번호를 입력해주세요." style="width: 90%">
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
					
					<!-- 판매 상품 등록 반송 주소-->
					<div class="col-lg-3">
	                	<h4>반송 주소<span style="color: #7fad39;">*</span></h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
						<select id="returnAddress" name="returnAddress">
						</select>
						<a href="${pageContext.request.contextPath}/users/shippingAddress" target="_blank"><button type="button" class="adrsSearchBtn">주소 추가</button></a>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
 
	                <!-- 판매 상품 등록 판송 요청사항 -->
	                <div class="col-lg-3">
	                	<h4>반송 시 요청사항</h4>
	                </div>
	                <div class="col-lg-9 checkout__input" style="display: inline;">
	                	<textarea id="deliveryRequests" name="deliveryRequests" rows="10" cols="30" placeholder="반송 요청사항을 입력해주세요."></textarea>
	                </div>
	                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
	                
	                <div class="col-lg-12" style="text-align: right;">
	                	<button id="summitBtn" class="summitBtn" type="button">신청하기</button>
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
    			
    			$('#target').prepend('<input id="imgFileUpload" name="applyProductSalesDeliveryImgs" type="file" style="display: none;" accept="image/*" onchange="setThumbnail(event);" multiple="multiple"/>');
    		} 
    	} 
    </script>
</body>

</html>