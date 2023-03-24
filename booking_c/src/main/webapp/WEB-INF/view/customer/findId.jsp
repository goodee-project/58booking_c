<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
	<title>아이디 찾기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<style>
	.form-control {
		width:280px;
		height:30px;
		font-size:14px;
	}
	</style>
</head>
<body>
	<!-- 임시메뉴 -->
    <jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login" class="con">
		<aside style="width:30%;">
			<figure>
				<a href="index.html"><h2>아이디 찾기</h2></a>
			</figure>
				<div class="form-group">
					<label>이름</label>					
					<input class="form-control" name="customerName" id="name" placeholder="이름을 입력해주세요.">
					<div id="nameMsg"></div>
				</div>
				<div class="form-group">
					<label>이메일주소</label><br>
					<input type="text" name="customerEmail1" id="email1">
					<span>@</span>
					<select id="email2" name="customerEmail2">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="test.com">test.com</option>
					</select>
					<button type="button" id="emailCkBtn" class="btn btn-primary btn-sm">인증번호 발송</button>
					<div id="emailMsg"></div>
					<div id="emailSendMsg"></div>
				</div>
				<div class="form-group">
					<label>인증번호</label>
					<input class="form-control" type="text" id="codeCk" name="" placeholder="인증번호를 입력해주세요." disabled>
					<button type="button" id="codeCkBtn" class="btn btn-primary btn-sm" disabled>인증번호 확인</button>
					<div id="emailResultMsg"></div>
				</div>
				<div id="a"></div>
				<div id="pass-info" class="clearfix"></div>
				<button type="button" class="btn_1 rounded full-width add_top_30" id="addBtn">아이디찾기</button>
				<div class="text-center add_top_10">
					<strong><a href="${pageContext.request.contextPath}/log/loginCustomer">로그인</a></strong> /
					<strong><a href="${pageContext.request.contextPath}/log/findPw">비밀번호찾기</a></strong>
				</div>
			<div class="copy">Booking</div>
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/pw_strenght.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
	<h2>아이디 찾기</h2>
	<table border="1">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="customderName" id="name" placeholder="이름을 입력해주세요.">
				<div id="nameMsg"></div>
			</td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td>
				<input type="text" id="email1" name="customerEmail1">
				<span>@</span>
				<select id="email2" name="customerEmail2">
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="test.com">test.com</option>
				</select>
				<button type="button" id="emailCkBtn">인증번호 발송</button>
				<div id="emailMsg"></div>
				<div id="emailSendMsg"></div>
			</td>
		</tr>
		<tr>
			<th>인증번호</th>
			<td>
				<input type="text" id="codeCk" placeholder="인증번호를 입력해주세요." disabled>
				<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
				<div id="emailResultMsg"></div>
			</td>
		</tr>
	</table>
	
	<div id="a"></div>
	
	<script>
		$(document).ready(function(){
			var code = ''; // 인증번호를 담을 변수
			var email1 = '';
			var email2 = '';
			var name = '';
			
			//이메일 인증
			$('#emailCkBtn').click(function() {	
				
				if($('#email1').val() == ''){ // 이메일 유효성 확인
					$('#emailMsg').text('이메일을 입력해주세요.');
				}
				
				if ($('#name').val() == ''){ // 이름 입력 유효성 확인
					$('#nameMsg').text('이름을 입력해주세요.');
				}
				
				if ($('#name').val() != '' && $('#email1').val() != ''){
					$('#emailMsg').text('');
					$('#nameMsg').text('');
					$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
					
					// 유효성 확인 후 이메일 전송
					$.ajax({
						url:'emailCk'
						, type:'get'
						, data:{customerEmail1:$('#email1').val(), customerEmail2:$('#email2').val(), customnerName:$('#name').val()}
						, success:function(model) {
							code = model;
							console.log(code);
							
							if(code == 'fail'){
								$('#emailMsg').text('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');
								$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
							} else if (code == 'noResult'){
								$('#emailMsg').text('등록된 이메일이 없습니다. 입력한 이메일을 확인해주세요.');	
								$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
							} else {
								$('#emailMsg').text('');
								$('#emailSendMsg').text('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
								$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
								$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
								$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
								
								// 인증번호 전송 시점에 이메일, 이름 정보 변수에 저장(이후 아이디 조회에 사용)
								email1 = $('#email1').val();
								email2 = $('#email2').val();
								name = $('#name').val();
								
								console.log(email1);
								console.log(email2);
								console.log(name);
							}
						}
					});
				}
			});
			
			// 인증번호 비교
			$('#codeCkBtn').click(function() {
				if ($('#codeCk').val() == ''){ // 인증번호 입력 유효성 확인
					$('#codeMsg').text('인증번호를 입력해주세요.');
				} else {
					if($('#codeCk').val() == code){ // 인증번호 일치 시
						$('#nameMsg').text();
						$('#codeMsg').text();
						$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
						$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
						alert('이메일 인증에 성공하였습니다.');
						
						// 이메일 인증 성공 시 이메일과 이름으로 아이디 조회
						$.ajax({
							url:'findCustomerId'
							, type:'post'
							, data:{customerEmail:email1+'@'+email2, customerName:name}
							, success:function(model) {
								if(model == '' || null){
									var html = "<div id='resultId'>" + 
													"<div id='idHeader'><strong>아이디 조회결과</strong></div>"+
													"<div id='idbody'>등록된 아이디가 없습니다.</div>"+
												"</div>"
								} else {
									var id = model;
									var html = "<div id='resultId'>" + 
													"<div id='idHeader'><strong>아이디 조회결과</strong></div>"+
													"<div id='idbody'>"+id+"</div>"+
												"</div>"
								}
								$('#a').append(html);
							}
						});
					} else { // 인증번호 실패 시
						alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
					}
				}
			});
		});
	</script>
</body>
</html>