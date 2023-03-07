<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 페이 내역</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input[name="priceState"]').change(function() {
					$('#priceForm').submit();
				});
			});
		</script>
	</head>
	<body>
		현재 보유 페이 : ${customerOne.customerPay}
		<br>
		<form action="${pageContext.request.contextPath}/customer/pay/payList" method="get" id="priceForm">
			<input type="radio" name="priceState" value="" <c:out value="${priceState == '' ? 'checked':'' }"/>>전체
			<input type="radio" name="priceState" value="+" <c:out value="${priceState == '+' ? 'checked':'' }"/>>충전
			<input type="radio" name="priceState" value="-"<c:out value="${priceState == '-' ? 'checked':'' }"/>>사용
		</form>
		<table border="1">
			<c:forEach var="p" items="${payList}">
				<tr>
					<td>${p.category}</td>
					<td>${p.price}</td>
					<td>${p.createdate}</td>
				</tr>
			</c:forEach>
		</table>
		
		<form action="${pageContext.request.contextPath}/customer/pay/insertPay" method="post">
			<input type="text" name="price">
			<button type="submit">충전</button>
		</form>
	</body>
</html>