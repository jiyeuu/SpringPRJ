
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>로그인/회원가입</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--CSS============================================= -->
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	//아이디 중복체크
	 function test() {
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
							$("#checkid").text('사용가능한 아이디 입니다.');
							$('#submitinput').val("1");
						} else if (data == '1') {
							$("#checkid").text('사용불가능한 아이디 입니다.');
							$('#submitinput').val("0");
						}
					}
				});
			}
		} 
	/*
						if (data == '0') {
							alert("사용가능 아이디 입니다.")
							$('#submitinput').val("1");
						} else if (data == '1') {
							alert("중복된 아이디 입니다.")
							$('#submitinput').val("0");
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

	<!-- #header -->

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="container">
			<div class="overlay overlay-bg"></div>
			<div
				class="row fullscreen d-flex align-items-center justify-content-start">
				<div class="banner-content col-lg-8">
					<h3 class="text-uppercase">
						<br>

					</h3>


				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start callto-top Area -->
	<section class="callto-top-area section-gap">
		<div class="container">
			<div class="row justify-content-between callto-top-wrap pt-40 pb-40">
				<div class="col-lg-12 callto-top">
					<div class="forms">
						<ul class="tab-group">
							<li class="tab active"><a href="#login">로그인</a></li>
							<li class="tab"><a href="#signup">회원가입</a></li>
						</ul>
						<form id="login" name="Loginf" action="/user/getUserLoginCheck.do"
							onsubmit="return doLoginUserCheck(this);">
							<div class="input-field">
								<label for="text">아이디</label> <input type="text" name="user_id"
									required /> <label for="password">비밀번호</label> <input
									type="password" name="password" required /> <input
									type="submit" value="로그인" class="button" /> <input
									type="button" value="아이디찾기/비밀번호찾기" class="button"
									onclick="window.location='/user/FindForm.do'" />
							</div>
						</form>
						<!-- 회원 -->
						<form name="Regf" id="signup" action="/user/insertUserInfo.do"
							onsubmit="return submitTest();">
							<div class="input-field">
								<label for="user_name">이름</label> <input type="text"
									name="user_name" oninput="test_name()" required />
								<div id="name-success" style="display: none;">이름 형식이 아닙니다.(한글로 작성해 주세요)</div>

								<label for="user_id">아이디</label> 
								<input type="text" name="user_id" oninput="test();"  required /> 
								<div id="checkid"></div>
									<!--  <input type="button" value="중복확인" class="button" id="checkId" onclick="test();" />-->
							<labelfor="password">비밀번호</label>
								<div id="alert-danger1" style="display: none;">형식 올바르지
									않습니다(영문소문자, 숫자8~16)</div>
								<input type="password" name="password" id="pwd1" required /> <label
									for="password">비밀번호 확인</label>

								<div id="alert-success" style="display: none;">비밀번호 사용가능</div>
								<div id="alert-danger" style="display: none;">비밀번호 불가능(비밀번호가 일치하지 않습니다)</div>
								<input type="password" name="password" id="pwd2"
									oninput="checkPw()" required /> <label for="email">Email</label>
								<input type="email"  id="checkEmail"  oninput="test_email();" name="email" required/>
								<div id="check"></div>
								<input type="hidden" id="submitinput" value="0">
								 <input type="hidden" id="emailinput" value="0">
								 <input type="submit" value="회원가입" class="button" id="submitbtn" />
							</div>
						</form>
					</div>
					<script
						src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
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
				</div>
			</div>
		</div>
	</section>
	<!-- End callto-top Area -->


	<!-- start footer Area -->
	<footer class="footer-area">
		<div class="container">
			<!-- <div class="row pt-120 pb-80"></div> -->
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<!-- <script>document.write(new Date().getFullYear());
                                </script> --> 1920110002 |  by 강지연 <a href="https://colorlib.com" target="_blank"></a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="/js/easing.min.js"></script>
	<script src="/js/hoverIntent.js"></script>
	<script src="/js/superfish.min.js"></script>
	<script src="/js/jquery.ajaxchimp.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.nice-select.min.js"></script>
	<script src="/js/mail-script.js"></script>
	<script src="/js/main.js"></script>

</body>
</html>