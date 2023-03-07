<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 포인트 내역</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input[name="pointState"]').change(function() {
					$('#pointForm').submit();
				});
			});
		</script>
	</head>
	<body>
		현재 보유 포인트 : ${customerOne.customerPoint}
		<br>
		<form action="${pageContext.request.contextPath}/customer/point/pointList" method="get" id="pointForm">
			<input type="radio" name="pointState" value="" <c:out value="${pointState == '' ? 'checked':'' }"/>>전체
			<input type="radio" name="pointState" value="+" <c:out value="${pointState == '+' ? 'checked':'' }"/>>적립
			<input type="radio" name="pointState" value="-"<c:out value="${pointState == '-' ? 'checked':'' }"/>>사용
		</form>
		<table border="1">
			<c:forEach var="p" items="${pointList}">
				<tr>
					<td>${p.category}</td>
					<td>${p.point}</td>
					<td>${p.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>