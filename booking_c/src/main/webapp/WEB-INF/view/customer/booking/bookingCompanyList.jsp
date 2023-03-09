<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booking Company Search</title>
	
	<!-- css headCore -->
	<jsp:include page="/WEB-INF/view/customer/booking/inc/headCore.jsp"></jsp:include>
</head>
<body>
	<div id="page">
		<header class="header menu_fixed">
			<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
			<div id="logo">
				<a href="index.html">
					<img src="${pageContext.request.contextPath}/resources/img/logo.svg" width="150" height="36" alt="" class="logo_normal">
					<img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
				</a><br>
				<!-- 임시메뉴 -->
				<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
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
			<section class="hero_in restaurants">
				<div class="wrapper">
					<div class="container">
						<h1 class="fadeInUp"><span></span>예약 업체 검색</h1>
					</div>
				</div>
			</section>
			<!--/hero_in-->
			
			<div class="filters_listing sticky_horizontal">
				<div class="container">
					
				</div>
				<!-- /container -->
			</div>
			<!-- /filters -->
			
			<div class="collapse" id="collapseMap">
				<div id="map" class="map"></div>
			</div>
			<!-- End Map -->
	
			<!-- 예약업체 검색 -->
			<div class="container margin_60_35">
				<div class="col-lg-12">
					<div class="row g-0 custom-search-input-2 inner">
						<div class="col-lg-5">
							<form action="${pageContext.request.contextPath }/customer/booking/bookingCompanyList" method="get">
								<select class="wide" name="optionWord">
									<option value="">부가 서비스 선택</option>
									<option value="주차가능">주차가능</option>
									<option value="제로페이">제로페이</option>
									<option value="포장">포장</option>
									<option value="배달">배달</option>
									<option value="단체석">단체석</option>
								</select>
								</div>
								<div class="col-lg-5">
									<div class="form-group">
										<i class="icon_search"></i>
										<input class="form-control" type="text" name="searchWord" value="${searchWord }" placeholder="업체 이름 or 업종 검색">
									</div>
								</div>
								
								<div class="col-lg-2">
									<input type="submit" class="btn_search" value="Search">
								</div>
							</form>
					</div>
					<!-- /row -->
				</div>
				
				<!-- 예약업체 리스트 -->
				<c:forEach var="bkc" items="${bookingCompanyList }">
					<!-- /custom-search-input-2 -->
					<div class="isotope-wrapper">
						<div class="box_list isotope-item popular">
							<div class="row g-0">
								<div class="col-lg-5">
									<figure style="height:100%">
										<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkc.bkcId}&bkciLevel=${bkc.bkciLevel}">
											<img src="${pageContext.request.contextPath}/resources/img/testPic.jpg" class="img-fluid" alt="" width="800" height="10000"><div class="read_more"><span>업체 세부정보</span></div></a>
									</figure>
								</div>
								<div class="col-lg-7">
									<div class="wrapper">
										<a href="#0" class="wish_bt"></a>
										<h3><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkc.bkcId}&bkciLevel=${bkc.bkciLevel}">${bkc.bkcName }</a></h3>
										<p>
											Business Status : ${bkc.bkcRunning}<br>
											Open Time : ${bkc.bkcOpen }<br>
											Close Time : ${bkc.bkcClose}<br>
											Category : ${bkc.bkcdType }<br>
											Additional Service : ${bkc.bkcdAddService }<br>
											<span class="price">Star Rating : <strong> ${bkc.rvRating }</strong> /5</span><br>
										</p>
										<table style="text-align:center">
											<tr>
												<th>Review Picture</th>
												<th style="width:500px">Review Comment</th>
											</tr>
											<tr>
												<td><img src="${pageContext.request.contextPath}/resources/img/testPic.png" class="img-fluid"  width="100" height="100"></td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bkc.rvMemo }</td>
											</tr>
										</table>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
							
				<!-- 페이징 -->
				<div style="text-align:center">
					<c:if test="${currentPage == 1}">
						<span>[처음으로]</span>
						<span>[이전페이지]</span>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=1&searchWord=${searchWord}&optionWord=${optionWord}">[처음으로]</a>
						<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${currentPage-1}&searchWord=${searchWord}&optionWord=${optionWord}">[이전 페이지]</a>
					</c:if>
						<span>[ ${currentPage } ]</span>
					<c:if test="${currentPage == lastPage}">
						<span>[다음페이지]</span>
						<span>[마지막으로]</span>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${currentPage+1}&searchWord=${searchWord}&optionWord=${optionWord}">[다음 페이지]</a>
						<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${lastPage}&searchWord=${searchWord}&optionWord=${optionWord}">[끝으로]</a>
					</c:if>
				</div>
			</div>
			
			
			<!-- /container -->
			<div class="bg_color_1">
				<div class="container margin_60_35">
					<div class="row">
						<div class="col-md-4">
							<a href="#0" class="boxed_list">
								<i class="pe-7s-help2"></i>
								<h4>Need Help? Contact us</h4>
								<p>Cum appareat maiestatis interpretaris et, et sit.</p>
							</a>
						</div>
						<div class="col-md-4">
							<a href="#0" class="boxed_list">
								<i class="pe-7s-wallet"></i>
								<h4>Payments and Refunds</h4>
								<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>
							</a>
						</div>
						<div class="col-md-4">
							<a href="#0" class="boxed_list">
								<i class="pe-7s-note2"></i>
								<h4>Quality Standards</h4>
								<p>Hinc vituperata sed ut, pro laudem nonumes ex.</p>
							</a>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bg_color_1 -->
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
			</div>
		</footer>
		<!--/footer-->
	</div>
	<!-- page -->
	
	<!-- Sign In Popup -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="small-dialog-header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-start">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
				<div class="text-center">
					Don’t have an account? <a href="register.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- css footerCore -->
	<jsp:include page="/WEB-INF/view/customer/booking/inc/footerCore.jsp"></jsp:include>


</body>
</html>