<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 업체 로그인</title>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- Icon fonts-->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- Your custom styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- 쿠키 사용 -->


<script>
	$(document).ready(function(){
		
		// 로그인 유효성
		$('#loginBtn').click(function(){
			
			if($('#id').val() == ''){
				alert('아이디를 입력해주세요.');
				return;
			}
			
			if($('#key').val() == ''){
				alert('비밀번호를 입력해주세요.');
				return;
			}
			$('#loginForm').submit();
		});
	});
	
</script>
<script>
$(document).ready(function(){
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
});
</script>
<style>
div.main{
    position: relative;
    padding: 20px;
}
div.main input{
    width: 300px;
    height: 30px;
    border: 0;
    text-indent: 10px;
}
div.main i{
    position: absolute;
    left: 75%;
    top: 27px;
}
</style>
</head>
<body class="fixed-nav sticky-footer" id="page-top">
	<!-- Navigation-->
	<!-- /Navigation-->
	
	<div class="content-wrapper w-75 mx-auto" style="margin-left:0px">
		<div class="container-fluid">
		<button type=button id="test" style="display:none;">dddd</button>
			<!-- 본문 입력 -->
			<div class="box_general w-50 mx-auto pt-4 pb-2">
				<form action="${pageContext.request.contextPath}/beforeLogin/loginCompany" method="post" id="loginForm">
					<!-- 로그인 폼 -->
					<table class="table table-borderless w-50 mx-auto">
						<tr>
							<td class="text-center mt-2"><h2>COMPANY LOGIN</h2></td>
						</tr>
						<tr>
							<td>
								<div><strong>ID</strong></div>
								<div>
									<input type="text" id="id" name="companyId" class="form-control" placeholder="Enter ID">	
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="main">
  <input type="password" placeholder="비밀번호를 입력하세요" id="key">
  <i class="fa fa-eye fa-lg"></i>
</div>

							</td>
						</tr>
						<tr>
							<td><!-- 로그인 정보 저장 여부 -->
								<div>
									<label>
										<input type="checkbox" id="saveLoginInfo">
										<span class="checkmark">Remember me</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><!-- 로그인 버튼 -->
								<div class="text-center mb-5">
									<button type="button" id="loginBtn" class="btn btn-lg btn-primary">LOGIN</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><!-- 아이디찾기/비밀번호 찾기 링크 -->
								<div class="text-center mb-1 mt-3">
									<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디 찾기</a>
									<span> | </span>
									<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호 찾기</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="text-center mb-4">
									<strong>새로운 업체 등록을 원하시나요? <a href="${pageContext.request.contextPath}/beforeLogin/addCompany">Sign up</a></strong>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div><!-- 본문 끝 -->
		</div>
	</div>
	
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/dropzone.min.js"></script>
</body>
</html>