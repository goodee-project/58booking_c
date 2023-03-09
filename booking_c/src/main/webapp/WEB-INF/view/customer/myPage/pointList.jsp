<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>마이페이지 | 포인트 내역</title>
		<link rel="shortcut icon" href="../../resources/img/favicon.ico" type="image/x-icon">
	    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../../resources/css/style.css" rel="stylesheet">
		<link href="../../resources/css/vendors.css" rel="stylesheet">
	    <link href="../../resources/css/blog.css" rel="stylesheet">
	    <link href="../../resources/css/custom.css" rel="stylesheet">
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
		<div class="container margin_60_35">
			<div class="row">
				<jsp:include page="/WEB-INF/view/customer/myPage/inc/sidebar.jsp"></jsp:include>
				<div class="col-lg-9" id="list_sidebar">
					<div class="isotope-wrapper">
						<div class="box_list isotope-item latest">
							<div class="row g-0">
								<div class="wrapper">
									<div style="float: left;">
										<h3 style="font-weight: bold;">포인트 내역</h3>
									</div>
									<div style="float: right;">
										<form action="${pageContext.request.contextPath}/customer/point/pointList" method="get" id="pointForm">
											<input type="radio" name="pointState" class="form-check-input" value="" <c:out value="${pointState == '' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;All</span>
											<input type="radio" name="pointState" class="form-check-input" value="+" <c:out value="${pointState == '+' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;+ Point</span>
											<input type="radio" name="pointState" class="form-check-input" value="-" <c:out value="${pointState == '-' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;- Point</span>
										</form>
										<br>
									</div>
									<table class="table text-center">
										<c:forEach var="p" items="${pointList}">
											<tr style="height: 55px; vertical-align: middle;">
												<td style="width: 300px;">
													<c:if test="${p.category eq '예약리뷰' || p.category eq '예약취소' || p.category eq '이벤트'}">
														<span style="color: blue;">${p.category}</span>
													</c:if>
													<c:if test="${p.category eq '예약구매'}">
														<span style="color: red;">${p.category}</span>
													</c:if>
												</td>
												<td style="width: 300px;">
													<c:if test="${p.category eq '예약리뷰' || p.category eq '예약취소' || p.category eq '이벤트'}">
														<span style="color: blue;">${p.point}</span>
													</c:if>
													<c:if test="${p.category eq '예약구매'}">
														<span style="color: red;">${p.point}</span>
													</c:if>
												</td>
												<td>
													<c:set var="createdate" value="${p.createdate}"/>
													${fn:substring(createdate, 0, 16)}
												</td>
											</tr>
										</c:forEach>
									</table>
									<div style="text-align: center;">
										<c:if test="${currentPage == 1}">
											<a>&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${currentPage != 1}">
											<a href="${pageContext.request.contextPath}/customer/point/pointList?currentPage=1&pointState=${pointState}">&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
										<c:if test="${prev == false}">
											<a>&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${prev == true}">
											<a href="${pageContext.request.contextPath}/customer/point/pointList?currentPage=${startPage - 1}&pointState=${pointState}">&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
											<a href="${pageContext.request.contextPath}/customer/point/pointList?currentPage=${e}&pointState=${pointState}">${e}</a>&nbsp;&nbsp;
										</c:forEach>
												
										<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
										<c:if test="${next == false}">
											<a>&gt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${next == true}">
											<a href="${pageContext.request.contextPath}/customer/point/pointList?currentPage=${endPage + 1}&pointState=${pointState}">&gt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
										<c:if test="${currentPage == lastPage}">
											<a>&gt;&gt;</a>
										</c:if>
										<c:if test="${currentPage != lastPage}">
											<a href="${pageContext.request.contextPath}/customer/point/pointList?currentPage=${lastPage}&pointState=${pointState}">&gt;&gt;</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<aside class="col-lg-3" id="sidebar">
					<div id="filters_col">
						<div style="text-align: left;"><h6 style="font-weight: bold;">보유 포인트</h6></div>
						<div style="text-align: right;"><h5 style="font-weight: bold;">${customerOne.customerPoint}P</h5></div>
					</div>
				</aside>
			</div>
		</div>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
	</body>
</html>