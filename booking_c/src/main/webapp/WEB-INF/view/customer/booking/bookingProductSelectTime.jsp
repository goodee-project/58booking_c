<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<!-- css headCore -->
	<jsp:include page="/WEB-INF/view/customer/booking/inc/headCore.jsp"></jsp:include>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).mouseup(function (e) {
		     var container = $("#dropDownOptions");
	
		     if (container.has(e.target).length === 0) {
		          container.hide();
		     }
		});
	</script>
	<script>
		
		$(document).ready(function() {
			 if($('#msg').val() != '')
				{
					alert('최대인원 이상 예약 불가');
				}
			$('#bookingBtn1').click(function(){
					if($('#bookingDate').val() == '')
						{
							alert('날짜를 선택해주세요');
							return;
						}
					$('#booking1').submit();
				});
			
					
			$('#bookingBtn2').click(function(){					
					  $.ajax({
								url:'bkcOffdayCheck'
								, type : 'get'
								, data : {dates:$('#bookingDate').val(), bkcId:$('#bkcId').val()}
								, success: function(model)
								{
									console.log('모델값:'+model);
									if(model=='no') {
										console.log('예약가능');
										$('#booking2').submit();
										return;
									} else {
										alert($('#bookingDate').val()+'는 정기 휴무일 입니다.');
										$('#bookingDate').focus();
										return;
									}
								}
							});
				});
		});
	</script>

	<title>Booking Product Select Time </title>
