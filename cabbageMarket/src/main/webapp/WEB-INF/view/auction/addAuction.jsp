<!-- 작성자 : 강혜란 210712 http://localhost/cabbageMarket/users/addAuction?applyId=1-->
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
    <title>배추마켓</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/heartStyle.css" type="text/css">
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
                        <h2>확인된 상품 등록</h2>
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

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">경매상품으로 수정</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">중고상품으로 수정</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">상품삭제</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    
                                	<div class="container">
									<form id="addDirectTradeProductForm" action="${pageContext.request.contextPath}/users/addDirectTrade" method="post" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="8"> <!-- userId = 8으로 입력 테스트 -->
										<div class="row">
											<div class="col-lg-12">
												<div class="section-title product__discount__title" style="margin-top: 30px;">
								                	<h2>기본정보<span style="color: #7fad39; font-size: 1rem; margin-left: 2rem;">*필수항목</span></h2>
								                </div>
							                </div>
							
							                <div class="col-lg-3">
							                	<h4>상품이미지</h4>
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
							                		<li>* 상품 이미지 수정이 가능합니다.</li>
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
							                	<h4>카테고리</h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="color: rgb(74, 164, 255); line-height: 1.5; font-size: 14px;">
							                	<input type="text" id="productName" name="productName" placeholder="상품 제목을 입력해주세요.">
							                	<ul style="list-style:none; margin-top: 1.5rem;">
							                		<li>* 상품 카테고리는 수정이 불가합니다</li>
							                	</ul>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px; color: rgb(255, 80, 88);"><hr style="border: solid 1px lightgrey;"></div>			
											
											<!-- 경매 상품 최소입찰가 -->
											<div class="col-lg-3">
							                	<h4>최소 입찰가<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="productPrice" name="productPrice" placeholder="상품 가격을 입력해주세요." style="width: 90%">&nbsp;원
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <!-- 경매 상품 호가 -->
											<div class="col-lg-3">
							                	<h4>호가<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<input type="text" id="productPrice" name="productPrice" placeholder="상품 가격을 입력해주세요." style="width: 90%">&nbsp;원
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <!-- 경매 상품 상세설명 -->
							                <div class="col-lg-3">
							                	<h4>상세설명<span style="color: #7fad39;">*</span></h4>
							                </div>
							                <div class="col-lg-9 checkout__input" style="display: inline;">
							                	<textarea id="productDesc" name="productDesc" rows="10" cols="30" placeholder="상품 설명을 입력해주세요."></textarea>
							                </div>
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>				
										
											<!-- 경매 상품 미리보기-->
											<div class="col-lg-3">
							                	<div class="section-title product__discount__title" style="margin-top: 30px;">
								                	<h2>미리보기</h2>
								                </div>>
							                </div>
							                <div class="row">
			                                    <div class="col-lg-6 col-md-6">
								                    <div class="product__details__pic">
								                        <div class="product__details__pic__item">
								                            <img class="product__details__pic__item--large"
								                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${imgPathList[0]}" alt="">
								                        </div>
								                        <div class="product__details__pic__slider owl-carousel">
								                        	<c:forEach var="img" items="${imgPathList}">
								                        		<img data-imgbigurl="${pageContext.request.contextPath}/template/img/applyProductImg/${img}"
								                                src="${pageContext.request.contextPath}/template/img/applyProductImg/${img}" alt="">
								                        	</c:forEach>
								                        </div>
								                    </div>
								                </div>
								                <div class="col-lg-6 col-md-6">
								                    <div class="product__details__text">
								                        <h3>${productDetail.productName}</h3>
								                        <div class="product__details__rating">
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star"></i>
								                            <i class="fa fa-star-half-o"></i>
								                            <span>(18 reviews)</span>
								                        </div>
								                        <div class="product__details__price">${productDetail.price}</div>
								                        <p>${productDetail.productDesc}</p>
								                        <a href="#" class="primary-btn" style="margin-top: 3px;">호가 : ${productDetail.quote}</a>
								                        <div class="heart-btn">
													      <div class="content">
													        <span class="heart"></span>
													        <span class="text">Like</span>
													      </div>
													    </div>
								                        <ul>
								                            <li><b>판매자</b> <span>${productDetail.userName}</span></li>
								                            <li><b>상품 카테고리</b> <span>${productDetail.categorySubName}</span></li>
								                            <li><b>현재 입찰가</b> <span>${productDetail.price}</span></li>
								                            <li><b>Share on</b>
								                                <div class="share">
								                                    <a href="#"><i class="fa fa-facebook"></i></a>
								                                    <a href="#"><i class="fa fa-twitter"></i></a>
								                                    <a href="#"><i class="fa fa-instagram"></i></a>
								                                    <a href="#"><i class="fa fa-pinterest"></i></a>
								                                </div>
								                            </li>
								                        </ul>
								                    </div>
								                </div>
			                                    </div>
							                
							                <div class="col-lg-12" style="margin-bottom: 15px;"><hr style="border: solid 1px lightgrey;"></div>	
							                
							                <div class="col-lg-12" style="text-align: right;">
							                	<button  id="summitBtn" class="summitBtn" type="button">등록하기</button>
							                </div>
							                
										</div>
									</form>
								</div>
								<!-- Product Details Section Begin -->
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 스펙</h6>
                                    <p>
                                    	<table class="table table-light">
                                    		<tr>
                                    			<th>판매자 구입가격</th>
                                    			<td></td>
                                    		</tr>
                                    		<tr>
                                    			<th>판매자 사용기한</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    	<hr>	
                                    	<table class="table table-dark">	
                                    		<tr>
                                    			<th>현재 최저가</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    	<hr>	
                                    	<table class="table table-light">	
                                    		<tr>
                                    			<th>현재 최저가</th>
                                    			<td></td>
                                    		</tr>
                                    	</table>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 확인 직원 : ${productDetail.managerName} 후기</h6>
                                    <p> comment</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

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
      $(document).ready(function(){
        $('.content').click(function(){
          $('.content').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
      });
    </script>
</body>

</html>