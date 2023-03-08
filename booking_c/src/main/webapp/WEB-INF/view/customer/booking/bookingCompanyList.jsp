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
	<span>예약 업체 검색</span>
	<form action="${pageContext.request.contextPath }/customer/bookingCompanyList" method="get">
		<select name="optionWord">
			<option value="">==옵션선택==</option>
			<option value="주차가능">주차가능</option>
			<option value="제로페이">제로페이</option>
			<option value="포장">포장</option>
			<option value="배달">배달</option>
			<option value="단체석">단체석</option>
		</select>
		
		<input type="text" name="searchWord" value=${searchWord }>
		<button type="submit"> 검색 </button><br><br>
	</form>
	
	<!-- 검색 키워드 -->
	<a href="${pageContext.request.contextPath }/customer/bookingCompanyList?currentPage=${currentPage }&searchWord=${searchWord}&optionWord=주차가능">주차가능</a>
	<a href="">제로페이</a>
	<a href="">포장</a>
	<a href="">배달</a>
	<a href="">단체석</a>
	<br><br>
	
	<!-- 광고 -->
	<a href="">광고</a><br><br>
	
	<!-- 예약업체 리스트 -->
	<table border=1>
		<c:forEach var="bkc" items="${bookingCompanyList }">
		
			<tr>
				<td rowspan="4">${bkc.bkciOrigin }</td><!-- bkc=예약업체, 대표 사진 -->
				<td colspan="2"><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyDetailHome?bkcId=${bkc.bkcId}&bkciLevel=${bkc.bkciLevel}">${bkc.bkcName }</a></td>
				<td rowspan="2">${bkc.bkcOpen }</td><!-- 오픈시간 -->
			</tr>
			<tr>
				<td>${bkc.bkcdType }</td><!-- 업종 -->
				<td>${bkc.bkcdAddService }</td><!-- 부가서비스 -->
			</tr>
			<tr>
				<td colspan="2">별점 : ${bkc.rvRating }</td><!-- 별점 -->
				<td rowspan="2">${bkc.rviOrigin }</td><!-- 리뷰사진 -->
			</tr>
			<tr>
				<td colspan="2">${bkc.rvMemo }</td><!-- 리뷰메모 -->
			</tr>
		</c:forEach>
	</table>
	
	
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage == 1}">
			<span>처음으로</span>
			<span>이전페이지</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=1&searchWord=${searchWord}&optionWord=${optionWord}">[처음으로]</a>
			<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${currentPage-1}&searchWord=${searchWord}&optionWord=${optionWord}">[이전 페이지]</a>
		</c:if>
			<span>${currentPage }</span>
		<c:if test="${currentPage == lastPage}">
			<span>다음페이지</span>
			<span>마지막으로</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${currentPage+1}&searchWord=${searchWord}&optionWord=${optionWord}">[다음 페이지]</a>
			<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList?currentPage=${lastPage}&searchWord=${searchWord}&optionWord=${optionWord}">[끝으로]</a>
		</c:if>
	</div>
</body>
</html>