<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<h1>결제 성공</h1>
<!-- 임시메뉴 -->
	<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include><br><br>
	
	<table border="1">
		<tr>
			<c:forEach var="bkp" items="${bookingAfterProductImg }">
				<td>${bkp.bkpiSave }</td>
			</c:forEach>
		</tr>
	</table>
	<table border="1">	
		<tr>
			<td>상품명 </td>
			<td>${bkpName } </td>
		</tr>
		<tr>
			<td>옵션명 </td>
			<td>
				<c:forEach var="bkpoName" items="${bkpoName }">
					[${bkpoName }]
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>날짜 </td>
			<td>${dates } </td>
		</tr>
		<tr>
			<td>인원 </td>
			<td>${bookingPeople } </td>
		</tr>
		<tr>
			<td>결제금액 </td>
			<td>${finalCount } 원</td>
		</tr>
	</table><br>
	<a href="${pageContext.request.contextPath}/customer/booking/bookingCompanyList">메인으로 가기</a>
	<a href="${pageContext.request.contextPath}/customer/booking/bookingList">예약 내역 보러가기</a>
</body>
</html>