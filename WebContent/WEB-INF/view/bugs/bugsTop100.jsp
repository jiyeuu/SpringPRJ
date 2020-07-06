<%@page import="java.util.ArrayList"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.BugsDTO"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BugsDTO> rList = (List<BugsDTO>) request.getAttribute("rList");	
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%!private Logger log = Logger.getLogger(this.getClass()); %>
<%
if(rList==null){
	
	rList = new ArrayList<BugsDTO>();
}
log.info("############"+rList.size()); %>

<% 
	int i = rList.size();
	for(int a = 0; a < i; a++) { 
	%>
	
	<div>
	
	<%=rList.get(a).getRank() %>
	<%=rList.get(a).getSong() %>
	<%=rList.get(a).getSinger() %>
	</div>
	
	<%} %>



</body>
</html>