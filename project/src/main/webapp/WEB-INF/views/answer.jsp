
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 답변 페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
/* header */
* {
	font-family: SUIT-Regular;
}


</style>
<style>
/* main section */
a {
	text-decoration: none;
}

.container {
	display: flex;
	flex-flow: row wrap;
	margin: 0 auto;
	width: 1200px;
	height: 800px;
}

#admin_nav {
	/* float: left; */
	width: 20%;
	height: 100%;
}

#admin_nav ul {
	border-right: 1px solid #ccc;
	width: 180px;
	height: 600px;
	padding-top: 50px;
}

#admin_nav li {
	margin: 25px;
}

#admin_nav li a {
	color: #444c57;
}

.main_menu {
	font-family: SUIT-SemiBold;
	font-size: 20px;
	font-weight: bold;
}

.sub_menu {
	padding-left: 30px;
	font-family: SUIT-Regular;
	font-size: 14px;
}

#main_body {
	/* float: right; */
	width: 80%;
	height: 100%;
	padding :30px;
	margin: 40px auto 0;
}

.replyTextareaWrap {
	position: relative;
	top: -75px;
	height: 250px;
	width: 800px;
	
}

.customerAskWrap {
	position: relative;
	margin-top: 45px;
	width: 800px;
	height: 270px;
}

#answer {
	margin: 0 auto;
	justify-content: center;
}

.replyTextarea {
	width: 800px;
	height: 250px;
	position: relative;
	resize: none;
	 padding: .375rem .75rem;
	font-size: 15px;
	font-weight: 400;
	color: #212529;
	background-color: #fff;
	border-radius: 5px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    
}

.replyTextarea:hover {
	border-color: #9bbfd9;
}
.replyTextarea:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9bbfd9;
	outline: 0;
	box-shadow: 0 0 0 .10rem #9bbfd9;
}
.replyTextarea-color::-moz-color-swatch {
	border-radius: 3px;
}
/* 버튼 1번 css*/
.btn1 {
	border: none;
	border-radius: 3px;
	/* background: #b6e0d6; */
	background-color: #666666;
	color: white;
	font-weight: 500;
	font-size: 20px;
	width: 160px;
	height: 50px;
	cursor: pointer;
}

.btn1:hover {
	opacity: 0.5;
}

.anst{
border: 1.8px solid #212529;
}
.customerask{
    font-size: 15px;
	font-weight: 400;
}
</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	<div class="container">
		<div id="main_body">
			<form action="/answer" method="post" id="answer" style="height: 458px;">
				<c:forEach items="${ask}" var="ask">
					<div class="customerAskWrap">
						<div>
						<h2 class="askTop">답변 글쓰기</h2>
						<hr style="position: relative; bottom: 35; z-index: -1; border: double;">
					    </div>
					   <p>제목: ${ask.askTitle}</p>
						<br>
						<p>내용: ${ask.askContent}</p>
						
						<input type="hidden" value="${ask.phone}"> 
						<input type="hidden" value="관리자로부터 문의하신 답변이 도착했습니다.">
					</div>
				</c:forEach>
				<input type="hidden" name="askNo" value="${askNo}">
				<div class="replyTextareaWrap">
					<textarea  class="replyTextarea" name="ansContent" id="ansContent" placeholder="답변을 신중하게 작성해주세요."></textarea>
				</div>
			</form>
			<div style="display: flex; justify-content: center; margin: 0 auto; margin-top: 40px; right: 110px;">
				<button class="btn1" type="button" onclick="ans_check();" style="margin-right: 10px;">등록</button>
				<a href="/ask"><button class="btn1" >취소</button></a>
			</div>
		</div>
	</div>

	<script>
	  function ans_check() {
			var anscontent = $("#ansContent").val();
			if (anscontent.trim() == "") {
				alert("답변 내용을 입력하세요.");
				content.focus();
				return false;
			}
			answer.submit();
		};
	</script>
</body>
</html>