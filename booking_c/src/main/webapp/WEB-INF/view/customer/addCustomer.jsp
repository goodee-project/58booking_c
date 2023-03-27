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
		<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	   
	    <!-- BASE CSS -->
	    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">
		
		<!-- Icon fonts-->
		<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	   
	    <!-- YOUR CUSTOM CSS -->
	    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
		<title>고객 회원가입</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			//다음 우편번호 API
			function execPostCode() {
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
			           console.log(data.zonecode);
			           console.log(fullRoadAddr);
			           
			           
			           $("[name=customerPostcode]").val(data.zonecode);
			           $("[name=customerAddress]").val(fullRoadAddr);
			           
			           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
			           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
			           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			       }
			    }).open();
			}
			
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
		<style>
			.con {
				position: absolute;
				top: 50%;
				left: 35%;
				background: #f00;
				margin: -50px 0 0 -50px;
			}
			div {
				margin : 10px;
			}
			label {
				font-weight : bold;
			}
		</style>
	</head>
<body>
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login" class="con">
		<aside style="width:700px;">
			<figure>
				<a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky"></a>
			</figure>
			<form method="post" action="${pageContext.request.contextPath}/log/addCustomer" enctype="multipart/form-data" id="addForm">
				<input type="hidden" id="email" name="customerEmail">	
				<div>
					<label>ID중복검사</label><br>
					<input type="text" id="checkId" placeholder="사용할ID를 입력해주세요." style="width:350px; height:40px;">
					<button type="button" id="ckBtn" class="btn_1 outline btn-sm">중복검사</button>
				</div>
				<div>
					<label>아이디</label>
					<input class="form-control" type="text" name="customerId" id="id" readonly="readonly">
				</div>
				<div class="main" style="position: relative;">
					<label>비밀번호</label>
					<input class="form-control" type="password" name="customerPw" id="pw">
					<i class="fa fa-eye fa-lg" id="show" style="position: absolute; left: 90%; top: 40px;"></i>
				</div>
				<div>
					<label>이름</label>
					<input class="form-control" type="text" name="customerName" id="name">
				</div>
				<div>
					<label>닉네임</label>
					<input class="form-control" type="text" name="customerNickname" id="nick">
				</div>
				<div>
					<label>프로필사진</label><br>
					<input type="file" id="profile" name="file" onchange="readURL(this);">
					<img id="preview" style="width: 150px; height: 80px;">
				</div>
				<div>
					<label>우편번호</label>
					<button type="button" style="float:rigtht; width:150px; height:25px; padding:1px; font-size:13px;" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
					<input class="form-control" placeholder="우편번호" name="customerPostcode" id="addr1" type="text" readonly="readonly">
				</div>
				<div>
					<label>주소</label>
					<input class="form-control" placeholder="도로명 주소" name="customerAddress" id="addr2" type="text" readonly="readonly">
				</div>
				<div>
					<label>휴대폰번호</label>
					<input class="form-control" type="text" name="customerPhone" id="phone">
				</div>
				<div>
					<label>이메일주소</label><br>
					<input type="text" name="customerEmail1" id="email1" style="width:150px;">
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
					<div id="emailSendMsg"></div>
				</div>
				<div>
					<label>인증번호</label><br>
					<input type="text" id="codeCk" name="" placeholder="인증번호를 입력해주세요." disabled style="width:250px;">
					<button type="button" id="codeCkBtn" class="btn btn-primary btn-sm" disabled>인증번호 확인</button>
					<div id="emailResultMsg"></div>
				</div>
				<div>
					<label>생년월일</label>
					<input class="form-control" type="date" name="customerBirth" id="birth">
				</div>
				<div>
					<label>성별</label><br>
					<input type="radio" class="gender" name="customerGender" value="남">남
					<input type="radio" class="gender" name="customerGender" value="여">여
				</div><br>
				<div>
					<label>마케팅 수신 동의 여부(선택)</label>
					<p>각종 이벤트 안내 및 다양한 정보들을 이메일로 받아보시겠습니까?</p>
					<input type="radio" name="emailMarketingAccept" value="동의">동의
					<input type="radio" name="emailMarketingAccept" value="미동의">미동의
				</div><br>
				<div>
					<label>개인정보 보관 동의 여부(필수)</label>
					<p>가. 개인정보의 수집 및 이용 목적</p>
					<p>① 저희 포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
					이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</p>
					<p>1. 예약포털 서비스 제공을 위한 회원관리</p>
					<p>1) 예약 신청 및 취소 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 개인정보를
					   처리합니다.</p>
					<input type="radio" name="infoAgree" value="동의">동의
					<input type="radio" name="infoAgree" value="미동의">미동의
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		// 비밀번호 보이게
	    $('.main i').on('click',function(){ 
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
		
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
		
		// 이메일 인증
		var code = ''; // 인증번호를 담을 변수
		$('#emailCkBtn').click(function() {
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				alert('이메일을 입력해주세요.');
			} else {
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{customerEmail1:$('#email1').val(), customerEmail2:$('#email2').val()}
					, success:function(model) {
						code = model;
						console.log(code);
						
						if(code == 'fail'){
							alert('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');
							$('#email').attr('disabled',false); // 입력 재활성화
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else {
							alert('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
							$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
							$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
							$('#email').attr('value', $('#email1').val()+'@'+$('#email2').val());
						}
					}			
				});
			}
		});
		
		// 인증번호 비교
		var ckResult = false; // 이메일 인증 성공 여부를 담을 변수 (false : 인증실패, true : 인증성공)
		$('#codeCkBtn').click(function() {
			if($('#codeCk').val() == code){ // 인증번호 일치 시
				$('#email1').attr('readonly',true);
				$('#email2').attr('readonly',true);
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
				alert('이메일 인증에 성공하였습니다.');
				ckResult = true;
				console.log(ckResult);
			} else { // 인증번호 실패 시
				alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
			}
		});
		
		// 유효성 검사 후 폼 제출
		var ck = false;
		$('#addBtn').click(function(){
			console.log('유효성, 정규식 검사 결과 :'+formCheck());
			if(ck){
				$('#addForm').submit();
				alert('회원가입이 완료되었습니다.');
			}
		});
		
		formCheck = function() {
			// 비밀번호 정규식
			var password = $('#pw').val();
			console.log("비밀번호 :"+password);
			var num = password.search(/[0-9]/g);
			var eng = password.search(/[a-z]/ig);
			var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			// 동의 여부
			var agreeValue = $(':radio[name="infoAgree"]:checked').val();
			console.log(agreeValue);
			
			// 폼 유효성 검사
			if($('#id').val() == ''){
				alert('ID를 확인해주세요.');
				return false;
			} else if($('#pw').val() == ''){
				alert('비밀번호를 확인해주세요.');
				return false;
			} else if($('#name').val() == ''){
				alert('이름을 확인해주세요.');
				return false;
			} else if($('#nick').val() == ''){
				alert('닉네임을 확인해주세요.');
				return false;
			} else if($('#addr1').val() == ''){
				alert('주소를 확인해주세요.');
				return false;
			} else if($('#profile').val() == ''){
				alert('프로필사진을 등록해주세요.');
				return false;
			} else if($('#phone').val() == ''){
				alert('휴대폰번호를 확인해주세요.');
				return false;
			} else if(ckResult == false){
				alert('이메일 인증을 완료해주세요.');
				return false;
			} else if($('#birth').val() == ''){
				alert('생년월일을 확인해주세요.');
				return false;
			} else if($(':radio[name="customerGender"]:checked').length < 1){
				alert('성별을 선택해주세요.');
				return false;
			} else if ($(':radio[name="emailMarketingAccept"]:checked').length < 1){ 
				alert("마케팅 수신 약관을 확인해주세요.");
				return false;
			} else if(agreeValue == '미동의'){
				alert('개인정보 수집 약관에 동의해주셔야 가입이 가능합니다.');
				return false;
			} else if(password.length < 8 || password.length > 20){
				alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
				return false;
			} else if(password.search(/\s/) != -1){
				alert("비밀번호는 공백 없이 입력해주세요.");
				return false;
			} else if(num < 0 || eng < 0 || spe < 0 ){
				alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				return false;
			} else {
				console.log("통과"); 
				ck = true;
			}
			return true;
		}
	});
	</script>
</body>
</html>