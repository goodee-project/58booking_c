<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<!-- css headCore -->
	<jsp:include page="/WEB-INF/view/customer/booking/inc/headCore.jsp"></jsp:include>

    <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>
       <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet">
</head>
<body>
	
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
		<div class="hero_in cart_section">
			<div class="wrapper">
				<div class="container">
					<div class="bs-wizard clearfix">
						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">Your cart</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="cart-1.html" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum">Payment</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step disabled">
							<div class="text-center bs-wizard-stepnum">Finish!</div>
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
		<!--/hero_in-->

		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<div class="box_cart">
						
						<div class="form_title">
							<h3>Your Details</h3>
						</div>
						<div class="step">
							<form action="${pageContext.request.contextPath}/customer/booking/addBooking" method="post" id=paymentForm>
								<input type="hidden" name="customerId" value="${loginCustomer.customerId }">
								<input type="hidden" name="bkcId" value="${bookingPaymentCompany.bkcId}">
								<input type="hidden" name="dates" value="${dates}">
								<input type="hidden" name="bkpNo" value="${bkpNo }">
								<input type="hidden" name="bkpPrice" value="${bkpPrice }">
								<input type="hidden" name="bkpRankDiscount" value="${bkpPrice -  rankDiscount}">
								<input type="hidden" name="bookingPeople" value="${qtyInput }">
								<input type="hidden" name="option" value="${option }" id="option">
								<input type="hidden" name="optionSize" value="${optionSize }">
								<input type="hidden" name="havePoint" value="${loginCustomer.customerPoint}">
								<input type="hidden" name="bkpName" value="${bkpName }">
								
								
								<c:if test="${bookingDayList != null}">
									<input type="hidden" name="productTime" value="00:00:00" id="productTime">
									<c:forEach var="dayList" items="${bookingDayList}">
										<input type="hidden" name="dayList" value="${dayList.selecteDate }"><br>
									</c:forEach>
								</c:if>
								<c:if test="${bookingDayList == null}">
									<span>dates</span>
									<input type="hidden" name="dayList" value="${dates }">
									<input type="hidden" name="productTime" value="${productTime }" id="productTime">
								</c:if>
								
								<span>${bkpName } 결제 상세페이지 </span><br>
								<span>날짜 : ${dates}</span><br>
								<c:if test="${productTime != ''}">
									<span>시간 : ${productTime}</span><br>
								</c:if>
								<span>인원 : ${qtyInput }</span><br>
								<span>상품가격 : ${bkpPrice }원 </span><br>
								<span>선택 옵션</span><br>
								
						
									<c:forEach var="tbkpoNo" items="${bookingOptionList }" varStatus="status">
											<c:forEach var="bkpoNo" items="${option }" varStatus="status">
													<c:if test="${tbkpoNo.optionNo ==bkpoNo }">
														- ${tbkpoNo.optionName}<br>
														<input type="hidden" name="bkpoNo" value="${bkpoNo }">
														<input type="hidden" name="bkpoName" value="${tbkpoNo.optionName}">
													</c:if>
											</c:forEach>
									</c:forEach>		
							
								
								<span>총 옵션 가격 : ${optionPrice}원 </span><br><br><br>
								
								<span>기업명 : ${bookingPaymentCompany.bkcName}</span><br>
								<span>사업자번호 : ${bookingPaymentCompany.bkcNumber}</span><br>
								<span>전화번호 : ${bookingPaymentCompany.bkcPhone}</span><br>
								<span>주소 : ${bookingPaymentCompany.bkcAddress}</span><br><br><br>
								
								<span>예약자 정보</span><br>
								<span>예약자 : ${loginCustomer.customerName }</span><br>
								<span>전화번호 : ${loginCustomer.customerPhone }</span><br>
								<span>이메일 : ${loginCustomer.customerEmail }</span><br><br><br>
								
								<span>결제</span><br>
								<span>등급 할인받은 금액 : ${bkpPrice -  rankDiscount}</span><br>
								<span>상품금액 : ${rankDiscount +  optionPrice}원 </span><br>
								<span>보유 포인트 : ${loginCustomer.customerPoint}P</span><br>
								<span>사용 포인트 : <input type="text" name="point" id="point" value="0">P &nbsp;
											<button type="button" id="pointBtn">사용</button>	
								</span><br>
								<span>회원등급 : ${loginCustomer.customerRank} </span><br>
								<span>페이잔액 : ${loginCustomer.customerPay}P 
										<button type="button" class="btn_1" id="payBtn">충전하기</button>
								</span><br>
								
								<span>총결제 금액 : 
										<input type="text" name="finalCount" id="finalCount" value="${rankDiscount +  optionPrice}">원 
								</span><br>
								
								<button type="button" id="paymentBtn">예약하기</button>
							</form>
						</div>
						<hr>
						<!--End step -->


						<!--End step -->

						

						<hr>
						<!--End step -->
					
						</div>
					</div>
					<!-- /col -->
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail">
							<div id="total_cart">
								총결제 금액 <br><br>
								<input type="text" name="finalCount" id="finalCount" value="${rankDiscount +  optionPrice}" >원
							</div>
							<ul class="cart_details">
								<li>등급 할인받은 금액 <span> ${bkpPrice -  rankDiscount}</span></li>
								<li>상품금액 <span>${rankDiscount +  optionPrice}원</span></li>
								<li>보유 포인트 <span>${loginCustomer.customerPoint}P</span></li>
								<li>사용 포인트 <span><input type="text" name="point" id="point" value="0">&nbsp;P&nbsp;&nbsp;&nbsp;<button type="button" id="pointBtn">사용</button></span></li><br>
								<li>회원등급 <span> ${loginCustomer.customerRank} </span></li>
								<li>페이잔액 <span>${loginCustomer.customerPay}P&nbsp;&nbsp;&nbsp;<button type="button" id="payBtn">충전하기</button></span></li>
							</ul>
							<a href="cart-3.html" class="btn_1 full-width purchase">예약하기</a>
						</div>
					</aside>
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
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
  
</body>
</html>