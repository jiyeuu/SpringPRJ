<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardDTO> bList = (List<BoardDTO>) request.getAttribute("bList");
	String user_name = (String) request.getAttribute("user_name");
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>게시판</title>

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
<link rel="stylesheet" href="/css/style1.css">
<link rel="stylesheet" href="/css/style_list.css">
<link rel="stylesheet" href="/css/style_star.css">
<link rel="stylesheet" href="/css/bootstrap.min_table.css">
<title>글 등록</title>


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

	    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>게시판</h2>
        </div>
      </div>
    </section><!-- End About Section -->
    
	<!-- Start callto-top Area -->
	<section class="callto-top-area section-gap">
		<div class="container">
			<div class="row justify-content-between callto-top-wrap pt-40 pb-40">
				<div class="col-lg-12 callto-top">

					<form name="f" method="POST" action="/board/boardRegProc.do"
						id="regform" onsubmit="return submitTest();">
						<div class="form-group"></div>
						<label for="text">제목</label>
						 <input type="text" class="form-control" id="title" name="title" /> <br><!-- exampleInputEmail1 -->
				
					

						<div class="form-group">
						<textarea class="table_textbox" name="contents" id="contents"
								style="width: 99%; height: 20em;" ></textarea>
						</div>

						<input type="submit" class="button1" style="width: 80px;" id="reg_btn1"
							value="등록">
					</form>
		
					
<script>
	function submitTest(){
        var title = $('#title').val();
        var contents = $('#contents').val();

        if(title==""){
            alert("제목을 입력해 주세요.");
            $('#title').focus();
            return false;
            
        }
        else if(contents==""){
            alert("내용을 입력해 주세요.");
            $('#contents').focus();
            return false;       
        }
    };
</script>



				</div>
			</div>
		</div>
	</section>
	<!-- End callto-top Area -->
	<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Lyric Aanalysis Page</span></strong>
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
	
	<!-- End footer Area -->

	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	

	
</body>
</html>