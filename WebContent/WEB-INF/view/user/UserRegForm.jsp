<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">

//아이디 중복체크
	function test() {
		var inputed = f.user_id.value;
		var CheckForm = /^[a-z0-9]{5,16}$/;
		if (!CheckForm.test(inputed)) {
			$('#submitbtn').prop("disabled", true);
			alert("형식이 올바르지 않습니다.(영문소문자,숫자 5~16글자)");
		} else {
			$.ajax({
				data : {
					user_id : inputed
				},
				url : "checkId.do",
				success : function(data) {
					if (data == '0') {
						alert("사용가능 아이디 입니다.")
						$('#submitbtn').prop("disabled", false);
					} else if (data == '1') {
						alert("중복된 아이디 입니다.")
						$('#submitbtn').prop("disabled", true);
					}
				}
			})
		}
	}
//비밀번호 일치 체크
	$(function checkPw() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submitbtn").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submitbtn").attr("disabled", "disabled");
				}
			}
		});
	});
	

</script>
</head>
<body>
	<!--
<br/>
<br/>
<form name="f" method="post" action="/user/insertUserInfo.do" onsubmit="return doRegUserCheck(this); ">
	  <div>
     	<font size="4" color="#000000">아이디</font>
		<input type="text" name="user_id" oninput="checkId()">
  	</div>
 	 <div>
      	<font size="4" color="#000000">이름</font>
      	<input type="text" name="user_name" >
  	</div>
  	<div>
     	<font size="4" color="#000000">비밀번호</font>
		<input type="password" name="password" id="pwd1" >
  	</div>
 	 <div>
      	<font size="4" color="#000000">비밀번호 확인</font>
      	<input type="password" name="password2" id="pwd2" oninput="checkPw()" >
      	<div id="alert-success">비밀번호 사용가능</div>
      	<div id="alert-danger">비밀번호 불가능</div>
  	</div>
  	 <div>
      	<font size="4" color="#000000">이메일</font>
      	<input type="text" name="email" >
  	</div>
  	 <div>
      	<font size="4" color="#000000">주소</font>
      	<input type="text" name="addr1" >
  	</div>
  	 <div>
      	<font size="4" color="#000000">상세</font>
      	<input type="text" name="addr2">
  	</div> 
   
  <div class="button">
      <button type="submit" id="submit">회원가입</button>
      <button type="submit" id="checkId" onclick="checkId();">중복확인</button>
  </div>
 
</form>-->

	<form name="f" method="post" action="/user/insertUserInfo.do">

		<div>
			<font size="4" color="#000000">이름</font> 
			<input type="text" name="user_name">
		</div>
		<div>
			<font size="4" color="#000000">아이디</font> 
			<input type="text" name="user_id"> 
			<input type="button" id="checkId" onclick="test();" value="중복확인">
		</div>

		<div>
			<font size="4" color="#000000">비밀번호</font>
			 <input type="password" name="password" id="pwd1">
		</div>
		<div>
			<font size="4" color="#000000">비밀번호 확인</font>
			 <input type="password" name="password2" id="pwd2" oninput="checkPw()">
			<div id="alert-success">비밀번호 사용가능</div>
			<div id="alert-danger">비밀번호 불가능</div>
		</div>
		<div>
			<font size="4" color="#000000">이메일</font> 
			<input type="email" name="email" >
		</div>


		<div class="button">
			<input type="submit" value="회원가입" id="submitbtn">
		</div>

	</form>

</body>
</html>