<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String jspRes = CmmUtil.nvl((String)request.getAttribute("res"), "0");
	
	String toMail = CmmUtil.nvl(request.getParameter("toMail"));
	String title = CmmUtil.nvl(request.getParameter("title"));
	String contents = CmmUtil.nvl(request.getParameter("contents"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(jspRes.equals("1")){
	out.println(toMail + "로 메일 전송이 성공하였습니다! ");
	out.println("메일 제목: "+ title);
	out.println("메일 내용: "+ contents);
}else{
	out.println(toMail + "로 메일 전송이 실패하셨습니다");
}
%>
</body>
</html>