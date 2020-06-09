 <%@page import="poly.dto.NoticeDTO" %>
 <%@page import="poly.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%
	NoticeDTO bDTO = (NoticeDTO)request.getAttribute("bDTO");
	String user_id = (String)session.getAttribute("SS_USER_ID");
	UserInfoDTO uDTO = (UserInfoDTO)request.getAttribute("uDTO");
	String user_Author = (String)session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	
<title>공지사항 상세보기</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/style_list.css">
<link rel="stylesheet" href="/css/bootstrap.min_table.css">

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
					<div class="row fullscreen d-flex align-items-center justify-content-start">
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
					<form method="POST" action="/notice/noticeModify.do">
						<input type="hidden" name="seq" value="<%=bDTO.getSeq()%>">
							<div class="form-group">
								<label for="text">제목</label> <%=bDTO.getTitle()%>			
								<br><br>
								
								
								<%=bDTO.getContent()%>
							<br>
						</div>
						<%
							if (user_id != null) {
						%>
						<%
							if (user_id.equals(uDTO.getUser_id()) || user_Author.equals("1")) {
						%>
							<input type="submit" class="btn btn-primary" id="reg_btn" value="수정하기" style="float: right; width: 10%; margig-right: 10px;" /> 
							<input type="button" class="btn btn-primary" id="reg_btn" style="float: right; width: 10%; margin-right: 10px;"
								onclick="location.href='/notice/noticeDelete.do?seq=<%=bDTO.getSeq()%>'"
								value="삭제하기" />
						<%
							}
							}
						%>

						<input type="button" class="btn btn-primary" style="float: right; width: 10%; margin-right: 10px;"
								onclick="location.href='/notice/noticeList.do'" value="돌아가기">
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- End callto-top Area -->
	<!-- start footer Area -->
	<footer class="footer-area">
		<div class="container">
			<!-- <div class="row pt-120 pb-80">

			</div> -->
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