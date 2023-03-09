<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>마이페이지 | 리뷰 내역</title>
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
	</head>
	<body>
		<table border="1">
			<c:forEach var="r" items="${reviewList}">
				<tr>
					<td rowspan="4"> ${r.companyName} </td>
					<td rowspan="4"> <img src="${pageContext.request.contextPath}/upload/${r.reviewImgOriginName}" width="200" height="200"> </td>
					<td> ${r.productName} </td>
					<td> ${r.totalPrice} </td>
					<td> ${r.bookingDate} </td>
				</tr>
				<tr>
					<td colspan="3"> ${r.starRating} </td>
				</tr>
				<tr>
					<td colspan="3"> ${r.reviewMemo} | ${r.createdate} </td>
				</tr>
				<tr>
					<td> 
						<c:if test="${r.commentMemo == null}">
							답변없음
						</c:if>
						<c:if test="${r.commentMemo != null}">
							${r.commnetMemo} | ${r.commentDate}
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-8">
					<section id="description">
						<c:forEach var="r" items="${reviewList}">
							<div class="room_type gray">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/upload/${r.reviewImgOriginName}" class="img-fluid" alt="">
									</div>
									<div class="col-md-8">
										<h4>${r.companyName}&nbsp;&nbsp;|&nbsp;&nbsp;${r.productName}</h4>
										<div class="rating">
											<i class="icon_star voted"></i>
											<i class="icon_star voted"></i>
											<i class="icon_star voted"></i>
											<i class="icon_star voted"></i>
											<i class="icon_star"></i>
										</div>
										<div class="rev-info">
											${r.customerId}&nbsp;&nbsp;|&nbsp;&nbsp;${r.createdate}
										</div>
										<br>
										<p>${r.reviewMemo}</p>
										<ul class="hotel_facilities">
											<li><img src="img/hotel_facilites_icon_3.svg" alt="">Double Bed</li>
											<li><img src="img/hotel_facilites_icon_4.svg" alt="">Free Wifi</li>
											<li><img src="img/hotel_facilites_icon_6.svg" alt="">Bathtub</li>
											<li><img src="img/hotel_facilites_icon_7.svg" alt="">Air Condition</li>
											<li><img src="img/hotel_facilites_icon_8.svg" alt="">Hairdryer</li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
					</section>
				</div>
			</div>
		</div>
	</body>
</html>