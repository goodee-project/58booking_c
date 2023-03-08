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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
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
<title>고객 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	function readURL(input) { // 사진 미리보기
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
</script>
</head>
<body>
		<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside style="width:700px;">
			<figure>
				<a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky"></a>
			</figure>
			<form autocomplete="off" method="post" action="${pageContext.request.contextPath}/log/addCustomer" enctype="multipart/form-data" id="addForm">
				<div class="form-group">
					<label>ID중복검사</label>
					<input class="form-control" type="text" id="checkId" placeholder="사용할ID를 입력해주세요.">
					<button type="button" id="ckBtn" class="btn_1 outline">중복검사</button>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>아이디</label>
					<input class="form-control" type="text" name="customerId" id="id" readonly="readonly">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" type="password" name="customerPw" id="pw">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="form-group">
					<label>이름</label>
					<input class="form-control" type="text" name="customerName" id="name">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>닉네임</label>
					<input class="form-control" type="text" name="customerNickname">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>프로필사진</label>
					<input type="file" name="file" onchange="readURL(this);">
					<img id="preview" style="width: 150px; height: 80px;">
				</div>
				<div class="form-group">
					<label>우편번호</label>
					<input class="form-control" type="text" name="customerPostcode">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>주소</label>
					<input class="form-control" type="text" name="customerAddress">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>휴대폰번호</label>
					<input class="form-control" type="text" name="customerPhone">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>이메일주소</label>
					<input class="form-control" type="text" name="customerEmail" id="email">
					<button type="button" id="emailCkBtn" class="btn_1 outline">인증번호 발송</button>
					<div id="emailSendMsg"></div>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>인증번호</label>
					<input class="form-control" type="text" id="codeCk" name="" placeholder="인증번호를 입력해주세요." disabled>
					<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
					<div id="emailResultMsg"></div>
					<i class="icon_lock_alt"></i>
				</div>
				<div class="form-group">
					<label>생년월일</label>
					<input class="form-control" type="date" name="customerBirth">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>성별</label><br>
					<input type="radio" name="customerGender" value="남">남
					<input type="radio" name="customerGender" value="여">여
				</div>
				<div class="form-group">
					<label>마케팅 수신 동의 여부</label><br>
					<input type="checkbox" name="emailMarketingAccept" value="동의">동의
					<input type="checkbox" name="emailMarketingAccept" value="미동의">미동의
				</div>
				<div class="form-group">
					<label>개인정보 보관 동의 여부</label><br>
					<input type="checkbox" name="infoAgree" value="동의">동의
					<input type="checkbox" name="infoAgree" value="미동의">미동의
				</div>
				<div id="pass-info" class="clearfix"></div>
				<button type="button" class="btn_1 rounded full-width add_top_30" id="addBtn">회원가입</button>
				<div class="text-center add_top_10">이미 회원이신가요? <strong><a href="${pageContext.request.contextPath}/log/loginCustomer">로그인</a></strong></div>
			</form>
			<div class="copy">© Panagea</div>
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/pw_strenght.js"></script>
	<script>
	// ID 중복검사
	$('#ckBtn').click(function(){
			$.ajax({
				url:'idck'
				, type:'get'
				, data : {checkId:$('#checkId').val()}
				, success:function(model){ // model : 'yes' / 'no'
					console.log('model값:'+model);
					if(model=='yes') {
						// 사용가능한 아이디
						$('#id').val($('#checkId').val());
					} else {
						// 사용중인 아이디
						alert($('#checkId').val()+'는 사용중인 아이디입니다');
					}
				}
			});
		});
	$('#addBtn').click(function() {
		// 폼 유효성 검사
		if($('#id').val() == ''){
			alert('ID를 확인해주세요.');
			return;
		}
		if($('#pw').val() == ''){
			alert('비밀번호를 확인해주세요.');
			return;
		}
		if($('#name').val() == ''){
			alert('이름을 확인해주세요.');
			return;
		}
		
		// 폼 액션 전송
		$('#addForm').submit();
	});
	
	// 이메일 인증
	var code = ''; // 인증번호를 담을 변수
	$('#emailCkBtn').click(function() {
		$('#emailSendMsg').text('인증번호가 전송되었습니다.');
		$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
		$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
		$('#email').attr('disabled',true); // 중복 전송 방지위한 비활성화 + 인증완료 시 수정 방지
		$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
		
		$.ajax({
			// console.log('ajax');
			url:'emailCk'
			, type:'get'
			, data:{customerEmail:$('#email').val()}
			, success:function(model) {
				code = model;
				// console.log(code);
			}			
		});
	});
	
	// 인증번호 비교
	var ckResult = false; // 이메일 인증 성공 여부를 담을 변수 (false : 인증실패, true : 인증성공)
	$('#codeCkBtn').click(function() {
		if($('#codeCk').val() == code){ // 인증번호 일치 시
			$('#email').attr('disabled',true); // 중복 전송 방지위한 비활성화 + 인증완료 시 수정 방지
			$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
			$('#codeCk').attr('disabled',true); // 인증번호 입력 활성화
			$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
			alert('이메일 인증에 성공하였습니다.');
			ckResult = true;
		} else { // 인증번호 실패 시
			alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
		}
	});
	</script>
</body>
</html>