<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
	<div>----------회원가입-----------</div>
	<form action="/userRegProc.do" method="POST">
		<div style="display: flex">
			<div>회원 아이디</div>
			<input type="text" name="userId"/>
		</div>
		<div style="display: flex">
			<div>회원 이름</div>
			<input type="text" name="userName"/>
		</div>
		<div style="display: flex">
			<div>회원 비밀번호</div>
			<input type="password" name="userPassword"/>
		</div>
		<input type="submit" value="회원등록하기">
	</form>
</body>
</html>