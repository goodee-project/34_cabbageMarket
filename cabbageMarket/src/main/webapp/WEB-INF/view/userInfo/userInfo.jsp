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
                                <li><a href="#">등록상품</a></li>
                                <li><a href="#">포인트 사용 조회</a></li>
                                <li><a href="#">구매 내역</a></li>
                                <li><a href="#">내 상품 관리</a></li>
                                <li><a href="#">채팅 관리</a></li>
                                <li><a href="#">배송지 관리</a></li>
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
							          <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
							          <span class="text-secondary">https://bootdey.com</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
							          <span class="text-secondary">bootdey</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
							          <span class="text-secondary">@bootdey</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
							          <span class="text-secondary">bootdey</span>
							        </li>
							        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
							          <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
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
							            <a class="btn btn-success" href="${pageContext.request.contextPath}/users/modifyUsers?userId=${userId}">Edit</a>
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