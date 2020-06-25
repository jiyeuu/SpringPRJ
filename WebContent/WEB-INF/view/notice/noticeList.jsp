<%@page import="poly.dto.NoticeDTO"%>
<%@page import="poly.dto.PagingDTO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int curPage = (int) request.getAttribute("curPage");
	PagingDTO pagg = (PagingDTO) request.getAttribute("pagg");
	List<NoticeDTO> bList = (List<NoticeDTO>) request.getAttribute("bList");
	String user_name = (String) request.getAttribute("user_name");
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
%>

<!DOCTYPE html>
<html>
<head>

<!-- meta character set -->
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="Page description" name="description">
<meta name="google" content="notranslate" />
<meta content="Mashup templates have been developped by Orson.io team" name="author">
<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">

<title>공지사항 리스트</title>
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
		location.href = "/notice/noticeList.do?curPage=" + curPage;
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
	
	<!-- End banner Area -->

	<%-- 	<%if(user_id!=null){ %>
		<%if(user_Author.equals("1")) {%>
	<input type="button" value="글작성" class="button"
				 onclick="window.location='/notice/noticeReg.do'"/>
	<%}
	}
%> --%>

						<div >
						
							<%
								if (user_id != null) {
							%>
							<%
								if (user_Author.equals("1")) {
							%>
							<button type="button" class="btn btn-primary"
								onclick="window.location='/notice/noticeReg.do'"
								style="float: right;">글쓰기</button>

							<%
								}
								}
							%>
							
							
							
<div style="border: 1px solid;">
	<div>
		<span style=" padding: 10px; text-align: left;">번호</span>
		<span style=" padding: 100px; text-align: left;">제목</span>
		<span style=" padding: 30px; text-align: left;">작성자</span>
		<span style=" padding: 50px; text-align: left;">작성일</span>
	</div>
	<%
		for (NoticeDTO bDTO : bList) {
	%>
	<div>
		<span style=" padding: 10px; text-align: left;"><%=bDTO.getSeq()%></span>
		<span style=" padding: 100px; text-align: left;"><a href="/notice/noticeDetail.do?seq=<%=bDTO.getSeq()%>"><%=bDTO.getTitle()%></a></span>
		<span style=" padding: 30px; text-align: left;"><%=bDTO.getUser_name()%></span>
		<span style=" padding: 50px; text-align: left;"><%=bDTO.getRead_cnt()%></span>
	</div>
	<%
		}
	%>
</div>
							
							<%-- <div class="table_div"
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
								<%
									for (NoticeDTO bDTO : bList) {
								%>
								<ul style="display: table-row;">
									<li class="list-table_li_s"
										style="display: table-cell; width: 5px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getSeq()%></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
										<a href="/notice/noticeDetail.do?seq=<%=bDTO.getSeq()%>">
											<%=bDTO.getTitle()%></a>
									</li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 20px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getUser_name()%></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 12px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getRead_cnt()%></li>
									<li class="list-table_li_s"
										style="display: table-cell; width: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bDTO.getRegDate()%></li>
								</ul>
								<%
									}
								%>
							</div>--%>
							
							<!-- 페이징 -- >
						<div style="display: inline-block; margin:auto;">
							<!-- 1~5페이지 아닌 경우에 처음 찍기 -->
							<ul class="pagination">
								<c:if test="${pagg1.curRange ne 1 }">
									<a class="page-link" href="#" onClick="fn_paging(1)">처음</a>
								</c:if>
								<!-- 1페이지가 아닌 경우에 이전 찍기 -->
								<c:if test="${pagg1.curPage ne 1}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg1.prevPage }')">이전</a>
								</c:if>


								<c:forEach var="pageNum" begin="${pagg1.startPage }"
									end="${pagg1.endPage }">
									<c:choose>
										<c:when test="${pageNum eq  pagg1.curPage}">
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
									test="${pagg1.curPage ne pagg1.pageCnt && pagg1.pageCnt > 0}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg1.nextPage }')">다음</a>
								</c:if>

								<!-- 마지막 페이지 블록이 아닐때 끝 찍기 -->
								<c:if
									test="${pagg1.curRange ne pagg1.rangeCnt && pagg1.rangeCnt > 0}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg1.pageCnt }')">끝</a>
								</c:if>

							</ul>
						</div>
	


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