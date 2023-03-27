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
				<li><a href="cart-1.html" class="cart-menu-btn" title="Cart"><strong>4</strong></a></li>
				<li><a href="#sign-in-dialog" id="sign-in" class="login" title="Sign In">Sign In</a></li>
				<li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
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
					<li><span><a href="#0">Home</a></span>
						<ul>
							<li><a href="index.html">Home Default</a></li>
							<li>
								<span><a href="#0">Sliders - Parallax</a></span>
								<ul>
									<li><a href="index-11.html">Revolution Slider 1</a></li>
									<li><a href="index-18.html">Revolution Slider 2</a></li>
									<li><a href="index-2.html">Flex Slider</a></li>
									<li><a href="index-4.html">Layer Slider</a></li>
									<li><a href="index-12.html">Parallax Youtube</a></li>
									<li><a href="index-13.html">Parallax Vimeo</a></li>
									<li><a href="index-14.html">Parallax Mp4 Video</a></li>
									<li><a href="index-15.html">Parallax Video Fullscreen</a></li>
									<li><a href="index-16.html">Parallax Image</a></li>
								</ul>
							</li>
							<li><a href="index-19.html">KenBurns Slider <strong class="badge text-bg-danger">New!</strong></a></li>
							<li><a href="index-17.html">Text Rotator</a></li>
							<li><a href="index-3.html">Video Fallback Mobile</a></li>
							<li><a href="index-5.html">Search 2</a></li>
							<li><a href="index-10.html">Search 3 <strong class="badge text-bg-danger">New!</strong></a></li>
							<li><a href="index-7.html">Search 4</a></li>
							<li><a href="index-6.html">GDPR (EU law)</a></li>
	                        <li><a href="index-8.html">Address Autocomplete</a></li>
	                        <li><a href="index-9.html">Home AirBnb</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
	</body>
</html>