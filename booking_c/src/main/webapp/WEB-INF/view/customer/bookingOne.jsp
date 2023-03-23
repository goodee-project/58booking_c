<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약내역 상세</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style>
		.jb-division-line {
			border-top: 1px solid #444444;
			margin: 30px 0px;
		}
    </style>
</head>
<body>
	<div id="page">
		<div class="bg_color_1">
			<div class="container margin_80_55">
				<c:forEach items="${list}" var="bk">
					<div class="row justify-content-between">
						<div class="col-lg-12">
							<div>
								<h3>예약 정보</h3>
								<p>예약하신 내역을 확인해보세요.</p>
								<div id="message-contact"></div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>업체명</label>
											<input class="form-control" value="${bk.bkCompanyName}" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>방문 날짜</label>
											<input class="form-control" value="${bk.bkDate}" readonly="readonly">
										</div>
									</div>
								</div>
								<!-- /row -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>상품명</label>
											<input class="form-control" value="${bk.bkProductName}" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>옵션</label>
											<input class="form-control" value="${bk.bkProductOptionName}" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>인원</label>
											<input class="form-control" value="${bk.bkPeople}" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>예약 상태</label>
											<input class="form-control" value="${bk.bkState}" readonly="readonly">
										</div>
									</div>
								</div>
								<!-- /row -->
								<div class="form-group">
									<label style="font-weight:bold;">결제금액 :</label>
									<span style="font-weight:bold;">${bk.bkTotalPrice}원</span>
								</div>
							</div>
						</div>
						<!-- 구분선 -->
						<div class="jb-division-line"></div>
						<div class="row justify-content-between" style="padding-top:30px">
							<div class="col-lg-6 margin_50_30">
								<h4>판매자 정보</h4>
								<div id="message-contact"></div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>대표</label>
											<input class="form-control" value="${bk.bkCompanyCeo}" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>주소</label>
											<input class="form-control" value="${bk.bkCompanyAddress}" readonly="readonly">
										</div>
									</div>
								</div>
								<!-- /row -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>연락처</label>
											<input class="form-control" value="${bk.bkCompanyPhone}" readonly="readonly">
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<h4>예약하신분 정보</h4>
								<div id="message-contact"></div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>예약자</label>
												<input class="form-control" value="${bk.customerName}" readonly="readonly">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>연락처</label>
												<input class="form-control" value="${bk.customerPhone}" readonly="readonly">
											</div>
										</div>
									</div>
									<!-- /row -->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>이메일</label>
												<input class="form-control" value="${bk.customerEmail}" readonly="readonly">
											</div>
										</div>
									</div>
								</div>
							</div>						
						</div>
					</c:forEach>
					<div class="col-lg-6" style="padding-top:80px">
						<h4>오시는길</h4>
						<div id="message-contact"></div>
						<div id="map" style="width:550px;height:350px;"></div>
							<c:forEach var="bkc" items="${companyMap}">
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e1be00244ed6b09629525befc086ed2&libraries=services"></script>
							<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  
								
								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch('${bkc.bkcAddress}', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
								
								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">${bkc.bkcName}</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
							</script>
						</c:forEach>					
					</div>
					
					<div style="padding-top:30px;">						
						<!-- 다시예약하기 클릭시 해당 업체 예약페이지로 이동 -->
						<button type="button"  onclick="location.href='${pageContext.request.contextPath}/customer/booking/bookingCompanyDetailBooking?bkcId=${bk.bkcId}'">다시 예약하기</button>
						<!-- 예약상태 방문완료인 경우만 리뷰작성 가능 -->
						<c:forEach items="${list}" var="bk">
							<c:if test="${bk.bkState eq '방문완료'}">
								<button type="button" class="btn" data-toggle="modal" data-target="#reviewModal">리뷰쓰기</button>
							</c:if>
						</c:forEach>						
						<button type="button">pdf저장</button>
					</div>
					<!-- 리뷰작성 모달 -->
					<div class="modal fade" id="reviewModal" role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<form action="${pageContext.request.contextPath}/review/addReview" method="post" enctype="multipart/form-data">
									<c:forEach items="${list}" var="bk">
										<input type="hidden" name="bookingNo" value="${bk.bookingNo}">
									</c:forEach>	
									<div class="modal-header">
										<!-- 모달 이름 -->
										<h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div>
											<span>별점</span><br>
											<input type="radio" name="starRating" value="1">1
											<input type="radio" name="starRating" value="2">2
											<input type="radio" name="starRating" value="3">3
											<input type="radio" name="starRating" value="4">4
											<input type="radio" name="starRating" value="5">5
										</div>
										<div>
											<label>사진 첨부</label>
											<input type="file" name="file">
										</div>
										<textarea rows="5" cols="60" name="reviewMemo" placeholder="이용후기를 남겨주세요." style="width=400px;"></textarea>
									</div>
									<div class="modal-footer">
										<!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
										<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">작성</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->

	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mapmarker.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mapmarker_func.jquery.js"></script>

</body>
</html>