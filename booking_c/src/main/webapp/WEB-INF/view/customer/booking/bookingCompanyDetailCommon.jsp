<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
       <meta charset="utf-8">
       <title>${bookingCompanyDetailCommon.bkcName}</title>
   </head>
	<body class="datepicker_mobile_full">
		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="row">
					<div style="margin: auto; text-align: center;">
						<h2 style="font-weight: bold;">${bookingCompanyDetailCommon.bkcName}</h2>
						<h6>${bookingCompanyDetailCommon.bkcType}</h6>
						<div class="rating">
							<h6><i class="icon_star voted"></i>${bookingCompanyDetailCommon.sumStar / bookingCompanyDetailCommon.countReview}/5</h6>
						</div>
						<span>리뷰  ${bookingCompanyDetailCommon.countReview}개</span>
					</div>
				</div>
			</div>
			<nav class="secondary_nav sticky_horizontal">
				<div class="container">
					<ul class="clearfix">
						<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkcId}&bkciLevel=${bkciLevel}" class="active">홈</a></li>
						<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailBooking?bkcId=${bkcId}&bkciLevel=${bkciLevel}">예약</a></li>
						<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailReview?bkcId=${bkcId}&bkciLevel=${bkciLevel}">리뷰</a></li>
						<li><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailMap?bkcId=${bkcId}&bkciLevel=${bkciLevel}">지도</a></li>
						<li></li>
					</ul>
				</div>
			</nav>
		</div>
	</body>
</html>