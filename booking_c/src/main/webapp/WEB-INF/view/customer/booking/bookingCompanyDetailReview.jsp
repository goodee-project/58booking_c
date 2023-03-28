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
   					<nav class="secondary_nav sticky_horizontal">
						<div class="container">
							<ul class="clearfix">
								<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkcId}&bkciLevel=${bkciLevel}">홈</a></li>
								<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailBooking?bkcId=${bkcId}&bkciLevel=${bkciLevel}" >예약</a></li>
								<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailReview?bkcId=${bkcId}&bkciLevel=${bkciLevel}" class="active">리뷰</a></li>
								<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailMap?bkcId=${bkcId}&bkciLevel=${bkciLevel}">지도</a></li>
								<li></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="bg_color_1">
					<div class="container margin_60_35">
						<div class="row">
							<div class="col-lg-12">
								<section id="reviews">
									<h2>Reviews</h2>
									<c:if test="${bookingCompanyDetailReview.size() == 0 }">
										리뷰없음
									</c:if>
									<c:forEach var="bkc" items="${bookingCompanyDetailReview}">
										<div class="reviews-container">
											<div class="review-box clearfix">
												<figure class="rev-thumb">
													<img src="${pageContext.request.contextPath}/upload/${bkc.ctiOrigin}">
												</figure>
												<div class="rev-content">
													<div class="rating">
														<c:forEach var="no" begin="1" end="5" step="1">
															<c:if test="${bkc.rvStar == no}">
																<c:forEach var="no" begin="1" end="${bkc.rvStar}" step="1">
																	<i class="icon_star voted"></i>
																</c:forEach>
																<c:forEach var="no" begin="1" end="${5-bkc.rvStar}" step="1">
																	<i class="icon_star"></i>
																</c:forEach>
															</c:if>
														</c:forEach>
													</div>
													<div class="rev-info">
														상품명 : ${bkc.bkpName}<br>
														예약일 : ${bkc.bkDate}<br>
														리뷰작성일 : ${bkc.rvCreatedate}
													</div>
													<div class="rev-text">
														<p>
															리뷰사진 : ${bkc.rviOrigin } &nbsp;&nbsp;&nbsp;${bkc.rvMemo}
														</p>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
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