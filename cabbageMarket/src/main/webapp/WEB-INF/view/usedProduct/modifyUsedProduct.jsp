<!-- 작성자 : 김희진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
<title>배추마켓 중고상품 수정</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nice-se" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

.categoryUl {
	display: inline-block;
	list-style: none;
	overflow-y: scroll;
	width: 250px;
	height: 400px;
	border: 1px solid rgb(220, 219, 224);
}

.adrsSearchBtn {
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

.summitBtn {
	height: 60px;
	width: 180px;
	background-color: #7fad39;
	color: white;
	border: none;
	outline: none;
	white-space: nowrap;
}
</style>

<script>
<!-- 유효성 검사 -->
	$(document).ready(function() {

		// 상품 가격 숫자입력 유효성 검사
    	var enCheck = RegExp( /[^0-9]$/);
		
    	$('#productPrice').keyup(function(){
    		if(enCheck.test($('#productPrice').val())){
    			alert('숫자만 입력해 주세요');
    			$('#productPrice').val('');
    		}
    	});
		
		// 폼 전송 유효성 검사
		$('#btn').click(function() {
			console.log("btn click!");

			if ($('#productDesc').val() == '') {
				alert("상품 설명을 입력하세요");
				$('#productDesc').focus();
			} else if ($('#productPrice').val() == '') {
				alert('상품 가격을 입력하세요');
				$('#productPrice').focus();
			} else {
				$('#modifyUsedProductForm').submit();
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
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<!-- Humberger End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Product Registration</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/index">Home</a> <a
								href="${pageContext.request.contextPath}/users/getUsedProductList">UsedProduct
								List</a> <span>Cabbage Market</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<div class="container">
		<form id="modifyUsedProductForm" action="${pageContext.request.contextPath}/users/modifyUsedProduct" method="post">
			<input type="hidden" name="applyProductSalesDeliveryId" value="${usedProductDetail.applyId}">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title product__discount__title" style="margin-top: 30px;">
						<h2>
							기본정보<span style="color: #7fad39; font-size: 1rem; margin-left: 2rem;">*필수항목</span>
						</h2>
					</div>
				</div>
				
				<!-- 상품 이미지 -->
				<div class="col-lg-3">
	            	<h4>상품 이미지<span style="color: #7fad39;"></span></h4>
                </div>
                <div class="col-lg-9" style="display: inline;">
                	<label for="imgFileUpload">
				        <c:forEach var="img" items="${imgNameList}">
                       		<img class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
                               src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}" alt="" >
                       	</c:forEach>
				    </label>
                </div>
               <div class="col-lg-9" style="margin-top: 1.5rem; color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
               	<ul style="list-style:none;">
               		<li>* 사진 수정은 불가합니다.</li>
               	</ul>
               </div>
               <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>
               
				<!-- 카테고리 -->
				<div class="col-lg-3">
					<h4>카테고리<span style="color: #7fad39;"></span></h4>
				</div>
				<div class="col-lg-9 checkout__input" style="display: inline;">
					<input type="text" value="${usedProductDetail.categorySubName}" disabled>
				</div>
				<div class="col-lg-12" style="margin-bottom: 15px;">
					<hr style="border: solid 1px lightgrey;">
				</div>
				
				<!-- 상품명 -->
				<div class="col-lg-3">
					<h4>상품명<span style="color: #7fad39;"></span></h4>
				</div>
				<div class="col-lg-9 checkout__input" style="display: inline;">
					<input type="text" value="${usedProductDetail.productName}" disabled>
				</div>
				<div class="col-lg-12" style="margin-bottom: 15px;">
					<hr style="border: solid 1px lightgrey;">
				</div>

				<!-- 상품설명 입력 -->
				<div class="col-lg-3">
					<h4>상품 설명<span style="color: #7fad39;">*</span></h4>
				</div>
				<div class="col-lg-9 checkout__input" style="display: inline;">
					<textarea id="productDesc" name="productDesc" rows="10" cols="20">${usedProductDetail.productDesc}</textarea>
				</div>
				<div class="col-lg-12" style="margin-bottom: 15px;">
					<hr style="border: solid 1px lightgrey;">
				</div>
				
				<!-- 판매가격 입력 -->
				<div class="col-lg-3">
					<h4>판매 가격<span style="color: #7fad39;">*</span></h4>
				</div>
				<div class="col-lg-9 checkout__input" style="display: inline;">
					<input type="text" id="productPrice" name="productPrice" value="${usedProductDetail.productPrice}">
				</div>
				<div class="col-lg-12" style="margin-bottom: 15px;">
					<hr style="border: solid 1px lightgrey;">
				</div>
				
				<!-- 마감 일자 -->
				<div class="col-lg-3">
					<h4>마감 일자<span style="color: #7fad39;"></span></h4>
				</div>
				<div class="col-lg-9 checkout__input" style="display: inline;">
					<input type="text" value="${usedProductDetail.deadLine}" disabled>
				</div>
				<div class="col-lg-12" style="margin-bottom: 15px;">
					<hr style="border: solid 1px lightgrey;">
				</div>
				
				<!-- 수정 버튼 -->
				<div class="col-lg-12" style="text-align: right;">
					<div>
						<button id="btn" type="button" class="btn btn-success">수정</button>
						<a href="${pageContext.request.contextPath}/users/registedProduct">
							<button type="button" class="btn btn-success">취소</button>
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Product Details Section Begin -->
	<section class="product-details spad"></section>
	<!-- Product Details Section End -->

	<!-- Related Product Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/template/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/js/main.js"></script>
	
</body>

</html>