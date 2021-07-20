<!-- 작성자: 김희진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>cabbageMarket UsedProduct</title>
	
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
	
	<style>
	.form-control:focus {
	  box-shadow: none;
	}
	
	.form-control-underlined {
	  border-width: 0;
	  border-bottom-width: 1px;
	  border-radius: 0;
	  padding-left: 0;
	}
	
	.form-control::placeholder {
	  font-size: 0.9rem;
	  color: #aaa;
	  font-style: italic;
	}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	   
		$.ajax({
		   type:'get',
		   url:'${pageContext.request.contextPath}/getCategoryMain',
		   
		   success: function(jsonData) {
		      $(jsonData).each(function(index, item) {
		     	 console.log(item.categoryMainName);
		         $('#categoryMain').append(
		            '<li value="'+item.categoryMainId+'"><a href="./shop-details.html">'+item.categoryMainName+'</a></li>'
		         );
		      });
		   }
		});
		
		$('#btn').click(function(){
			console.log('btn click!!')
			$('#searchForm').submit();
		})
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
                        <h2>중고 상품</h2>
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

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>CATEGORY</h4>
                            <ul class="categoryMain" id="categoryMain" name="categoryMain"></ul>	   
                        </div>
                        
                        <br><br><br>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="0" end="2">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${usedProductList[i].applyId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${usedProductList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                            	<c:if test="${usedProductList[i].productName.length() > 9}">
	                                            		<h6>${usedProductList[i].productName.substring(0,8)}..</h6>
	                                            	</c:if>
	                                            	<c:if test="${usedProductList[i].productName.length() <= 9}">
	                                            		<h6>${usedProductList[i].productName}</h6>
	                                            	</c:if>
	                                                <span>${usedProductList[i].productPrice}</span>
	                                            </div>
	                                        </a>
										</c:forEach>
                                    </div>
                                    
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="3" end="5">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${usedProductList[i].applyId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${usedProductList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <c:if test="${usedProductList[i].productName.length() > 9}">
	                                            		<h6>${usedProductList[i].productName.substring(0,8)}..</h6>
	                                            	</c:if>
	                                            	<c:if test="${usedProductList[i].productName.length() <= 9}">
	                                            		<h6>${usedProductList[i].productName}</h6>
	                                            	</c:if>
	                                                <span>${usedProductList[i].productPrice}</span>
	                                            </div>
	                                        </a>
										</c:forEach>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                        
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__sort">
                                    <select>
                                    	<option value="0">최근등록순</option>
                                        <option value="0">낮은가격순</option>
                                        <option value="0">높은가격순</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>Total Products<span>&nbsp;${usedProductTotal}</span></h6>
                                </div>
                            </div>
                            
                            <!-- search 검색 -->
                            <form id="searchForm" action="${pageContext.request.contextPath}/users/getUsedProductList" method="get" class="col-lg-4 col-md-4">
	                             <div class="input-group mb-4 border rounded-pill p-1">
		            				<input id="search" type="search" name="searchWord" aria-describedby="button-addon1" class="form-control bg-none border-0" placeholder="search">
						           	<div class="input-group-append border-0">
						            	<button id="btn" type="button" class="btn btn-link text-success"><i class="fa fa-search"></i></button>
						            </div>
						         </div>
				        	</form>
				        	
                        </div>
                    </div>
                    <br>
                    <div class="row">
                    	<c:forEach var="upl" items="${usedProductList}">
	                    	<div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/template/img/applyProductImg/${upl.imgName}">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                	<span style="font-size: 14px; color: #b2b2b2; display: block; margin-bottom: 4px;">${upl.categorySubName}</span>
	                                    <h6><a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${upl.applyId}">${upl.productName}</a></h6>
	                                    <h5><span><fmt:formatNumber value="${upl.productPrice}" pattern="#,###" /></span></h5>
	                                </div>
	                            </div>
	                        </div>
                    	</c:forEach>
                    </div>
                    
                    <!-- 페이징 -->
                    <div class="product__pagination">
                    	<c:if test="${currentPage > 1}">
				            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${currentPage-1}&searchWord=${searchWord}">
				            	<i class="fa fa-long-arrow-left"></i>
				            </a>
				        </c:if>
 						<c:forEach var="i" begin="1" end="10">
							<c:if test="${(pageSet*10)+i < lastPage+1}">
					            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${(pageSet*10)+i}">
									${(pageSet*10)+i}
								</a>
							</c:if>
						</c:forEach>
				        <c:if test="${currentPage < lastPage}">
				            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${currentPage+1}&searchWord=${searchWord}">
				            	<i class="fa fa-long-arrow-right"></i>
				            </a>
				        </c:if>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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