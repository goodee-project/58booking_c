<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>마이페이지 | 리뷰 내역</title>
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
	</head>
	<body>
		<div class="container margin_60_35">
			<div class="row">
				<jsp:include page="/WEB-INF/view/customer/myPage/inc/sidebar.jsp"></jsp:include>
				<div class="col-lg-8">
					<section id="description">
						<c:forEach var="r" items="${reviewList}">
							<div class="room_type gray">
								<div class="row">
									<div class="col-md-4">
										<img src="${pageContext.request.contextPath}/upload/${r.reviewSaveName}" class="img-fluid" alt="">
									</div>
									<div class="col-md-8">
										<h4>${r.companyName}</h4>
										<h6>&nbsp;&nbsp;-&nbsp;&nbsp;${r.productName}</h6>
										<div class="rating">
											<c:forEach var="s" begin="1" end="${r.starRating}" step="1">
												<i class="icon_star voted"></i>
											</c:forEach>
											<c:forEach var="s" begin="1" end="${5 - r.starRating}" step="1">
												<i class="icon_star"></i>
											</c:forEach>
										</div>
										<div class="rev-info">
											${r.customerId}&nbsp;&nbsp;|&nbsp;&nbsp;${r.createdate}
										</div>
										<br>
										<p>${r.reviewMemo}</p>
										<div>
											<c:if test="${r.commentMemo == null}">
												답변없음
											</c:if>
											<c:if test="${r.commentMemo != null}">
												${r.commnetMemo} | ${r.commentDate}
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</section>
				</div>
			</div>
		</div>
	</body>
</html>