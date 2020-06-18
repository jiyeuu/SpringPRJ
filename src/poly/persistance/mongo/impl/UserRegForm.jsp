
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>	

<!-- Site Title -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/util.css">
	<link rel="stylesheet" type="text/css" href="/css/main.css">
<!--===============================================================================================-->

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	//아이디 중복체크
	/*  function test() {
			var inputed = Regf.user_id.value;
			var CheckForm = /^[a-z0-9]{4,12}$/;

			if (!CheckForm.test(inputed)) {
				$("#checkid").text("형식이 올바르지 않습니다.(영문소문자, 숫자 4~12글자)");
				$('#submitinput').val("0");
			} else {
				$.ajax({
					data : {
						user_id : inputed
					},
					url : "checkId.do",
					success : function(data) {
						if (data == '0') {
							$("#checkId").text('사용가능한 아이디 입니다.');
							$('#submitinput').val("1");
						} else if (data == '1') {
							$("#checkid").text('사용불가능한 아이디 입니다.');
							$('#submitinput').val("0");
						}
					}
				});
			}
		} 
 */
	
	//이메일 중복체크
	 function test_email() {
			var inputed = Regf.email.value;
			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

			if (!regex.test(inputed)) {
				$("#check").text('이메일 형식이 올바르지 않습니다.');
				$('#emailinput').val("0");
			} else {
				$.ajax({
					data : {
						email : inputed
					},
					url : "checkEmail.do",
					success : function(data) {
						if (data == '0') {
							$("#check").text('사용가능한 이메일 입니다.');
							$('#emailinput').val("1");
						} else if (data == '1') {
							$("#check").text('사용불가능한 이메일 입니다.');
							$('#emailinput').val("0");
						}
					}
				});
			}
		} 
	
	
	//비밀번호 일치 체크
	$(function checkPw() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			var CheckForm = /^[a-z0-9]{8,16}$/;
			if (!CheckForm.test(pwd1)) {
				$('#submitbtn').prop("disabled", true);
				
			if(pwd1!=""){	
				$("#alert-danger1").show();
			}
			
			} else{
			 	if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-danger1").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submitbtn").removeAttr("disabled");
					} else {
						$("#alert-danger1").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submitbtn").attr("disabled", "disabled");
					}
			  	}
			}
		});
	});
	
	
	//이름 형식 체크
	function test_name() {
		var name = Regf.user_name.value;
		var CheckForm = /^[가-힣]+$/;

		if (!CheckForm.test(name)) {
			$("#name-success").show();
			$('#submitbtn').prop("disabled", true);

		} else {
			$("#name-success").hide();
		}
	}
	
	function test() {
		var id = Regf.user_id.value;
		var CheckForm = /^[a-z0-9]{4,12}$/;

		if (!CheckForm.test(id)) {
			$("#id-success").show();
			$('#submitbtn').prop("disabled", true);

		} else {
			$("#id-success").text('사용가능한 아이디 입니다.');
		}
	}
	
	
	
</script>
</head>
<body>
<!-- #header -->
	<%
		if (user_id != null) {
	%>
	<%
		if (user_Author.equals("1")) {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-admin.jsp"%>
	<%
		} else {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-login.jsp"%>
	<%
		}
	%>
	<%
		} else {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-logout.jsp"%>
	<%
		}
	%>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w"
				name="Regf" id="signup" action="/user/insertUserInfo.do" onsubmit="return submitTest();">
					<span class="login100-form-title p-b-51">
						Sign Up
					</span>
					<!--이름-->
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="user_name" oninput="test_name()" placeholder="name" required >
						<span class="focus-input100"></span>	
					</div>
					<div 
					id="name-success" style="display: none;">이름 형식이 올바르지 않습니다. (한글로 작성해 주세요)</div>
					
					<!--아이디-->
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="user_id" oninput="test();" placeholder="ID" required >
						<span class="focus-input100"></span>
					</div>
					<!-- 	<div id="checkid"></div> -->
					<div 
					id="id-success" style="display: none;">형식이 올바르지 않습니다. (영문소문자, 숫자 4~12글자)</div>
						
				
					<!--비밀번호-->
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100"  id="pwd1" type="password" name="password" placeholder="Password" required >
						<span class="focus-input100"></span>
					</div>
					<div 
						id="alert-danger1" style="display: none;">형식 올바르지 않습니다(영문소문자, 숫자8~16)</div>
						
					<!--비밀번호 확인-->
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100"  id="pwd2" type="password" name="password" oninput="checkPw()" placeholder="Password check" required >
						<span class="focus-input100"></span>
					</div>
					<div id="alert-success" style="display: none;">
						비밀번호 사용가능</div>
					<div id="alert-danger" style="display: none;">
						비밀번호 불가능(비밀번호가 일치하지 않습니다)</div>

					<!--이메일-->
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" id="checkEmail" type="email" name="email" oninput="test_email();" placeholder="email" required >
						<span class="focus-input100"></span>
					</div>
					<div id="check"></div>	
					
					<input type="hidden" id="submitinput" value="0">
					<input type="hidden" id="emailinput" value="0">
					<!--로그인 버튼-->
					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn button" id="submitbtn"  
							type="submit" value="회원가입" >
					</div>

					<div class="find_info" style="margin-left: 81%;">
						<a target="_blank" id="idinquiry" href="/user/LoginForm.do">뒤로가기</a> 
						<span class="bar" aria-hidden="true">|</span> 
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script type="text/javascript">
			
		$(document)
			.ready(function() {
				$('.tab a').on(
					'click',function(e) {
						e.preventDefault();
						$(this).parent().addClass('active');
						$(this).parent().siblings().removeClass('active');

						var href = $(this).attr('href');
						$('.forms > form').hide();
						$(href).fadeIn(500);
					});
				});
		</script>
	 	<script type="text/javascript">
		function submitTest(){
			var subinput = $("#submitinput").val();
			var emailinput = $("#emailinput").val();
			if(subinput=='0'){
				alert("아이디 중복 체크를 해주세요.");
				return false;
			}
			if(emailinput=='0'){
				alert("이메일 중복 체크를 해주세요.");
				return false;
			}
			return true;
			
		}
		</script> 
<!--===============================================================================================-->
	<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/bootstrap/js/popper.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/daterangepicker/moment.min.js"></script>
	<script src="/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/js/main.js"></script>

</body>
</html>