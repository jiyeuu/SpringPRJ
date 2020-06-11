<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String user_id = (String)session.getAttribute("SS_USER_ID");
	String user_Author = (String)session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html>
<head>
	<title>아이디 찾기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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

	
   

<script type="text/javascript">
  
	/*function pw_search(){
	    var f = document.pw_f;
	  if(f.mem_id.value==""){
	            alert("ID를 입력해주세요.");
	            f.mem_id.focus();
	            return;
	        }
	        if(f.mem_email.value=="") {
	            alert("E-mail을 입력해주세요.");
	            f.mem_email.focus();
	            return;
	        }
	f.submit();
	}*/
</script>
</head>
<body>
<!-- #header -->
	<%if(user_id!=null){ %>
		<%if(user_Author.equals("1")) {%>
			<%@include file="/WEB-INF/view/frame/topbar-admin.jsp" %>
		<%} else { %>
			<%@include file="/WEB-INF/view/frame/topbar-login.jsp" %>
		<%} %>
	<%} else {%>
		<%@include file="/WEB-INF/view/frame/topbar-logout.jsp" %>
	<%} %>
	
		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w"
				name="Regf" id="IDf" action="/user/findingId.do" onsubmit="return findId(this)">
					<span class="login100-form-title p-b-51">
						ID Find
					</span>

					<!--이름-->
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="user_name" oninput="test_name()" placeholder="name">
						<span class="focus-input100"></span>
						<div id="name-success" style="display: none;">이름 형식이 아닙니다.(한글로 작성해 주세요)</div>
					</div>

					<!--이메일-->
					<div class="wrap-input100 validate-input m-b-16" data-validate = "email is required">
						<input class="input100" id="checkEmail" type="email" name="email" oninput="test_email();" placeholder="email">
						<span class="focus-input100"></span>
						<div id="check"></div>	
					</div>
					<input type="hidden" id="submitinput" value="0">
					<input type="hidden" id="emailinput" value="0">
					<!--버튼-->
					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn button" id="submitbtn"  
							type="submit" value="아이디 찾기" >
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