<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

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
	$(window).on("load",function(){
		getWordCloud();
	})
	
	function getWordCloud() {

		//Ajax 호출
		$.ajax({
			url : "/rTest.do",
			type : "post",
			dataType : "JSON",
			success : function(json) {
				console.log(json);
				var str = [];
				if(json.word.length>300){
					for(var i = 0; i<300;i++){
						str.push({'word':json.word[i],'count':json.count[i]});
					}	
				}
				console.log(str);
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
			}
		})
	}
</script>
</head>
<body>
	<div id="chartdiv"></div>
</body>
</html>