</head>
<body class="datepicker_mobile_full">
	<input type="hidden" id=msg value=${msg }>
	

	<!-- 날짜형 기업 예약 -->
	<c:if test="${bkctNo == 1 }">
		<div id="page" class="theia-exception">
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
				<section class="hero_in restaurants_detail">
					<div class="wrapper">
						<div class="container">
							<h1 class="fadeInUp"><span></span>날짜형 업체 상품 예약</h1>
							<!-- 임시메뉴 -->
							<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
						</div>
						
					</div>
				</section>
				<!--/hero_in-->
		
				<div class="bg_color_1">
					<nav class="secondary_nav sticky_horizontal">
						<div class="container">
							<ul class="clearfix">
								<li><a href="#description" class="active">Description</a></li>
								
							</ul>
						</div>
					</nav>
					<div class="container margin_60_35">
						<div class="row">
							<div class="col-lg-8">
								<section id="description">
									<h2>업체 정보</h2>
									<table>
										<tr>
											<td>업체 사진 :  
												<c:forEach var="bkc" items="${bookingProductSelectTime}">
														${bkc.bkciOrigin }
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>상품명 : ${bkpName}</td>
										</tr>
										<tr>
											<td>최대인원 : ${bookingProductInfo.bkpMax}</td>
										</tr>
										<tr>
											<td>최소인원 : ${bookingProductInfo.bkpMin}</td>
										</tr>
										<tr>
											<td>상품가격 : ${bookingProductInfo.bkpPrice}원</td>
										</tr>
									
										<tr>
											<td> 선택 가능한 옵션 </td>
										</tr>
										<c:forEach var="bkpo" items="${bookingProductOptionList}" varStatus="status">
											<tr>
												<td>
													&nbsp;&nbsp;&nbsp;&nbsp; ${status.count}. ${bkpo.bkpoName } - ${bkpo.bkpoMemo } = ${bkpo.bkpoPrice }원
												</td>
											</tr>
										</c:forEach>
									</table>
								</section>
								<!-- /section -->
							</div>
							<!-- /col -->
							<aside class="col-lg-4" id="sidebar">
							<form action="${pageContext.request.contextPath}/customer/booking/bookingProductPayment" method="post" id="booking1">
								<input type="hidden" name="bkcId" value="${bkcId }"> 
								<input type="hidden" name="bkpMax" value="${bookingProductInfo.bkpMax}">
								<input type="hidden" name="bkpPrice" value="${bookingProductInfo.bkpPrice}">
								<input type="hidden" name="bkpName" value="${bkpName}">
								<input type="hidden" name="bkpNo" value="${bookingProductInfo.bkpNo}">
								

								<div class="box_detail booking">
									<div class="price">
										<span>날짜형 예약</span>
									</div>
		
									<div class="form-group input-dates">
										<input class="form-control" type="text" name="dates" placeholder="When.." id="bookingDate">
										<i class="icon_calendar"></i>
									</div>
		
									<div class="panel-dropdown">
										<a href="#">인원 <span class="qtyTotal"  id="dayQtyTotal">1</span></a>
										<div class="panel-dropdown-content right">
											<div class="qtyButtons">
												<label>설정</label>
												<input type="text" name="qtyInput" value="1">
											</div>
											
										</div>
									</div>

									<div class="form-group clearfix">
										<div class="custom-select-form">
											<c:forEach var="bkpo" items="${bookingProductOptionList }">
												<input type="checkbox" name="option" value="${bkpo.bkpoNo }">${bkpo.bkpoName }
												<input type="hidden" name="bkpoName" value="${bkpo.bkpoName }">
											</c:forEach>
										</div>
									</div>
									
									<button type="button" id="bookingBtn1" class=" add_top_30 btn_1 full-width purchase">예약</button>
									
								</div>
								
							</form>
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
			
			<div id="toTop"></div><!-- Back to top button -->
		
			<!-- css footerCore -->
			<jsp:include page="/WEB-INF/view/customer/booking/inc/footerCore.jsp"></jsp:include>
			
			<!-- DATEPICKER  -->
			<script>
			$(function() {
			  $('input[name="dates"]').daterangepicker({
				  autoUpdateInput: false,
				  parentEl:'.scroll-fix',
				  minDate:new Date(),
				  opens: 'left',
				  locale: {
				        format: 'YYYY-MM-DD'
				  }
			  });
			  $('input[name="dates"]').on('apply.daterangepicker', function(ev, picker) {
				  $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
			  });
			  $('input[name="dates"]').on('cancel.daterangepicker', function(ev, picker) {
				  $(this).val('');
			  });
			});
			</script>
		
	</c:if>


	<!-- 시간형 기업 예약 -->	
	<c:if test="${bkctNo == 2 }">
		<body class="datepicker_mobile_full"><!-- Remove this class to disable datepicker full on mobile -->
	
			<div id="page" class="theia-exception">
				
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
				<section class="hero_in restaurants_detail">
					<div class="wrapper">
						<div class="container">
							<h1 class="fadeInUp"><span></span>시간형 업체 상품 예약</h1>
							<!-- 임시메뉴 -->
							<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
						</div>
						
					</div>
				</section>
				<!--/hero_in-->
		
				<div class="bg_color_1">
					<nav class="secondary_nav sticky_horizontal">
						<div class="container">
							<ul class="clearfix">
								<li><a href="#description" class="active">업체정보</a></li>
							</ul>
						</div>
					</nav>
					<div class="container margin_60_35">
						<div class="row">
							<div class="col-lg-8">
								<section id="description">
									<h2>업체 정보</h2>
									<table>
										<tr>
											<td>업체 사진 :  
												<c:forEach var="bkc" items="${bookingProductSelectTime}">
														${bkc.bkciOrigin }
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>업체명 : ${bkcName}</td>
										</tr>
										<tr>
											<td>상품명 : ${bkpName}</td>
										</tr>
										<tr>
											<td>최대인원 : ${bookingProductInfo.bkpMax}</td>
										</tr>
										<tr>
											<td>최소인원 : ${bookingProductInfo.bkpMin}</td>
										</tr>
										<tr>
											<td>상품가격 : ${bookingProductInfo.bkpPrice}원</td>
										</tr>
										<tr>
											<td> 선택 가능한 옵션 </td>
										</tr>
										<c:forEach var="bkpo" items="${bookingProductOptionList}" varStatus="status">
											<tr>
												<td>
													&nbsp;&nbsp;&nbsp;&nbsp; ${status.count}. ${bkpo.bkpoName } - ${bkpo.bkpoMemo } = ${bkpo.bkpoPrice }원
												</td>
											</tr>
										</c:forEach>
									</table>
								</section>
								<!-- /section -->
							</div>
							<!-- /col -->
							
							<aside class="col-lg-4" id="sidebar">
								<form action="${pageContext.request.contextPath}/customer/booking/bookingProductPayment" method="post" id="booking2">
									<input type="hidden" name="bkcId" value="${bkcId }" id="bkcId"> 
									<input type="hidden" name="bkpMax" value="${bookingProductInfo.bkpMax}">
									<input type="hidden" name="bkpPrice" value="${bookingProductInfo.bkpPrice}">
									<input type="hidden" name="bkpName" value="${bkpName}">
									<input type="hidden" name="bkpNo" value="${bookingProductInfo.bkpNo}">
									<div class="box_detail booking">
										<div class="price">
											<span>시간형 예약</span>
										</div>
										
										<div class="form-group input-dates scroll-fix">
											<input class="form-control" type="text" name="dates" placeholder="When.." id="bookingDate">
											<i class="icon_calendar"></i>
										</div>
										
										<div class="panel-dropdown">
											<a href="#">인원 <span class="qtyTotal">1</span></a>
											<div class="panel-dropdown-content right">
												<div class="qtyButtons">
													<label>설정</label>
													<input type="text" name="qtyInput" value="1">
												</div>
											</div>
										</div>
										
										<div class="form-group clearfix">
											<div class="custom-select-form">
											<select class="wide" name="productTime">
												<c:forEach var="bkp" items="${bookingProductTimeList }" varStatus="status" >
													<option value="${bkp.bkpTime }">${bkp.bkpTime }</option>
												</c:forEach>
											</select>
											</div>
										</div>
										<div class="form-group clearfix">
											<div class="custom-select-form">
												<c:forEach var="bkpo" items="${bookingProductOptionList }">
													<input type="checkbox" name="option" value="${bkpo.bkpoNo }">${bkpo.bkpoName }
													<input type="hidden" name="bkpoName" value="${bkpo.bkpoName }"><br>
												</c:forEach>
											</div>
										</div>
										
										<button type="button" id="bookingBtn2" class=" add_top_30 btn_1 full-width purchase">예약</button>
									</div>
								</form>
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
		
		<div id="toTop"></div><!-- Back to top button -->
		
		<!-- css footerCore -->
		<jsp:include page="/WEB-INF/view/customer/booking/inc/footerCore.jsp"></jsp:include>
		
		<!-- DATEPICKER  -->
		<script>
		$(function() {
		  $('input[name="dates"]').daterangepicker({
			  autoUpdateInput: true,
			  parentEl:'.scroll-fix',
			  singleDatePicker: true,
			  autoApply: true,
			  minDate:new Date(),
			  showCustomRangeLabel: false,
			  locale: {
		        format: 'YYYY-MM-DD'
		      }
			  }, function(start, end, label) {
			  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			});
		});
		</script>

		
	</c:if>

</body>
</html>