<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
	List<String> pList = (List<String>) request.getAttribute("pList");
	List<Integer> iList = (List<Integer>) request.getAttribute("iList");
%>
	
<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Lyric analysis2</title>
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

<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	
	
	var str =  [];
	<%for(int i = 0 ; i<pList.size();i++){%>
		str.push({"word":"<%=pList.get(i)%>","count" : "<%=iList.get(i)%>"});
	<%}%>
	
	am4core.ready(function() {
		// Themes begin
		am4core.useTheme(am4themes_frozen);
		am4core.useTheme(am4themes_animated);
	  	// Themes end
		var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
		var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
		   series.randomness = 0.1;
		   series.labels.template.tooltipText = "{word}: {value}";
		   series.fontFamily = "Courier New";
		   series.data = str;
		   series.dataFields.word = "word";
		   series.dataFields.value = "count";
		   series.colors = new am4core.ColorSet();
		   series.colors.passOptions = {}; // makes it loop
	});
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
	
	<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Lyric analysis2</h2>
        </div>
      </div>
    </section><!-- End About Section -->

    <!-- ======= Skills Section ======= -->
 
			
				
						<div id="chartdiv"></div>



			

    <!-- ======= Facts Section ======= -->
   
    <!-- End Facts Section -->

    <!-- ======= Testimonials Section ======= -->
    <!-- End Testimonials Section -->

  </main><!-- End #main -->
	
	 <!-- ======= Footer ======= -->
  <footer id="footer" style="margin-top: 18%">
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
</body>
</html>