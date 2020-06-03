<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/annyang.js"></script>
<title>Insert title here</title>
<script>
	annyang.start({
		autoRestart : true,
		continuous : true
	})
	
	var recognition = annyang.getSpeechRecognizer();
	
	var final_transcript = "";
	
	recognition.interimResults = true;
	
	recognition.onresult = function (event) {
		var interim_transcript = "";
		final_transcript = "";
		for(var i = event.resultIndex; i < event.results.length; ++i){
			if(event.results[i].isFinal){
				final_transcript += event.results[i][0].transcript;
			}else{
				interim_transcript += event.results[i][0].transcript;
			}
		}
		document.getElementById("ing").innerHTML = "말하는 중: " +  interim_transcript;
		document.getElementById("result").innerHTML = "말 다했음: " +  final_transcript;
	}

</script>
</head>
<body>
	<h1>한국어 음성 퍼리 테스트</h1>
	<hr/>
	<div id="ing">결과가 없습니다</div>
	<div id="result">결과가 없습니다</div>
</body>
</html>