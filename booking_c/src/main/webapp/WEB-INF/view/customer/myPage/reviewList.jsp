<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
					<td colspan="3"> ${r.reviewMemo} </td>
				</tr>
				<tr>
					<td> ${r.createdate} </td>
				</tr>
				
			</c:forEach>
		</table>
	</body>
</html>