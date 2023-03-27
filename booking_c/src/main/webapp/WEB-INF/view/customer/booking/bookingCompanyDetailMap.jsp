<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
       <meta name="author" content="Ansonika">
       <title>${bookingCompanyDetailCommon.bkcName}</title>
       <link rel="shortcut icon" href="../../resources/img/favicon.ico" type="image/x-icon">
       <link rel="apple-touch-icon" type="image/x-icon" href="../../resources/img/apple-touch-icon-57x57-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../../resources/img/apple-touch-icon-72x72-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../../resources/img/apple-touch-icon-114x114-precomposed.png">
       <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../../resources/img/apple-touch-icon-144x144-precomposed.png">
       <link rel="preconnect" href="https://fonts.gstatic.com">
       <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
       <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
       <link href="../../resources/css/style.css" rel="stylesheet">
      <link href="../../resources/css/vendors.css" rel="stylesheet">
       <link href="../../resources/css/custom.css" rel="stylesheet">
   </head>
	<body class="datepicker_mobile_full">
		<div id="page" class="theia-exception">
			<main>
				<section class="hero_in restaurants_detail">
					<div class="wrapper">
						<div class="container">
							<h1 class="fadeInUp"><span></span>Restaurant detail page</h1>
						</div>
					</div>
				</section>
				<div class="bg_color_1">
					<!-- 업체정보 공통 -->
   					<jsp:include page="/WEB-INF/view/customer/booking/bookingCompanyDetailCommon.jsp"></jsp:include>
				</div>
				<div class="bg_color_1">
					<div class="container margin_60_35">
						<div class="row">
							<div class="col-lg-8">
								<div id="map" style="width:550px;height:350px; margin: auto;"></div>
							</div>
							<div class="col-lg-4">
								<c:forEach var="bkc" items="${bookingCompanyDetailMap }">
									<h6><i class="icon-location"></i>${bkc.bkcAddress}</h6>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="toTop"></div>
		<c:forEach var="bkc" items="${bookingCompanyDetailMap }">
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
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
		<script src="../../resources/js/input_qty.js"></script>
	</body>
</html>