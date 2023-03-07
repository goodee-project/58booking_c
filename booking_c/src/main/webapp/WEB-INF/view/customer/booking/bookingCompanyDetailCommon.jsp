<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<!-- 업체사진 -->
	<a href="">업체사진</a><br><br>
	
	<!-- 업체정보 공통 -->
	
	<table>
		<c:forEach var="bkc" items="${bookingCompanyDetailCommon }">
			<tr>
				<td>${bkc.bkciOrigin} 기업사진</td>
			</tr>
			<tr>
				<td>${bkc.bkcName} 기업이름</td>
			</tr>
			<tr>
				<td>${bkc.bkcType} 기업분류</td>
			</tr>
			<tr>
				<td>${bkc.sumStar / bkc.countReview} /5 평균 별점</td>
			</tr>
			<tr>
				<td>${bkc.countReview} 리뷰갯수</td>
			</tr>
		</c:forEach>
			
	</table><br>
	
	<!-- 예약 버튼 -->
	<a href="">예약</a><br><br>
	
	<!-- 페이지 이동버튼 -->
	<a href="">홈</a>
	<a href="">예약</a>
	<a href="">리뷰</a>
	<a href="">지도</a><br><br>
	
	
</body>
</html>