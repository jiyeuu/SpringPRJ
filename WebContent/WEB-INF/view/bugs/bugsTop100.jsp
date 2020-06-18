<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery-3.4.1.min.js"></script>
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
					bugs_rank += (" | " + json[i].song + " | ");
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
	<h1>벅스 순위</h1>
	<hr />
	<div id="bugs_rank"></div>
	<br />
	<hr />
</body>
</html>


