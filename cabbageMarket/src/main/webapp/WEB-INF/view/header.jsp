<!-- 작성자 : 강혜란 210707-->
<!-- 작성자 : 강혜란 210708-->
<!-- 수정자 : 김태훈 210708 직거래 a태그 href 경로 수정 -->
<!-- 수정자 : 이재범 210709 로그인 a태그 href 경로 수정, login시 session값 유지 -->
<!-- 수정자 : 이재범 210710 닉네임 a태그 회원정보로 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""></a>
        </div>
        <c:if test="${usersSession != null}">       	
	         <div class="header__top__right__auth">
	             <a href="${pageContext.request.contextPath}/users/userInfo"><i class="fa fa-user"></i>${usersSession.get("nickname")}</a>
	         </div>                
       		<div class="header__cart__price">
       			<a href="${pageContext.request.contextPath}/users/userPointHistory">
       				POINTS: ${usersSession.get("point")}
       				
       			</a>
       		</div>     
       		<a href="${pageContext.request.contextPath}/users/usersLogout">로그아웃</a>           
        </c:if>
        <c:if test="${usersSession == null}">      
	        <div class="humberger__menu__widget">
	            <div class="header__top__right__auth">
	                <a href="${pageContext.request.contextPath}/usersLogin"><i class="fa fa-user"></i> Login</a>
	            </div>
	        </div>
        </c:if>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/users/getDirectTradeList">직거래</a></li>
                <li><a href="${pageContext.request.contextPath}/users/getAuctionList">경매</a></li>
                <li><a href="${pageContext.request.contextPath}/users/getUsedProductList">중고거래</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->
    
     <!-- Header Section Begin -->
    <header class="header">
        
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/template/img/logo_CM.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/users/getDirectTradeList">직거래</a></li>
                            <li><a href="${pageContext.request.contextPath}/users/getAuctionList">경매</a></li>
                            <li><a href="${pageContext.request.contextPath}/users/getUsedProductList">중고거래</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-4">                  
                    <c:if test="${usersSession != null}">
                    	<div class="header__cart">
                    		<ul>
	                            <li>
		                            <div class="header__top__right__auth">
		                                <a href="${pageContext.request.contextPath}/users/userInfo"><i class="fa fa-user"></i>${usersSession.get("nickname")}</a>
		                            </div>
	                            </li>
	                            <li>
	                            	<div class="header__cart__price">
	                            		<a href="${pageContext.request.contextPath}/users/userPointHistory">
	                            			POINTS: ${usersSession.get("point")}
	                            		</a>
	                            	</div>
	                            </li>
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/users/usersLogout">로그아웃</a>
	                            </li>
	                        </ul>	                                  					
        					
        				</div>
        			</c:if>
        			<c:if test="${usersSession == null}">
	                    <div class="header__cart">
	                        <ul>
	                            <li>
	                            <div class="header__top__right__auth">
	                                <a href="${pageContext.request.contextPath}/usersLogin"><i class="fa fa-user"></i> Login</a>
	                            </div>
	                            </li>
	                        </ul>                       	                        
	                    </div>
                   </c:if>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
    