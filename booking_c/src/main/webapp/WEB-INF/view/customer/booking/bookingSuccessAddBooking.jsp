<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<!-- css headCore -->
	<jsp:include page="/WEB-INF/view/customer/booking/inc/headCore.jsp"></jsp:include>

       <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet">
	<title>Booking Complete </title>
</head>
<body>

<div id="page">
		
	<header class="header menu_fixed">
		<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Preload -->
		<div id="logo">
			<a href="index.html">
				<img src="img/logo.svg" width="150" height="36" alt="" class="logo_normal">
				<img src="img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
			</a>
		</div>
		<ul id="top_menu">
			<li><a href="cart-1.html" class="cart-menu-btn" title="Cart"><strong>4</strong></a></li>
			<li><a href="#sign-in-dialog" id="sign-in" class="login" title="Sign In">Sign In</a></li>
			<li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
		</ul>
		<!-- /top_menu -->
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
	<!-- /header -->
	
	<main>
		<div class="hero_in cart_section last">
			<div class="wrapper">
				<div class="container">
					<div class="bs-wizard clearfix">
						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">예약 사항 선택</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="javascript:window.history.go(-2);" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">결제</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="javascript:window.history.go(-1);" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum">결제완료</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>
					</div>
					<!-- End bs-wizard -->
				</div>
			</div>
		</div>
		
		<div class="bg_color_1">
				<div class="container margin_60_35">
					<div class="row">
						<div class="col-lg-12">
							<div class="box_cart">
							
								<div class="form_title">
									<h3> 예약 완료 </h3>
								</div>
								
								<div class="step">
									<table class="table cart-list" style="text-align: center">
										<tr>
											<c:forEach var="bkp" items="${bookingAfterProductImg }">
												<td>${bkp.bkpiSave }</td>
											</c:forEach>
										</tr>
									</table>
									<table class="table cart-list" style="text-align: center">	
										<tr>
											<td>상품명 </td>
											<td>${bkpName } </td>
										</tr>
										<tr>
											<td>옵션명 </td>
											<td>
												<c:forEach var="bkpoName" items="${bkpoName }">
													[${bkpoName }]
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>날짜 </td>
											<td>${dates } </td>
										</tr>
										<tr>
											<td>인원 </td>
											<td>${bookingPeople }명</td>
										</tr>
										<tr>
											<td>결제금액 </td>
											<td>${finalCount } 원</td>
										</tr>
										<tr>
											<td colspan="2">
												<a href="${pageContext.request.contextPath}/customer/booking/bookingCompanyList">메인으로 가기&nbsp;&nbsp;&nbsp;</a>
												<a href="${pageContext.request.contextPath}/customer/booking/bookingList">예약 내역 보러가기</a>
											</td>
										</tr>
									</table><br>
								</div>
								<hr>
								<!--End step -->
							</div>
						</div>
						<!-- /col -->
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
		<!--/hero_in-->
	</main>
	<!--/main-->
	
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 pe-5">
					<p><img src="img/logo.svg" width="150" height="36" alt=""></p>
					<p>Mea nibh meis philosophia eu. Duis legimus efficiantur ea sea. Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu. Nihil facilisi indoctum an vix, ut delectus expetendis vis.</p>
					<div class="follow_us">
						<ul>
							<li>Follow us</li>
							<li><a href="#0"><i class="ti-facebook"></i></a></li>
							<li><a href="#0"><i class="ti-twitter-alt"></i></a></li>
							<li><a href="#0"><i class="ti-google"></i></a></li>
							<li><a href="#0"><i class="ti-pinterest"></i></a></li>
							<li><a href="#0"><i class="ti-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 ms-lg-auto">
					<h5>Useful links</h5>
					<ul class="links">
						<li><a href="about.html">About</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="blog.html">News &amp; Events</a></li>
						<li><a href="contacts.html">Contacts</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Contact with Us</h5>
					<ul class="contacts">
						<li><a href="tel://61280932400"><i class="ti-mobile"></i> + 61 23 8093 3400</a></li>
						<li><a href="mailto:info@Panagea.com"><i class="ti-email"></i> info@Panagea.com</a></li>
					</ul>
					<div id="newsletter">
					<h6>Newsletter</h6>
					<div id="message-newsletter"></div>
					<form method="post" action="phpmailer/newsletter_template_email.php" name="newsletter_form" id="newsletter_form">
						<div class="form-group">
							<input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
							<input type="submit" value="Submit" id="submit-newsletter">
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--/row-->
			<hr>
			<div class="row">
				<div class="col-lg-6">
					<ul id="footer-selector">
						<li>
							<div class="styled-select" id="lang-selector">
								<select>
									<option value="English" selected>English</option>
									<option value="French">French</option>
									<option value="Spanish">Spanish</option>
									<option value="Russian">Russian</option>
								</select>
							</div>
						</li>
						<li>
							<div class="styled-select" id="currency-selector">
								<select>
									<option value="US Dollars" selected>US Dollars</option>
									<option value="Euro">Euro</option>
								</select>
							</div>
						</li>
						<li><img src="img/cards_all.svg" alt=""></li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul id="additional_links">
						<li><a href="#0">Terms and conditions</a></li>
						<li><a href="#0">Privacy</a></li>
						<li><span>© Panagea</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	</div>
	<!-- page -->

	<!-- COMMON SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>


















<h1>결제 성공</h1>
<!-- 임시메뉴 -->
	<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include><br><br>
	
	<table border="1">
		<tr>
			<c:forEach var="bkp" items="${bookingAfterProductImg }">
				<td>${bkp.bkpiSave }</td>
			</c:forEach>
		</tr>
	</table>
	<table border="1">	
		<tr>
			<td>상품명 </td>
			<td>${bkpName } </td>
		</tr>
		<tr>
			<td>옵션명 </td>
			<td>
				<c:forEach var="bkpoName" items="${bkpoName }">
					[${bkpoName }]
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>날짜 </td>
			<td>${dates } </td>
		</tr>
		<tr>
			<td>인원 </td>
			<td>${bookingPeople } </td>
		</tr>
		<tr>
			<td>결제금액 </td>
			<td>${finalCount } 원</td>
		</tr>
	</table><br>
	<a href="${pageContext.request.contextPath}/customer/booking/bookingCompanyList">메인으로 가기</a>
	<a href="${pageContext.request.contextPath}/customer/booking/bookingList">예약 내역 보러가기</a>
</body>
</html>