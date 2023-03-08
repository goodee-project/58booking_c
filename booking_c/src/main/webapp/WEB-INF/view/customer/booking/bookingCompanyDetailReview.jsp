<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<!-- 임시메뉴 -->
	<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
	<!-- 업체정보 공통 -->
	<jsp:include page="/WEB-INF/view/customer/booking/bookingCompanyDetailCommon.jsp"></jsp:include>
	
	<table border="1">
	<c:forEach var="bkc" items="${bookingCompanyDetailReview}">
		<tr>
			<td rowspan="6">리뷰사진 : ${bkc.rviOrigin }</td>
			<td>프로필사진(${bkc.ctiOrigin}) & 닉네임(${bkc.ctNick}) & ID(${bkc.bkCustomerId})</td>
		</tr>
		<tr>
			<td>상품명 : ${bkc.bkpName}</td>
		</tr>
		<tr>
			<td>예약일 : ${bkc.bkDate}</td>
		</tr>
		<tr>
			<td>별점 : ${bkc.rvStar}/5</td>
		</tr>
		<tr>
			<td>리뷰내용 : ${bkc.rvMemo}</td>
		</tr>
		<tr>
			<td>작성일 : ${bkc.rvCreatedate}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>