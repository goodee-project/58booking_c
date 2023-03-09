<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">

    <title>Booking Company Search</title>
</head>

<body>
	
	<div id="page">
		<header class="header menu_fixed">
			<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
			<div id="logo">
				<a href="index.html">
					<img src="${pageContext.request.contextPath}/resources/img/logo.svg" width="150" height="36" alt="" class="logo_normal">
					<img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
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
	
			<div class="container margin_60_35">
				<div class="col-lg-12">
					<div class="row g-0 custom-search-input-2 inner">
						<div class="col-lg-5">
							<select class="wide">
								<option>부가서비스</option>	
								<option>Restaurants</option>
								<option>Bars</option>
								<option>Coffee Bars</option>
							</select>
						</div>
						<div class="col-lg-5">
							<div class="form-group">
								<i class="icon_search"></i>
								<input class="form-control" type="text" placeholder="업체 이름 or 업종 검색">
							</div>
						</div>
						
						<div class="col-lg-2">
							<input type="submit" class="btn_search" value="Search">
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /custom-search-input-2 -->
				<div class="isotope-wrapper">
					<div class="box_list isotope-item popular">
						<div class="row g-0">
							<div class="col-lg-5">
								<figure>
									<a href="restaurant-detail.html"><img src="img/restaurant_1.jpg" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
								</figure>
							</div>
							<div class="col-lg-7">
								<div class="wrapper">
									<a href="#0" class="wish_bt"></a>
									<h3><a href="restaurant-detail.html">King food</a></h3>
									<p>Dicam diceret ut ius, no epicuri dissentiet philosophia vix. Id usu zril tacimates neglegentur. Eam id legimus torquatos cotidieque, usu decore percipitur definitiones ex, nihil utinam recusabo mel no.</p>
									<span class="price">From <strong>$54</strong> /per person</span>
								</div>
								<ul>
									<li><i class="ti-eye"></i> 164 views</li>
									<li><div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div></li>
								</ul>
							</div>
						</div>
					</div>
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
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
	
	<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/markerclusterer.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map_restaurants.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/infobox.js"></script>
	

	
	
  
</body>
</html>