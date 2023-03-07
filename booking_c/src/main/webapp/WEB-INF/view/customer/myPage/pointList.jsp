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