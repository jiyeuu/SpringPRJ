<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>아이디찾기</title>
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

 <style>
.find_info {
    font-size: 13px;
    line-height: 14px;
    padding-top: 20px;
    text-align: center;
    color: #8e8e8e;
    border-top: 1px solid #e4e4e5;
}

 </style>

</head>
<body>
<main id="main">

	<!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container" data-aos="fade-up">
	
			<div class="section-title">
				<h2>비밀번호 변경</h2>
			</div>
		</div>
	</section>
	<!-- End About Section -->
	
	<!-- ======= Skills Section ======= -->
	<section id="skills" class="skills">
			<div class="container" data-aos="fade-up">
				<div class="login-page">
					<div class="forms">

						<form class="login-form" name="chpwdForm" id="login" action="/user/changePw.do">
							<div id="alert-danger1" style="display: none;">형식 올바르지
								않습니다(영문소문자, 숫자8~16)</div>
							<input type="password" class="input" name="password" id="pwd1" required /> 
							<input type="password" class="input" name="password" id="pwd2" oninput="checkPw1();" required />
							<div id="alert-success" style="display: none;">비밀번호 사용가능</div>
							<div id="alert-danger" style="display: none;">비밀번호가 일치하지 않습니다</div>
	
							<input type="hidden" class="input" id="submitinput" value="0"> <input
								type="submit" value="변경하기" class="button1" id="submitbtn" />
			
							 <div class="find_info" style="margin-left: 73%;">
								<a target="_blank" id="idinquiry" href="/user/LoginForm.do">뒤로가기</a> 
								<span class="bar" aria-hidden="true">|</span> 
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row skills-content">
    		 </div>

    </section><!-- End Skills Section -->
	<script type="text/javascript">
		function submitTest(){
			var subinput = $("#submitinput").val();
			if(subinput=='0'){
				alert("아이디 중복 체크를 해주세요.");
				return false;
			}
			return true;
			
		}
	</script>
    <!-- ======= Facts Section ======= -->
   
    <!-- End Facts Section -->

    <!-- ======= Testimonials Section ======= -->
    <!-- End Testimonials Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Kelly</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/kelly-free-bootstrap-cv-resume-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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