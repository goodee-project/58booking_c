<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<h3>업체 세부 정보</h3>
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList">예약업체 목록으로 가기</a><br><br>
	
	<!-- 업체정보 공통 -->
	<table border="1">
		<c:forEach var="bkc" items="${bookingCompanyDetailCommon }">
			<tr>
				<td> 기업사진 : ${bkc.bkciOrigin}</td>
			</tr>
			<tr>
				<td> 기업이름 : ${bkc.bkcName}</td>
			</tr>
			<tr>
				<td> 기업분류 : ${bkc.bkcType}</td>
			</tr>
			<tr>
				<td> 평균 별점 : ${bkc.sumStar / bkc.countReview}/5</td>
			</tr>
			<tr>
				<td> 리뷰갯수 : ${bkc.countReview}</td>
			</tr>
		</c:forEach>
	</table><br>
	
	<!-- 페이지 이동버튼 -->
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkcId}&bkciLevel=${bkciLevel}">홈</a>
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailBooking?bkcId=${bkcId}&bkciLevel=${bkciLevel}">예약</a>
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailReview?bkcId=${bkcId}&bkciLevel=${bkciLevel}">리뷰</a>
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailMap?bkcId=${bkcId}&bkciLevel=${bkciLevel}">지도</a><br><br>
	
</body>
</html>