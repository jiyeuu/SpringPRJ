<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.PagingDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.DateUtil"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int curPage = (int)request.getAttribute("curPage");
	PagingDTO pagg = (PagingDTO)request.getAttribute("pagg");
	List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList");
	String user_name = (String)request.getAttribute("user_name");
	String user_id = (String)session.getAttribute("SS_USER_ID");
	String user_Author = (String)session.getAttribute("user_Author");
%>

<!DOCTYPE html>


<html lang="UTF-8">
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
  <!-- Template Main JS File -->
<!--   <script src="/assets/js/main.js"></script> -->


   <script type="text/javascript">
     function fn_paging(curPage) {
     location.href = "/board/boardList.do?curPage=" + curPage;
     }
 </script>
<style type="text/css">

@keyframes backMasking {
  0% {
    width: 0%;
  }
  100% {
    width: 100%;
  }
}
@-webkit-keyframes backMasking {
  0% {
    width: 0%;
  }
  100% {
    width: 100%;
  }
}
     
      #jb-content {
        width: 100%;
        padding: 20px;
        margin-bottom: 20px;
        position: relative;
        border: 1px solid #bcbcbc;
      }
     
      @media ( max-width: 480px ) {
     
        #jb-content {
          float: none;
          width: auto;
            position: absolute;
        }
       
      }
      
      
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
			  
<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>게시판</h2>
        </div>
      </div>
    </section><!-- End About Section -->
			
				<!-- <input type="button" value="글작성" class="button" onclick="window.location='/board/boardReg.do'"/> -->
	<!-- ======= Skills Section ======= -->
    <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">
      
         
					
							<button type="button" class="button1" style="width: 80px;"
								onclick="window.location='/board/boardReg.do'">글쓰기</button>
							<div class="table_div"
								style="display: table; table-layout: fixed; width: 100%;">
								<ul style="display: table-row;">
									<li class="list-table_li"
										style="display: table-cell; width: 10px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">번호</li>
									<li class="list-table_li"
										style="display: table-cell; width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">제목</li>
									<li class="list-table_li"
										style="display: table-cell; width: 20px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">작성자</li>
									<li class="list-table_li"
										style="display: table-cell; width: 12px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">조회수</li>
									<li class="list-table_li"
										style="display: table-cell; width: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">작성일</li>
								</ul>
								<%for(BoardDTO bDTO : bList){ %>
								<ul style="display: table-row;">
									<li class="list-table_li_s"
										style="display: table-cell; width: 5px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getSeq() %></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
										<a href="/board/boardDetail.do?seq=<%=bDTO.getSeq()%>"> <%=bDTO.getTitle()%></a>
									</li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 20px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getUser_name() %></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 12px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getRead_cnt() %></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getReg_date() %></li>
								</ul>
								<%} %>
							</div>

							<!-- 페이징 -->
							<div style="display: inline-block;">
								<!-- 1~5페이지 아닌 경우에 처음 찍기 -->
								<ul class="pagination">
									<c:if test="${pagg.curRange ne 1 }">
										<!-- 현재페이지가 1이 아닐때 -->
										<a class="page-link" href="#" onClick="fn_paging(1)">처음</a>
									</c:if>
									<!-- 1페이지가 아닌 경우에 이전 찍기 -->
									<c:if test="${pagg.curPage ne 1}">
										<a class="page-link" href="#"
											onClick="fn_paging('${pagg.prevPage }')">이전</a>
									</c:if>


									<c:forEach var="pageNum" begin="${pagg.startPage }"
										end="${pagg.endPage }">
										<c:choose>
											<c:when test="${pageNum eq  pagg.curPage}">
												<span style="font-weight: bold;"><a class="page-link"
													href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="#"
													onClick="fn_paging('${pageNum }')">${pageNum }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<!-- 마지막 페이지가 아닌 경우에 다음 찍기 -->
									<c:if
										test="${pagg.curPage ne pagg.pageCnt && pagg.pageCnt > 0}">
										<a class="page-link" href="#"
											onClick="fn_paging('${pagg.nextPage }')">다음</a>
									</c:if>

									<!-- 마지막 페이지 블록이 아닐때 끝 찍기 -->
									<c:if
										test="${pagg.curRange ne pagg.rangeCnt && pagg.rangeCnt > 0}">
										<a class="page-link" href="#"
											onClick="fn_paging('${pagg.pageCnt }')">끝</a>
									</c:if>

								</ul>
							</div>
					</div>

				</div>
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