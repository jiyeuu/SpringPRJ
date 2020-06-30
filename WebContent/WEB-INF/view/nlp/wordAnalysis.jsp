<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	//Controller로부터 전달받은 데이터
String res = CmmUtil.nvl((String) request.getAttribute("res"));
int pos = (int) request.getAttribute("pos");
int neg = (int) request.getAttribute("neg");

String user_id = (String) session.getAttribute("SS_USER_ID");
String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Lyric analysis1</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">
<link href="/assets/css/style_index.css" rel="stylesheet">


<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="/js/jquery-3.5.1.min.js"></script>

<!-- Chart code -->
<script type="text/javascript">
      //차트 벨류값 받아오기
   var positive = <%=pos%>
   var negative = <%=neg%>
   var cal = (positive)/(positive+negative);
   cal = cal*100;
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      // create chart
      // 차트위치 지정
      var chart = am4core.create("chartdiv", am4charts.GaugeChart);
		chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

		// 차트 크기
		chart.innerRadius = -25;

		var axis = chart.xAxes.push(new am4charts.ValueAxis());
		axis.min = 0;
		axis.max = 100;
		axis.strictMinMax = true;
		axis.renderer.grid.template.stroke = new am4core.InterfaceColorSet()
				.getFor("background");
		axis.renderer.grid.template.strokeOpacity = 0.3;

		var colorSet = new am4core.ColorSet();

		//차트 색상 지정
		var range0 = axis.axisRanges.create();
		range0.value = 0;
		range0.endValue = 20;
		range0.axisFill.fillOpacity = 1;
		range0.axisFill.fill = am4core.color("#5960a6");
		range0.axisFill.zIndex = -1;

		var range1 = axis.axisRanges.create();
		range1.value = 20;
		range1.endValue = 50;
		range1.axisFill.fillOpacity = 1;
		range1.axisFill.fill = am4core.color("#808cbc");
		range1.axisFill.zIndex = -1;
		
		var range2 = axis.axisRanges.create();
		range2.value = 50;
		range2.endValue = 80;
		range2.axisFill.fillOpacity = 1;
		range2.axisFill.fill = am4core.color("#e08bb2");
		range2.axisFill.zIndex = -1;
		
		var range3 = axis.axisRanges.create();
		range3.value = 80;
		range3.endValue = 100;
		range3.axisFill.fillOpacity = 1;
		range3.axisFill.fill = am4core.color("#d26a9d");
		range3.axisFill.zIndex = -1;

		// 차트 화살표 생성
		var hand = chart.hands.push(new am4charts.ClockHand());

		hand.showValue(cal, 100, am4core.ease.cubicOut);

	}); // end am4core.ready()
</script>
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

			<div class="section-title">
				<h2>Lyric analysis1</h2>
			</div>
		</div>
	</section>
	<!-- End About Section -->

	<!-- ======= Skills Section ======= -->
	<section id="skills" class="skills">
		<div class="container" data-aos="fade-up">
			<div class="login-page">
				<div class="form">

					<!--  <div class="chart chart1" data-percent="55"><span class="title"></span></div>
 -->
					<div id="chartdiv"></div>

				</div>
			</div>
		</div>
	</section>



	<!-- ======= Footer ======= -->
	<footer id="footer" style="margin-top: 21%">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Kelly</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/kelly-free-bootstrap-cv-resume-html-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End  Footer -->

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

