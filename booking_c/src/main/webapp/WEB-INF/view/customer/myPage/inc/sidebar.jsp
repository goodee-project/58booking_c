<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('.ing').click(function() {
					alert('구현중인 기능입니다');
				});
			});
		</script>
	</head>
	<body>
		<aside class="col-lg-3" id="sidebar" style="padding-top: 0px;">
			<div id="filters_col">
				<h5><a href="${pageContext.request.contextPath}/customer/myPage/myPageMain" style="color: black; font-weight: bold;">마이페이지</a></h5>
				<div class="collapse show">
					<div class="filter_type">
						<h6></h6>
						<ul>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/myPage/customerOne">내 정보</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/booking/bookingList">예약 내역</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/review/reviewList">리뷰</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/pay/payList">페이 내역</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/point/pointList">포인트 내역</a></label>
							</li>
						</ul>
						<h6></h6>
						<ul>
							<li>
							    <label><a class="ing">톡톡</a></label>
							</li>
							<li>
							    <label><a class="ing">이벤트 참여하기</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/myPage/deactiveCustomer">회원 탈퇴</a></label>
							</li>
						</ul>
						<h6>외 기능</h6>
						<ul>
							<li>
							    <label><a href="${pageContext.request.contextPath }/log/loginCustomer">로그인</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath }/log/addCustomer">회원가입</a></label>
							</li>
							<li>
							    <label><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList">예약업체 검색페이지</a></label>
							</li>
						</ul>
						<h6>로그아웃</h6>
						<ul>
							<li>
							    <label><a href="${pageContext.request.contextPath}/customer/logout">로그아웃</a></label>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</aside>
	</body>
</html>