<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>결제 페이지</title>
		<link rel="shortcut icon" href="../../resources/img/favicon.ico" type="image/x-icon">
	    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../../resources/css/style.css" rel="stylesheet">
		<link href="../../resources/css/vendors.css" rel="stylesheet">
	    <link href="../../resources/css/blog.css" rel="stylesheet">
	    <link href="../../resources/css/custom.css" rel="stylesheet">


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		$('#pointBtn').click(function(){
			
		if($('#point').val() > ${loginCustomer.customerPoint})
			{
				alert('보유 포인트 초과');
				$('#point').val(0); 
				return;
			} 
		var totalCount = ${rankDiscount + optionPrice};
		console.log(totalCount);
		console.log($('#point').val());
 		var useCount = $('#point').val();
		console.log(useCount+"<--useCount");
		if($('#point').val() > totalCount)
			{
				$('#point').val(totalCount);
				$('#finalCount').val(0);
				return;
			}
		if(useCount<=totalCount)
			{
				var change = totalCount - useCount
				$('#finalCount').val(change);
				return;
			}
		});
		
		$('#payBtn').click(function(){
		var result = confirm("충전페이지로 이동합니다");
			
		if(result)
			{
			 	location.replace('${pageContext.request.contextPath}/customer/pay/payList');
				return;
			}
		else
			{
				return;
			}
		})
		
		$('#paymentBtn').click(function(){
			var optionTest = $('#option').val();
			if($('#option').val() == '[]')
				{
					$('#option').val(optionTest.replace('[]',0));
					var beChangNo = parseInt($('#option').val());
					console.log($('#option').val()+"<--option if");
					console.log(typeof beChangNo+"<--option if typeof");
					
					console.log($('#productTime').val());
					console.log(typeof $('#productTime').val());
					/*
					$('#productTime').val(productTimeInt);
					console.log($('#productTime').val());
					*/
					
					var havePay = parseInt($('#havePay').val());
					var finalCount = parseInt($('#finalCount').val());
					if(havePay < finalCount)
					{
						
						alert('보유페이가 부족합니다. 충전 후 이용바랍니다.');
						console.log($('#havePay').val()+"<--havePay");
						console.log($('#finalCount').val()+"<--finalCount");
						console.log(typeof havePay+"<--havePay123")
						console.log(typeof finalCount+"<--finalCount123")
						
						return;
					} 
					$('#paymentForm').submit();
					return;
				}
			 if($('#havePay').val()<$('#finalCount').val())
				{
					alert('보유페이가 부족합니다. 충전 후 이용바랍니다.');
					console.log($('#havePay').val()+"<--havePay");
					console.log($('#finalCount').val()+"<--finalCount");
					
					return;
				} 
			var no1 = optionTest.replace('[','');
			var no2 = no1.replace(']','');
			console.log($('#option').val()+"<--option");
			console.log(no2+"<--no2");
			$('#option').val(no2);
			console.log($('#productTime').val());
			$('#paymentForm').submit();
		});
		
		
		
	});
	</script>
