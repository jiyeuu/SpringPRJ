<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>

 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원가입</title>
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
 
 <script type="text/javascript">
//이름 형식 체크
	function test_name() {
		var name = Regf.user_name.value;
		var CheckForm = /^[가-힣]+$/;

		if (!CheckForm.test(name)) {
			$("#name-success").show();
			$('#submitbtn').prop("disabled", true);

		} else {
			$("#name-success").hide();
		}
	}
	
//아이디 중복체크
 function test() {
		var inputed = Regf.user_id.value;
		var CheckForm = /^[a-z0-9]{4,12}$/;

		if (!CheckForm.test(inputed)) {
			$("#checkid").text("영문소문자, 숫자 4~12글자로 입력해주세요");
			$('#submitinput').val("0");
		} else {
			$.ajax({
				data : {
					user_id : inputed
				},
				url : "checkId.do",
				success : function(data) {
					if (data == '0') {
						$("#checkid").text('사용가능한 아이디 입니다.');
						$('#submitinput').val("1");
					} else if (data == '1') {
						$("#checkid").text('사용불가능한 아이디 입니다.');
						$('#submitinput').val("0");
					}
				}
			});
		}
	} 
	
	
//비밀번호 일치 체크
	function checkPw() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			var CheckForm = /^[a-z0-9]{8,16}$/;
			if(pwd1==""){
				$("#alert-danger1").hide();
				$('#pwinput').val("0");
			}
			if(pwd1.length<8){
				$("#alert-danger1").show();				
				$('#pwinput').val("0");
			}
			if (!CheckForm.test(pwd1)) {
				$("#alert-danger1").show();
				$('#submitbtn').prop("disabled", true);	
				$('#pwinput').val("0");
			} else{
			 	if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-danger1").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submitbtn").removeAttr("disabled");
						$('#pwinput').val("1");
					} else {
						$("#alert-danger1").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submitbtn").attr("disabled", "disabled");
						$('#pwinput').val("0");
					}
			  	}
			}
		});
	};
	
	//이메일 중복체크
	 function test_email() {
			var inputed = Regf.email.value;
			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

			if (!regex.test(inputed)) {
				$("#check").text('이메일 형식이 올바르지 않습니다.');
				$('#emailinput').val("0");
			} else {
				$.ajax({
					data : {
						email : inputed
					},
					url : "checkEmail.do",
					success : function(data) {
						if (data == '0') {
							$("#check").text('사용가능한 이메일 입니다.');
							$('#emailinput').val("1");
						} else if (data == '1') {
							$("#check").text('사용불가능한 이메일 입니다.');
							$('#emailinput').val("0");
						}
					}
				});
			}
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
  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>회원가입</h2>
        </div>
      </div>
    </section><!-- End About Section -->

    <!-- ======= Skills Section ======= -->
    <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">
        <div class="login-page">
          <div class="form">
            
            <form class="login-form" name="Regf" id="signup" action="/user/insertUserInfo.do"
            	onsubmit="return submitTest();">
              
              <input type="text" class="input" placeholder="name" name="user_name" oninput="test_name()" required/>
              <div id="name-success" style="display: none;">한글로만 작성해 주세요</div>
              
              <input type="text" class="input" placeholder="id" name="user_id" oninput="test();" required />
              <div id="checkid"></div>
              
              <input type="password" class="input" placeholder="password" name="password" id="pwd1" oninput="checkPw()"  required/>
              <div id="alert-danger1" style="display: none;">영문소문자, 숫자8~16로 입력해주세요</div>
              
              <input class="input"  id="pwd2" type="password" name="repeatpassword" oninput="checkPw()" 
						placeholder="Password check" required>
              <div id="alert-success" style="display: none;">비밀번호 사용가능</div>
			  <div id="alert-danger" style="display: none;">비밀번호가 일치하지 않습니다</div>
              
              <input type="email" class="input" placeholder="email" id="checkEmail"  oninput="test_email();" name="email" required/>
              <div id="check"></div>
              
              <input type="hidden" id="submitinput" value="0">
			  <input type="hidden" id="emailinput" value="0">
			  <input type="hidden" id="pwinput" value="0">
              <input type="submit" value="회원가입" class="button1" />
              <div class="find_info" style="margin-left: 75%;">
                <a target="_blank" id="idinquiry" href="/user/LoginForm.do">뒤로가기</a> 
                <span class="bar" aria-hidden="true">|</span> 
              </div>
            </form>
          </div>
        </div>
     

        <div class="row skills-content">
        </div>

      </div>
    </section><!-- End Skills Section -->
    
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
				
					<script type="text/javascript">
					function submitTest(){
						var subinput = $("#submitinput").val();
						var emailinput = $("#emailinput").val();
						var pwinput = $('#pwinput').val();
						if(subinput=='0'){
							alert("아이디 중복 체크를 해주세요.");
							return false;
						}
						if(emailinput=='0'){
							alert("이메일 중복 체크를 해주세요.");
							return false;
						}
						if(pwinput=='0'){
							alert("비밀번호를 확인해주세요.");
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