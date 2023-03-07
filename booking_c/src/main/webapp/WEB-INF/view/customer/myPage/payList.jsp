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
		<div>
			<!-- 부트스탧 적용 전 -->
			<!-- 현재 페이지에 따른 처음 버튼 활성화 -->
			<c:if test="${currentPage == 1}">
				처음 불가
			</c:if>
			<c:if test="${currentPage != 1}">
				처음 가능
			</c:if>
					
			<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
			<c:if test="${prev == false}">
				이전 비활성화
			</c:if>
			<c:if test="${prev == true}">
				이전 활성화
			</c:if>
					
			<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
				${e}
			</c:forEach>
					
			<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
			<c:if test="${next == false}">
				다음 비활성화
			</c:if>
			<c:if test="${next == true}">
				다음 활성화	
			</c:if>
					
			<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
			<c:if test="${currentPage == lastPage}">
				마지막 비활성화
			</c:if>
			<c:if test="${currentPage != lastPage}">
				마지막 활성화
			</c:if>
		</div>
	</body>
</html>