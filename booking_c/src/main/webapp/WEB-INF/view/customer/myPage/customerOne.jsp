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
		<title>마이페이지 | 내 정보 보기</title>
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
	    <style>
	    	th {
	    		width: 100px;
	    	}
	    	
	    	tr {
	    		height: 57px;
	    	}

			#textarea {
				height: 70px;
				resize: none;
			}
	    	.box {
			    width: 150px;
			    height: 150px; 
			    border-radius: 70%;
			    overflow: hidden;
			}
			.profile {
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			}
	    </style>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	    <script>
	    	$(document).ready(function() {
	    		$('#modifyBtn').click(function() {
	    			var html = `<table class="table table-borderless">
									<tr>
										<td rowspan="13" style="width: 240px;">
											<div class="box">
												<img id="preview" class="profile" src="${pageContext.request.contextPath}/upload/${customerOne.customerImgSaveName}" width="150" height="150">
											</div>
											<input type="hidden" name="fileName" value="${customerOne.customerImgSaveName}">
											<input type="file" name="file" id="file" style="width: 220px;" class="form-control">
										</td>
										<th>아이디</th>
										<td>
											${customerOne.customerId}
											<input type="hidden" name="customerId" value="${customerOne.customerId}">
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											****
											 
										</td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td><input type="text" name="customerNickname" class="form-control" value="${customerOne.customerNickname}" style="width: 250px;"></td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${customerOne.customerName}</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${customerOne.customerGender}</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>
											<c:set var="birth" value="${customerOne.customerBirth}"/>
											${fn:substring(birth,0,4)}년 ${fn:substring(birth,4,6)}월 ${fn:substring(birth,6,8)}일
										</td>
									</tr>
									<tr>
										<th>나이</th>
										<td>만 ${customerOne.customerAge}세</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>
											<div class="row">
												<c:set var="phone" value="${customerOne.customerPhone}"/>
												<div class="col-lg-3"><input type="text" id="customerPhone1" class="form-control" value="${fn:substring(phone,0,3)}" style="width: 100px;"></div>
												<div class="col-lg-1">-</div>
												<div class="col-lg-3"><input type="text" id="customerPhone2" class="form-control" value="${fn:substring(phone,3,7)}" style="width: 100px;"></div>
												<div class="col-lg-1">-</div>
												<div class="col-lg-3"><input type="text" id="customerPhone3" class="form-control" value="${fn:substring(phone,7,12)}" style="width: 100px;"></div>
												<input type="hidden" name="customerPhone">
											</div>
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${customerOne.customerEmail}</td>
									</tr>
									<tr>
										<th>우편번호</th>
										<td><input type="text" name="customerPostcode" class="form-control" value="${customerOne.customerPostcode}" style="width: 250px;"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<textarea rows="5" class="form-control" name="customerAddress" id="textarea" readonly>${customerOne.customerAddress}</textarea>
											<button type="button" class="btn_1" onclick="postCode();"> 우편번호 찾기</button>
										</td>
									</tr>
									<tr>
										<th>포인트</th>
										<td><fmt:formatNumber value="${customerOne.customerPoint}" pattern="###,###,###,###"/>P</td>
									</tr>
									<tr>
										<th>페이</th>
										<td><fmt:formatNumber value="${customerOne.customerPay}" pattern="###,###,###,###"/>원</td>
									</tr>
								</table>
								<div align="right">
									<button type="button" class="btn_1" id="modifyBtn2">수정</button>
								</div>
								
								`
    				$(this.form).html(html);
	    			$('#modifyBtn2').click(function(){
		    			$('input[name=customerPhone]').val($('#customerPhone1').val()+$('#customerPhone2').val()+$('#customerPhone3').val());
		    			$('#modifyForm').submit();
		    		});
	    			
	    			function readURL(input) {
	    				if (input.files && input.files[0]) {
	    					var reader = new FileReader();
	    					reader.onload = function(e) {
	    						$('#preview').attr('src', e.target.result); 
	    					}
	    					reader.readAsDataURL(input.files[0]);
	    				}
	    			}

	    			$(":input[name='file']").change(function() {
	    				if( $(":input[name='file']").val() == '' ) {
	    					$('#preview').attr('src' , '');  
	    				}
	    				readURL(this);
	    			});
	    		});
	    	});
	    	function postCode() {
	    	    new daum.Postcode({
	    	        oncomplete: function(data) {
	    	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	    	
	    	           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	    	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	    	           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	    	           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	    	
	    	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	    	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	    	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	    	               extraRoadAddr += data.bname;
	    	           }
	    	           // 건물명이 있고, 공동주택일 경우 추가한다.
	    	           if(data.buildingName !== '' && data.apartment === 'Y'){
	    	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	    	           }
	    	           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	    	           if(extraRoadAddr !== ''){
	    	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	    	           }
	    	           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	    	           if(fullRoadAddr !== ''){
	    	               fullRoadAddr += extraRoadAddr;
	    	           }
	    	
	    	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	    	           
	    	           $("[name=customerPostcode]").val(data.zonecode);
	    	           $("[name=customerAddress]").val(fullRoadAddr);
	    	       }
	    	    }).open();
	    	}
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
										<h3 style="font-weight: bold;">내 정보</h3>
									</div>
									<form action="${pageContext.request.contextPath}/customer/myPage/updateCustomerOne" method="post" id="modifyForm" enctype="multipart/form-data">
										<table class="table table-borderless">
											<tr>
												<td rowspan="13" style="width: 240px;">
													<div class="box">
														<img class="profile" src="${pageContext.request.contextPath}/upload/${customerOne.customerImgSaveName}" width="150" height="150">
													</div>
												</td>
												<th>아이디</th>
												<td>${customerOne.customerId}</td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td>
													****
													<button type="button" class="btn_1" onclick="location.href='${pageContext.request.contextPath}/log/modifyPw?email=${customerOne.customerEmail}&id=${customerOne.customerId}'">변경</button> 
												</td>
											</tr>
											<tr>
												<th>닉네임</th>
												<td>${customerOne.customerNickname}</td>
											</tr>
											<tr>
												<th>이름</th>
												<td>${customerOne.customerName}</td>
											</tr>
											<tr>
												<th>성별</th>
												<td>${customerOne.customerGender}</td>
											</tr>
											<tr>
												<th>생년월일</th>
												<td>
													<c:set var="birth" value="${customerOne.customerBirth}"/>
													${fn:substring(birth,0,4)}년 ${fn:substring(birth,4,6)}월 ${fn:substring(birth,6,8)}일
												</td>
											</tr>
											<tr>
												<th>나이</th>
												<td>만 ${customerOne.customerAge}세</td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td>
													<c:set var="phone" value="${customerOne.customerPhone}"/>
													${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,12)}
												</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td>${customerOne.customerEmail}</td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td>${customerOne.customerPostcode}</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>${customerOne.customerAddress}</td>
											</tr>
											<tr>
												<th>포인트</th>
												<td><fmt:formatNumber value="${customerOne.customerPoint}" pattern="###,###,###,###"/>P</td>
											</tr>
											<tr>
												<th>페이</th>
												<td><fmt:formatNumber value="${customerOne.customerPay}" pattern="###,###,###,###"/>원</td>
											</tr>
										</table>
										<div align="right">
											<button id="modifyBtn" class="btn_1" type="button">정보 수정</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
	</body>
</html>