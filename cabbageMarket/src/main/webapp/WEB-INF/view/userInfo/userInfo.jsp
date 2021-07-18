<!-- 작성자 : 이재범 -->
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
    <title>userInfo</title>

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
                        <h2>회원정보</h2>
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
                                <li><a href="${pageContext.request.contextPath}/users/userInfo">회원정보</a></li>
								<li><a href="${pageContext.request.contextPath}/users/registedProduct">등록상품</a></li>
								<li><a href="${pageContext.request.contextPath}/users/userPointHistory">포인트 사용 조회</a></li>
								<li><a href="${pageContext.request.contextPath}/users/buyingList">구매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/biddingList">입찰 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/myProductManagement">내 상품 관리</a></li>
								<li><a href="${pageContext.request.contextPath}/users/shippingAddress">배송지 관리</a></li>
                            </ul>
                        </div>                                                                  
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>회원 정보</h2>                                                    
                        </div>
                        <div>                                                  	                             
							<!-- /Breadcrumb -->								
							<div class="row gutters-sm">
							  <div class="col-md-5 mb-3">
							    <div class="card">
							      <div class="card-body">
							        <div class="d-flex flex-column align-items-center text-center">
							          <img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt="Admin" class="rounded-circle" width="150">
							          <div class="mt-3">
							            <h4><b>${nickname}</b></h4>
							          </div>
							        </div>
							      </div>
							    </div>
							    <div class="card mt-3">
							      <ul class="list-group list-group-flush">
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0">등록 상품 수</h6>
							          <span class="text-secondary">https://bootdey.com</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0">구매 내역 수</h6>
							          <span class="text-secondary">bootdey</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0">미등록 상품 수</h6>
							          <span class="text-secondary">@bootdey</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0">내 배송지 수</h6>
							          <span class="text-secondary">bootdey</span>
							        </li>
							      </ul>
							    </div>
							  </div>
							  <div class="col-md-7">
							    <div class="card">
							      <div class="card-body">
							        <div class="row">
							          <div class="col-sm-3">
							            <h6 class="mb-0"><b>이름</b></h6>
							          </div>
							          <div class="col-sm-9 text-secondary">
							            ${username}
							          </div>
							        </div>
							        <hr>
							        <div class="row">
							          <div class="col-sm-3">
							            <h6 class="mb-0"><b>Email</b></h6>
							          </div>
							          <div class="col-sm-9 text-secondary">
							            ${email}
							          </div>
							        </div>
							        <hr>
							        <div class="row">
							          <div class="col-sm-3">
							            <h6 class="mb-0"><b>Phone</b></h6>
							          </div>
							          <div class="col-sm-9 text-secondary">
							            ${mobile}
							          </div>
							        </div>
							        <hr>
							        <div class="row">
							          <div class="col-sm-3">
							            <h6 class="mb-0"><b>가입날짜</b></h6>
							          </div>
							          <div class="col-sm-9 text-secondary">
							            ${createDate}
							          </div>
							        </div>
							        <hr>
							        <div class="row">
							          <div class="col-sm-3">
							            <h6 class="mb-0"><b>SNS</b></h6>
							          </div>
							          <div class="col-sm-9 text-secondary">
							            ${snsType}
							          </div>
							        </div>
							        <hr>
							        <div class="row">
							          <div class="col-sm-12">
							            <a class="btn btn-success" href="${pageContext.request.contextPath}/users/modifyUsers?userId=${userId}">수정</a>
							            <a class="btn btn-success" href="${pageContext.request.contextPath}/users/removeUsers?userId=${userId}">탈퇴</a>
							          </div>
							        </div>
							      </div>
							    </div>							    
					      </div>
					    </div>
					  </div>
					</div>                              
                </div>
                           
                        </div>
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