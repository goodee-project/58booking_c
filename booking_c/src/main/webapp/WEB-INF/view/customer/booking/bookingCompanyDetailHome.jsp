<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
       <meta name="author" content="Ansonika">
       <title>${bookingCompanyDetailCommon.bkcName}</title>
       <link rel="shortcut icon" href="../../resources/img/favicon.ico" type="image/x-icon">
       <link rel="apple-touch-icon" type="image/x-icon" href="../../resources/img/apple-touch-icon-57x57-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../../resources/img/apple-touch-icon-72x72-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../../resources/img/apple-touch-icon-114x114-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../../resources/img/apple-touch-icon-144x144-precomposed.png">
       <link rel="preconnect" href="https://fonts.gstatic.com">
       <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
       <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
       <link href="../../resources/css/style.css" rel="stylesheet">
      <link href="../../resources/css/vendors.css" rel="stylesheet">
       <link href="../../resources/css/custom.css" rel="stylesheet">
   </head>
	<body class="datepicker_mobile_full">
		<div id="page" class="theia-exception">
			<main>
				<section class="hero_in restaurants_detail">
					<div class="wrapper">
						<div class="container">
							<h1 class="fadeInUp"><span></span>Restaurant detail page</h1>
						</div>
					</div>
				</section>
				<div class="bg_color_1">
					<!-- 업체정보 공통 -->
   					<jsp:include page="/WEB-INF/view/customer/booking/bookingCompanyDetailCommon.jsp"></jsp:include>
				</div>
				<div class="bg_color_1">
					<div class="container margin_60_35">
						<div class="row">
							<div class="col-lg-12">
								<section id="description">
									<h2>Description</h2>
									<p>Per consequat adolescens ex, cu nibh commune <strong>temporibus vim</strong>, ad sumo viris eloquentiam sed. Mea appareat omittantur eloquentiam ad, nam ei quas oportere democritum. Prima causae admodum id est, ei timeam inimicus sed. Sit an meis aliquam, cetero inermis vel ut. An sit illum euismod facilisis, tamquam vulputate pertinacia eum at.</p>
									<p>Cum et probo menandri. Officiis consulatu pro et, ne sea sale invidunt, sed ut sint <strong>blandit</strong> efficiendi. Atomorum explicari eu qui, est enim quaerendum te. Quo harum viris id. Per ne quando dolore evertitur, pro ad cibo commune.</p>
									<div class="row">
										<div class="col-lg-6">
											<ul class="bullets">
												<li>Dolorem mediocritatem</li>
												<li>Mea appareat</li>
												<li>Prima causae</li>
												<li>Singulis indoctum</li>
											</ul>
										</div>
										<div class="col-lg-6">
											<ul class="bullets">
												<li>Timeam inimicus</li>
												<li>Oportere democritum</li>
												<li>Cetero inermis</li>
												<li>Pertinacia eum</li>
											</ul>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="toTop"></div>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
		<script src="../../resources/js/input_qty.js"></script>
	</body>
</html>