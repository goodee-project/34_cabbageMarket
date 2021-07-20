<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="template/cabbage.ico"> 
    <link rel="icon" href="template/cabbage_CM.ico">   
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/sellIndexStyle.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- Humberger End -->


    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="hero__categories header__menu">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">가전</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">계절가전</a></li>
                                    <li><a href="./shoping-cart.html">주방가전</a></li>
                                    <li><a href="./checkout.html">생활가전</a></li>
                                    <li><a href="./blog-details.html">미용/욕실가전</a></li>
                                </ul>
                            </li>
                            <li><a href="#">TV</a></li>
                            <li><a href="#">컴퓨터</a></li>
                            <li><a href="#">노트북</a></li>
                            <li><a href="#">태블릿</a></li>
                            <li><a href="#">모바일</a></li>
                            <li><a href="#">디지털 카메라</a></li>
                            <li><a href="#">음향기기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    모든 카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="무엇이 필요하신가요?">
                                <button type="submit" class="site-btn">찾기</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <a href="#"><i class="fa fa-heart"></i> <span>판매하기</span></a>
                            </div>
                            <div class="hero__search__phone__icon">
                               <a href="#"><i class="fa fa-shopping-bag"></i> <span>내 상점</span></a>
                            </div>
                            <div class="hero__search__phone__icon">
					            <a href="#"><i class="fa fa-comment-o"></i> <span>배추톡</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" style="height: 600px; width: 1500px; padding-left: 0;">                    
                    
                        <div class = "container2">
							<div class = "card">
								<div class ="box">
									<div class ="content">
										<h3>직거래 상품 등록</h3><br>
										<p style="al">상품을 등록하면 다른 회원이 상품을 보고 채팅을 시도합니다. 이후 구두예약을 통해 거래합니다.</p>
										 <a href="${pageContext.request.contextPath}/users/addDirectTrade">상품 등록</a>
									</div>
								</div>
							</div>
							
							<div class = "card">
								<div class ="box">
									<div class ="content">
										<h3>상품 배송 신청</h3><br>
										<p>안전 거래 중고거래, 경매거래를 이용하기 위해서는 본사에 상품을 보낸 후 검증을 받은 뒤에 중고거래, 경매거래로 등록할 수 있습니다.</p>
										 <a href="${pageContext.request.contextPath}/users/addApplyProductSalesDelivery">배송 신청</a>
									</div>
								</div>
							</div>
							
							<div class = "card">
								<div class ="box">
									<div class ="content">
										<h3>중고,경매 상품 등록</h3><br>
										<p>검증받은 상품을 중고거래, 경매거래로 등록할 수 있습니다.</p>

										 <a href="${pageContext.request.contextPath}/users/myProductManagement">상품 등록</a>

										 <a href="${pageContext.request.contextPath}/users/getApplyProductSalesDeliveryList">상품 등록</a>
									</div>
								</div>
							</div>
						</div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">

        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
       
    </section>
    <!-- Blog Section End -->

    <!-- Banner Begin -->
    <div class="banner">
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
    </section>
    <!-- Latest Product Section End -->



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