<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html>
<head>


 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Music chart</title>
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



<script src="/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(window).on("load", function() {

		//페이지 로딩 완료 후, 멜론 순위가져오기 함수 실행함 
		getRank();
	});

	//멜론 순위가져오기
	function getRank() {

		//Ajax 호출
		$.ajax({
			url : "/bugs/getRank.do",
			type : "post",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(json) {

				var bugs_rank = "";

				for (var i = 0; i < json.length; i++) {
					bugs_rank += (json[i].rank + "위 | ");
					bugs_rank += ( json[i].song + " | ");
					bugs_rank += (json[i].singer + " <br> ");
					//bugs_rank += (json[i].str + "<br>");

				}

				$('#bugs_rank').html(bugs_rank);
			}
		})

	}
</script>
</head>
<body>
	
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
	
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

         <div class="section-title" style="padding-top: 30%;">
          <h2>Music chart</h2>
        </div>
      </div>
      
      
      
      
      
      
      
      
      
      
    </section><!-- End About Section -->
	<!-- ======= Skills Section ======= -->
    <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">
        <div class="login-page" style="padding-right: 100px">
          <div class="form" style="width: 150%; text-align: left; ">
            
	
	
	<div id="bugs_rank" style="width: 900px"></div>


	</div>
	</div>
	</div>
	</section>
	
	  <!-- ======= Footer ======= -->
 <footer id="footer" style="margin-top: 5%">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Lyric Aanalysis Page</span></strong>
      </div>
     
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
</body>
</html>


