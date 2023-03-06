<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>예약 업체 리스트</h1>
	<!-- 검색창 -->
	<span>예약 업체 겁색</span>
	<form action="${pageContext.request.contextPath }/customer/bookingCompanyList" method="get">
		<input type="text" name="searchWord">
		<button type="submit"> 검색 </button><br><br>
	</form>
	
	<!-- 검색 키워드 -->
	<a href="">키워드1</a>
	<a href="">키워드2</a>
	<a href="">키워드3</a><br><br>
	
	<!-- 광고 -->
	<a href="">광고</a><br><br>
	
	<!-- 예약업체 리스트 -->
	<table border=1>
		<c:forEach var="bkc" items="${bookingCompanyList }">
		
			<tr>
				<td rowspan="4">${bkc.bkciOrigin }</td>
				<td>${bkc.bkcName }</td>
				<td rowspan="2">${bkc.bkcOpen }</td>
			</tr>
			<tr>
				<td>${bkc.bkcdAddService }</td>
			</tr>
			<tr>
				<td>별점 : ${bkc.rvRating }</td>
				<td rowspan="2">${bkc.rviOrigin }</td>
			</tr>
			<tr>
				<td>${bkc.rvMemo }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<!-- 페이징 -->
	
</body>
</html>