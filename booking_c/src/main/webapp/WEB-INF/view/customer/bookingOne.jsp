<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 상세</title>
</head>
<body>
	<h2>예약내역 상세보기</h2>
	<h3>예약 내역</h3>
	<c:forEach items="${list}" var="bk">
		<table border="1">
			<tr>
				<th>업체명</th>
				<td>${bk.bkCompanyName}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${bk.bkDate}</td>
			</tr>
			<tr>
				<th>인원</th>
				<td>${bk.bkPeople}</td>
			</tr>
			<tr>
				<th>상품</th>
				<td>${bk.bkProductName}</td>
			</tr>
			<tr>
				<th>옵션</th>
				<td>${bk.bkProductOptionName}</td>
			</tr>
			<tr>
				<th>예약상태</th>
				<td>${bk.bkState}</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td>${bk.bkTotalPrice}</td>
			</tr>
		</table>
		<table border="1">
			<tr>
				<th>상품설명</th>
				<td>${bk.bkProductName} - ${bk.bkProductOptionMemo}</td>
			</tr>
		</table>
		<h3>판매자 정보</h3>
		<table border="1">
			<tr>
				<th>판매자 연락처</th>
				<td>${bk.bkCompanyPhone}</td>
			</tr>
			<tr>
				<th>사업주</th>
				<td>${bk.bkCompanyCeo}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${bk.bkCompanyAddress}</td>
			</tr>
		</table>
		<h3>예약자 정보</h3>
		<table border="1">
			<tr>
				<th>예약자명</th>
				<td>${bk.customerName}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${bk.customerPhone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${bk.customerEmail}</td>
			</tr>		
		</table>
	</c:forEach>
	<div>
		<span>오시는길</span>
	</div>
	<div>
		<button type="button">다시 예약하기</button>
		<button type="button">리뷰쓰기</button>
		<button type="button">톡톡</button>
		<button type="button">pdf저장</button>
	</div>
</body>
</html>