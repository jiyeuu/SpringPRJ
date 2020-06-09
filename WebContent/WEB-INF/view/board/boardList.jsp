<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.PagingDTO"%>
<%@page import="java.util.List"%>
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
	
<title>후기 리스트</title>
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

</style>
</head>
<body>
	 <!-- #header -->
	<%if(user_id!=null){ %>
		<%if(user_Author.equals("1")) {%>
			<%@include file="/WEB-INF/view/frame/topbar-admin.jsp" %>
		<%} else { %>
			<%@include file="/WEB-INF/view/frame/topbar-login.jsp" %>
		<%} %>
	<%} else {%>
		<%@include file="/WEB-INF/view/frame/topbar-logout.jsp" %>
	<%} %>
	
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
				<!-- <input type="button" value="글작성" class="button" onclick="window.location='/board/boardReg.do'"/> -->
	<div class="container-table100">
		<div class="wrap-table100">
			<div class="table100 ver1 m-b-110">
				<div class="table100-head">
					<div class="formss" id="jb-content">
							<button type="button" class="btn btn-primary"
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
										style="display: table-cell; width: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getRegDate() %></li>
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
		</div>
	</div>
</div>
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