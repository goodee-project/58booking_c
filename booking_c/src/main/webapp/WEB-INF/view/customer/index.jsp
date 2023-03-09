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
		<title>프로젝트 설명</title>
		<link rel="shortcut icon" href="../resources/img/favicon.ico" type="image/x-icon">
	    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../resources/css/style.css" rel="stylesheet">
		<link href="../resources/css/vendors.css" rel="stylesheet">
	    <link href="../resources/css/blog.css" rel="stylesheet">
	    <link href="../resources/css/custom.css" rel="stylesheet">
	</head>
	<body>
		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3" id="sidebar">
					<div id="filters_col">
						<a data-bs-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">기능</a>
						<div class="collapse show" id="collapseFilters">
							<div class="filter_type">
								<h6>이득규</h6>
								<ul>
									<li>
									    <label><a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList">예약업체 검색페이지</a></label>
									</li>
								</ul>
								<h6>장준영</h6>
								<ul>
									<li>
									    <label><a href="${pageContext.request.contextPath }/log/loginCustomer">로그인</a></label>
									</li>
									<li>
									    <label><a href="${pageContext.request.contextPath }/log/addCustomer">회원가입</a></label>
									</li>
								</ul>
								<h6>최은서</h6>
								<ul>
									<li>
									    <label><a href="${pageContext.request.contextPath}/customer/booking/bookingList">예약 내역</a></label>
									</li>
									<li>
									    <label><a href="${pageContext.request.contextPath}/customer/pay/payList">페이 관리</a></label>
									</li>
									<li>
									    <label><a href="${pageContext.request.contextPath}/customer/point/pointList">포인트 내역</a></label>
									</li>
									<li>
									    <label><a href="${pageContext.request.contextPath}/customer/myPage/deactiveCustomer">회원 탈퇴</a></label>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
				<div class="col-lg-9" id="list_sidebar">
					<div class="isotope-wrapper">
						<div class="box_list isotope-item latest">
							<div class="row g-0">
								<div class="wrapper">
									<h3 style="font-weight: bold;">구디 아카데미 58기 파이널 프로젝트 예약 고객팀</h3>
									<a href="https://github.com/goodee-project/58booking_c.git" class="btn_1">깃허브</a>
									<a href="https://www.notion.so/70631427223d438dbefa955cd0e549fd?pvs=4" class="btn_1">스케줄 관리</a>
									<button type="button" class="btn_1" onclick="window.open('${pageContext.request.contextPath}/resources/iframe/UI & UX 통합.pdf')">화면설계</button>
									<button type="button" class="btn_1" onclick="window.open('${pageContext.request.contextPath}/resources/iframe/erd.png')">erd</button>
									<hr>
									<span>제목 : 통합 플랫폼(쇼핑몰, 예약업체, 광고 업체)</span><br>
									<span>팀원 : 이득규, 장준영, 최은서</span><br>
									<span>개발 내용 : Spring Framework 기반의 통합 플랫폼 구현</span><br>
									<hr>
									<h5 style="font-weight: bold;">과정</h5>
									<span>1) 쇼핑몰, 플랫폼팀과 협업하여 통합된 요구사항 도출 / 분석 / 설계</span><br>
									<span>2) oven(온라인 프로토타이핑 툴)을 활용한 UI/UX 제작</span><br>
									<span>3) 통합 DB 구성</span><br>
									<span>4) 코딩 작업 시작</span><br>
									<hr>
									<h5 style="font-weight: bold;">담당 기능</h5>
									<span> - 고객 : 내 정보 관리, 업체 검색, 상품 예약(예약 취소, 신고), 리뷰(작성) + 포인트 + 페이 + 예약 리스트, 페이 충전, 업체와 플랫폼과 1 : 1 채팅</span><br>
									<hr>
									<h5 style="font-weight: bold;">팀원 담당 기능 세부</h5>
									<span <a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList">예약업체 검색페이지</a>>&nbsp;&nbsp;이득규</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;1) 예약 업체 리스트 및 검색</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;2) 예약 업체 상세 페이지</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  해당 예약업체 메인 페이지</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약가능한 상품목록</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  해당 예약업체에 등록된 리뷰 내역</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약 업체 상호명&지도 표기(Kakao API)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;3) 예약 과정(구현 예정)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  기간 설정</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  옵션 설정</span><br>
									<br>
									<span style="font-weight: bold;">&nbsp;&nbsp;장준영</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;1) 회원가입 및 로그인</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;2) 내 정보 관리(구현 예정)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  아이디 찾기</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  패스워드 찾기</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  휴면 계정 풀기</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  비밀번호 재설정</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;3) 예약 과정(구현 예정)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약시 관련 내역(문서 변환 출력)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  리뷰 작성</span><br>
									<br>
									<span style="font-weight: bold;">&nbsp;&nbsp;최은서</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;1) 내 정보 상세보기 및 수정(구현 예정)</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;2) 예약 내역</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약리스트 출력</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약 취소</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  예약 신고</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;3) 리뷰 내역</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  리뷰리스트 출력</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;4) 포인트 내역</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  포인트리스트 출력</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;5) 페이 내역</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  페이리스트 출력</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  페이충전</span><br>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;6) 회원 탈퇴</span><br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>