<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<jsp:include page="/WEB-INF/view/customer/booking/bookingCompanyDetailCommon.jsp"></jsp:include>

<!-- 홈 페이지 상세정보 -->
	<table border="1">
		<c:forEach var="bkc" items="${bookingCompanyDetailHome}">
			<tr>
				<td>주소 : </td>
				<td>${bkc.bkcAddress }</td>
			</tr>
			<tr>
				<td>휴무일 : </td>
				<td>${bkc.offday}</td>
			</tr>
			<tr>
				<td>운영시간 : </td>
				<td>${bkc.bkcdOpen } ~ ${bkc.bkcdClose }</td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td>${bkc.bkcPhone }</td>
			</tr>
			<tr>
				<td>부가서비스 : </td>
				<td>${bkc.bkcdService }</td>
		</tr>
		</c:forEach>		
	</table>
	
</body>
</html>