<title> </title>
</head>
<body>
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
			<div class="hero_in cart_section">
				<div class="wrapper">
					<div class="container">
						<div class="bs-wizard clearfix">
							<div class="bs-wizard-step">
								<div class="text-center bs-wizard-stepnum">예약 사항 선택</div>
								<div class="progress">
									<div class="progress-bar"></div>
								</div>
								<a href="javascript:window.history.go(-1);" class="bs-wizard-dot"></a>
							</div>
	
							<div class="bs-wizard-step active">
								<div class="text-center bs-wizard-stepnum">결제</div>
								<div class="progress">
									<div class="progress-bar"></div>
								</div>
								<a href="#0" class="bs-wizard-dot"></a>
							</div>
	
							<div class="bs-wizard-step disabled">
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
			<!--/hero_in-->
	
			<div class="bg_color_1">
				<div class="container margin_60_35">
					<div class="row">
						<div class="col-lg-12">
							<div class="box_cart">
							
								<div class="form_title">
									<h3> ${bkpName } 결제 상세페이지 </h3>
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
											<input type="hidden" name="dayList" value="${dates }">
											<input type="hidden" name="productTime" value="${productTime }" id="productTime">
										</c:if>
										<c:if test="${optionSize == 0}">
											<input type="hidden" name="bkpoName" value="옵션없음">
										</c:if>
										<table class="table cart-list" style="text-align: center">
											<tr>
												<td>날짜 </td>
												<td>${dates}</td>
											</tr>
											<c:if test="${productTime != ''}">
												<tr>
													<td>시간</td>
													<td>${productTime}</td>
												</tr>
											</c:if>								
											<tr>
												<td>인원</td>
												<td>${qtyInput }</td>
											</tr>								
											<tr>
												<td>상품가격</td>
												<td>${bkpPrice }원</td>
											</tr>								
											<tr>
												<td>선택 옵션</td>
												<td>
													<c:if test="${optionSize == 0}">
														<input type="hidden" name="bkpoName" value="옵션없음">
														선택 옵션 없음
													</c:if>
													<c:if test="${optionSize != 0}">
														<c:forEach var="tbkpoNo" items="${bookingOptionList }" varStatus="status">
																<c:forEach var="bkpoNo" items="${option }" varStatus="status">
																		<c:if test="${tbkpoNo.optionNo ==bkpoNo }">
																			[${tbkpoNo.optionName}]
																			<input type="hidden" name="bkpoNo" value="${bkpoNo }">
																			<input type="hidden" name="bkpoName" value="${tbkpoNo.optionName}">
																		</c:if>
											
																</c:forEach>
														</c:forEach>		
													</c:if>
												</td>
											</tr>
											<tr>
												<td>총 옵션 가격</td>
												<td>${optionPrice}원</td>
											</tr>								
	
											<tr>
												<td>기업명</td>
												<td>${bookingPaymentCompany.bkcName}</td>
											</tr>								
											<tr>
												<td>사업자번호</td>
												<td>${bookingPaymentCompany.bkcNumber}</td>
											</tr>								
											<tr>
												<td>전화번호</td>
												<td>${bookingPaymentCompany.bkcPhone}</td>
											</tr>								
											<tr>
												<td>주소</td>
												<td>${bookingPaymentCompany.bkcAddress}</td>
											</tr>	
											<tr>
												<td>예약자</td>
												<td>${loginCustomer.customerName }</td>
											</tr>							
											<tr>
												<td>전화번호</td>
												<td>${loginCustomer.customerPhone }</td>
											</tr>							
											<tr>
												<td>이메일</td>
												<td>${loginCustomer.customerEmail }</td>
											</tr>							
							
											<tr>
												<td>회원 등급</td>
												<td>${loginCustomer.customerRank}</td>
											</tr>							
											<tr>
												<td>등급 할인 금액</td>
												<td>${bkpPrice -  rankDiscount}원</td>
											</tr>							
											<tr>
												<td>보유 포인트</td>
												<td>${loginCustomer.customerPoint}P</td>
											</tr>							
											<tr>
												<td>사용 포인트</td>
												<td> 
													 <input type="text" name="point" id="point" value="0">P
													 <button type="button" id="pointBtn">사용</button>	
												</td>
											</tr>							
											<tr>
												<td>페이 잔액</td>
												<td>
													${loginCustomer.customerPay}Pay
													<input type="hidden" name="havePay" value="${loginCustomer.customerPay}" id="havePay">
													<button type="button" id="payBtn">충전하기</button>
												</td>
											</tr>							
											<tr>
												<td>총 결제 금액</td>
												<td>
													<input type="text" name="finalCount" id="finalCount" value="${rankDiscount +  optionPrice}">원
												</td>
											</tr>							
											<tr>
												<td colspan="2">
													<button type="button" class="btn_1" id="paymentBtn">결제하기</button>
												</td>
											</tr>
										</table>
									</form>
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
	
	<script src="../../resources/js/common_scripts.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="../../resources/phpmailer/validate.js"></script>
	<script src="../../resources/js/input_qty.js"></script>
	
	
	
</body>
</html>