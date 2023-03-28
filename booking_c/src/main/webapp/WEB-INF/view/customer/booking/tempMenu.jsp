<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> </title>
	</head>
	<body>
		<header class="header menu_fixed">
			<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
			<div id="logo">
				<a href="index.html">
					<img src="${pageContext.request.contextPath}/resources/img/logo.svg" width="150" height="36" alt="" class="logo_normal">
					<img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
				</a><br>
			</div>
			<ul id="top_menu">
				<li><a href="${pageContext.request.contextPath}/log/loginCustomer" id="sign-in" class="login" title="Sign In">Sign In</a></li>
			</ul>
			<a href="#menu" class="btn_mobile">
				<div class="hamburger hamburger--spin" id="hamburger">
					<div class="hamburger-box">
						<div class="hamburger-inner"></div>
					</div>
				</div>
			</a>
			<nav id="menu" class="main-menu">
				<ul>
					<li><span><a href="#0">메뉴</a></span>
						<ul>
							<li><a href="${pageContext.request.contextPath}/log/loginCustomer">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/customer/myPage/myPageMain">마이 페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/customer/booking/bookingCompanyList">예약 업체 검색</a></li>
							<li><a href="${pageContext.request.contextPath}/log/addCustomer">회원가입</a></li>
							<li><a href="${pageContext.request.contextPath}/customer/logout">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
	</body>
</html>