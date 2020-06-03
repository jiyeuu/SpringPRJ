<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		body {background-color:#E0FFFF}
		form {
		    margin: 150px auto;
		    width: 400px;
		    padding: 2em;
		    border-radius: 1em;}
		    
		form div + div { margin-top: 1em;}
		        
		font {
		    display: inline-block;
		    width: 90px;
		    text-align: right;}
		        
		input, textarea {font:1em sans-serif;
		                    width: 300px;
		                    box-sizing: border-box;
		                    border: 1px solid #999;}
		textarea {
		    vertical-align: top;
		    height: 10em;
		    resize: vertical;}
		        
		.button {padding-left: 90px;}
		button {margin-left: .5em;
				border-color: #999;
				background-color: #FFFFFF;}    
	</style>
</head>
<body>
 <form action="/mail/sendMail.do" method="POST">
        <div>
            <font size="4" color="#000000">받는사람</font>
            <input type="email" placeholder="이메일입력" name="toMail">
        </div>
        <div>
            <font size="4" color="#000000">메일 제목</font>
            <input type="text" name="title"/>
        </div>
        <div>
            <font size="4" color="#000000">메일 내용</font>
            <textarea name="contents"></textarea>
            
        </div>
         
        <div class="button">
            <button type="submit">제출하기</button>
            <button type="reset">다시 입력</button>
        </div>
 </form>
</body>
</html>