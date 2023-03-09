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
	
	<!-- 예약상품 리스트 -->
	<table border="1">
		<c:forEach var="bkc" items="${bookingCompanyDetailBooking}">
			<tr>
				<td rowspan="2">예약상품사진 : ${bkc.bkpiOrigin}</td>
				<td>상품명 : ${bkc.bkpName}</td>
				<td rowspan="2"><a href="${pageContext.request.contextPath }/customer/booking/selectBookingTime">예약</a></td>
			</tr>
			<tr>
				<td>가격 : ${bkc.bkpPrice}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>