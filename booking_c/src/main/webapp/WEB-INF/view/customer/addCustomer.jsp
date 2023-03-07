<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<h2>고객 회원가입</h2>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/customer/addCustomer" enctype="multipart/form-data" id="addForm">
		<input type="hidden" name="customerRank" value="">
		<table border="1">
			<tr>
				<th>ID중복검사</th>
				<td>
					<input type="text" id="checkId" placeholder="사용할ID를 입력해주세요.">
					<button type="button" id="ckBtn">중복검사</button>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="customerId" id="id" disabled></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="customerPw" id="pw"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="customerName" id="name"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="customerNickname"></td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td>
					<input type="file" name="file" onchange="readURL(this);">
					<img id="preview" style="width: 150px; height: 80px;">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="customerPostcode"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="customerAddress"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="customerPhone"></td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td>
					<input type="text" name="customerEmail" id="email">
					<button type="button" id="emailCkBtn">인증번호 발송</button>
					<div id="emailSendMsg"></div>
				</td>
			</tr>
			<tr>
				<th>인증번호</th>
				<td>
					<input type="text" id="codeCk" name="" placeholder="인증번호를 입력해주세요." disabled>
					<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
					<div id="emailResultMsg"></div>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="customerBirth"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="customerGender" value="남">남
					<input type="radio" name="customerGender" value="여">여
				</td>
			</tr>
			<tr>
				<th>마케팅 수신 동의 여부</th>
				<td>
					<input type="checkbox" name="emailMarketingAccept" value="동의">동의
					<input type="checkbox" name="emailMarketingAccept" value="미동의">미동의
				</td>
			</tr>
			<tr>
				<th>개인정보 보관 동의 여부</th>
				<td>
					<input type="checkbox" name="infoAgree" value="동의">동의
					<input type="checkbox" name="infoAgree" value="미동의">미동의
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">회원가입</button>
	</form>
	<script>
	// ID 중복검사
	$('#ckBtn').click(function(){
			$.ajax({
				url:'idck'
				, type:'get'
				, data : {checkId:$('#checkId').val()}
				, success:function(model){ // model : 'yes' / 'no'
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
				//console.log(code);
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