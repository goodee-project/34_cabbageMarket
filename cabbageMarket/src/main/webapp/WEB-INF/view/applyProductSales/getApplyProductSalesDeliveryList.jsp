<!-- 작성자 : 김태훈 -->
<!-- 수정 : 강혜란 210712 http://localhost/cabbageMarket/users/getApplyProductSalesDeliveryList?userId=3 -->
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
                        <h2>배송확인 리스트</h2>
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
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Colors</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>Popular Size</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Large
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Medium
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Small
                                    <input type="radio" id="small">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-lg-9 col-md-7">

                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">최근 등록순</option>
                                        <option value="0">마감 임박순</option>
                                        <option value="0">금액 고가순</option>
                                        <option value="0">금액 저가순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>총<span>${lastPage}</span>개 상품</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                     <!-- Shoping Cart Section Begin -->
				    <section class="shoping-cart spad">
				        <div class="container">
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="shoping__cart__table">
				                        <table>
				                            <thead>
				                                <tr>
				                                	<th>#</th>
				                                    <th colspan="3" class="shoping__product">Products</th>
				                                    <th colspan="2">등록</th>
				                                    <th>환송</th>
				                                </tr>
				                            </thead>
				                            
				                            <tbody>
				                            	<c:forEach var="apsdl" items="${applyProductSalesDeliveryList}">
				                                <tr>
				                                	<td>
				                                		${apsdl.applyProductSalesDeliveryId}#
				                                	</td>
				                                    <td class="shoping__cart__item">
				                                        <img src="${pageContext.request.contextPath}/template/img/applyProductImg/${apsdl.imgName}" alt="">
				                                    </td> <!-- colsapn 1 -->
				                                    <td>
				                                    	<h6><span>(${apsdl.categorySubName})</span></h6>
				                                    </td> <!-- colsapn 2 -->
				                                    <td>
				                                    	<h5><a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${apsdl.directTradeProductRegistrationId}">${apsdl.productName}</a></h5>
				                                    </td> <!-- colsapn 3 -->
				                                    <td>
				                                    	<c:if test="${apsdl.registrationState == '9등록가능'}">
					                                        <a href="${pageContext.request.contextPath}/users/addAuction?applyId=${apsdl.applyProductSalesDeliveryId}" class="primary-btn cart-btn cart-btn-right">경매등록</a>
				                                        </c:if>
				                                        <c:if test="${apsdl.registrationState != '9등록가능'}">
					                                        <span>심사중</span>
				                                        </c:if>
				                                    </td>
				                                    <td>
				                                    	<c:if test="${apsdl.registrationState == '9등록가능'}">
					                                        <a href="#" class="primary-btn cart-btn cart-btn-right">증고등록</a>
				                                        </c:if>
				                                    </td>
				                                    <td class="shoping__cart__item__close">
				                                        <span class="icon_loading"></span>
				                                        <span class="icon_close"></span>
				                                    </td>
				                                </tr>
				                                </c:forEach>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
				            </div>
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="shoping__cart__btns">
				                        <a href="${pageContext.request.contextPath}/users/addApplyProductSalesDelivery" class="primary-btn cart-btn">추가로 안전거래 신청</a>
				                    </div>
				                </div>
				                
				               
				            </div>
				        </div>
				    </section>
				    <!-- Shoping Cart Section End -->
                    
               
                    <!-- 페이징 -->
                    <div class="product__pagination">
                    	
                    	<c:if test="${currentPage > 1}">
				            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${currentPage-1}&searchWord=${searchWord}">
				            	<i class="fa fa-long-arrow-left"></i>
				            </a>
				        </c:if>
				        
				        <c:forEach var="i" begin="1" end="10">
							<c:if test="${(pageSet*10)+i < lastPage+1}">
					            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${(pageSet*10)+i}">
									${(pageSet*10)+i}
								</a>
							</c:if>
						</c:forEach>
		
				        <c:if test="${currentPage < lastPage}">
				            <a href="${pageContext.request.contextPath}/users/getDirectTradeList?currentPage=${currentPage+1}&searchWord=${searchWord}">
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