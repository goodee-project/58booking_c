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
					<td colspan="3"> ${r.reviewMemo} | ${r.createdate} </td>
				</tr>
				<tr>
					<td> 
						<c:if test="${r.commentMemo == null}">
							답변없음
						</c:if>
						<c:if test="${r.commentMemo != null}">
							${r.commnetMemo} | ${r.commentDate}
						</c:if>
					</td>
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