<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<button type="button" id="mobile-nav-toggle">
	<i class="lnr lnr-menu"></i>
</button>
<header id="header" id="home">
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="/MainForm.do"><img src="/img/loogoo.png" alt="" title="" /></a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="/MainForm.do">홈</a></li>
					<li><a href="/logout.do">로그아웃</a></li>
					<li><a href="/mypage/Mypage.do">마이페이지</a></li>
					<li><a href="/map/MapForm1.do">동물병원 찾기</a></li>
					<li class="menu-has-children"><a href="" class="sf-with-ul">게시판</a>
						<ul>
							<li><a href="/notice/noticeList.do">공지사항</a></li>
							<li><a href="/board/boardList.do">후기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>