<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.UserInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	UserInfoDTO uDTO = (UserInfoDTO) request.getAttribute("uDTO");
	String user_Author = (String) session.getAttribute("user_Author");
	BoardDTO bDTO = (BoardDTO) request.getAttribute("bDTO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>로그인</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">


  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">
  <link href="/assets/css/style_index.css" rel="stylesheet">
  
<!-- <link rel="stylesheet" href="/css/main.css"> -->
<!-- <link rel="stylesheet" href="/css/style.css"> -->
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

	<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>게시판</h2>
        </div>
      </div>
    </section><!-- End About Section -->
    
	<!-- ======= Skills Section ======= -->
    <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">
      
   					<form method="POST" action="/board/boardModify.do">
						<input type="hidden" name="seq" value="<%=bDTO.getSeq()%>">
							<div class="form-group">
            					<label for="text">제목</label> 
            					<%=bDTO.getTitle()%>
            					<br><br>

							<%=bDTO.getContent()%>
							<br>
							</div>
							<%
								if (user_id == null) {
							%>

								
							<%}else{%>
							
							<%if (user_id.equals(uDTO.getUser_id()) || user_Author.equals("1")) {%>
							
							<input type="submit"  id="reg_btn" class="button1" value="수정하기" style="float: right; width: 10%; margig-right: 10px;" /> 
							<input type="button"  id="reg_btn" class="button1" style="float: right; width: 10%; margin-right: 10px;"
								onclick="location.href='/board/boardDelete.do?seq=<%=bDTO.getSeq()%>'"
								value="삭제하기" />
							<%}%>
							
							
							<%}%>
							

							<input type="button" class="button1"  style="float: right; width: 10%; margin-right: 10px;"
								onclick="location.href='/board/boardList.do'" value="돌아가기">
						</form>
				</div>
		
        <div class="row skills-content">
        </div>

      </div>
    </section><!-- End Skills Section -->

    <!-- ======= Facts Section ======= -->
   
    <!-- End Facts Section -->

    <!-- ======= Testimonials Section ======= -->
    <!-- End Testimonials Section -->

  </main><!-- End #main -->
  
  
 <!-- ======= Footer ======= -->
  <footer id="footer" style="margin-top: 4%">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Lyric Aanalysis Page</span></strong>
      </div>
      <div class="credits">
 
      </div>
    </div>
  </footer><!-- End  Footer -->
  
	 <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
  <script src="/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/assets/vendor/counterup/counterup.min.js"></script>
  <script src="/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/assets/vendor/venobox/venobox.min.js"></script>
  <script src="/assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	
			
</body>
</html>