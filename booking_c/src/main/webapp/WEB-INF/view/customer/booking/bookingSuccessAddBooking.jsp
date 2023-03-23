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
	
	<input type="text" value="${bkpName }">
	<table border="1">
		<tr>
			<td rowspan="4">${bkpName }</td>
		</tr>
			<c:forEach var="bkp" items="${bookingAfterProductImg }">
		<tr>
				<td>${bkp.bkpiSave }</td>
			
		</tr>
			</c:forEach>
	</table>
</body>
</html>