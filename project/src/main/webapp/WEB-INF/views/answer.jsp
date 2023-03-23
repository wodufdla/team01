
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 답변 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
/* header */
* {
	font-family: SUIT-Regular;
}

#admin_navigator {
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
	height: 130px;
	color: #444c57;
	padding-top: 20px;
}

#admin_navigationbar {
	position: relative;
	width: 1280px;
	height: 100px;
	margin: 0 auto;
}

#logo_wrap {
	position: absolute;
	top: 0;
	width: 100px;
}

#logo {
	width: 95px;
	height: 65px;
}

#admin_header_title {
	position: absolute;
	top: 30%;
	left: 150px;
	font-family: SUIT-SemiBold;
	font-size: 28px;
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
	height: 330px;
	width: 760px;
}

.customerAskWrap {
	position: relative;
	margin-top: 45px;
	width: 1000px;
	height: 200px;
}

#answer {
	margin: 0 auto;
	justify-content: center;
}

.replyTextarea {
	width: 760px;
	height: 330px;
	position: relative;
	resize: none;
}

/* 버튼 1번 css*/
.btn1 {
	border: none;
	border-radius: 3px;
	/* background: #b6e0d6; */
	background-color: #8C8C8C;
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
#askboxborder {
	padding: .375rem .75rem;
	font-size: 15px;
	font-weight: 400;
	color: #212529;
	background-color: #fff;
	border: 1.8px solid #212529;
	border-radius: 5px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}
#askboxborder:hover {
	border-color: #9bbfd9;
}
#askboxborder:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9bbfd9;
	outline: 0;
	box-shadow: 0 0 0 .10rem #9bbfd9;
}
#askboxborder-color::-moz-color-swatch {
	border-radius: 3px;
}
.anst{
border: 1.8px solid #212529;
}

</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="container">
		<div id="main_body">
			<form action="<%=request.getContextPath()%>/answer" 
			id="answer" method="POST" style="height: 458px;">
				<c:forEach items="${ask}" var="ask">
					<div class="customerAskWrap">
					   <p>제목: ${ask.asktitle}</p>
						<br>
						<p>내용: ${ask.askcontent}</p>
						<input type="hidden" name="email" value="${ask.phone}"> 
						<input type="hidden" name="a_content" value="관리자로부터 문의하신 답변이 도착했습니다.">
					</div>
				</c:forEach>
				<input type="hidden" name="askno" value="${askno}">
				<div class="replyTextareaWrap">
					<textarea  id="askboxborder" class="replyTextarea" name="anscontent" id="anscontent" placeholder="문의사항 답변을 작성해주세요."></textarea>
				</div>
			</form>
			<div style="display: flex; justify-content: center; margin: 0 auto; margin-top: 40px; position: relative; right: 110px;">
				<button class="btn1" type="button" onclick="ans_check();"
					style="margin-right: 10px;">등록</button>
				<a href="/ask"><button class="btn1" >취소</button></a>
			</div>
		</div>

	</div>
	
	<jsp:include page="common/footer.jsp" />
	<script>
	<%-- var member=  '${phone}';
	console.log("접근한회원정보: " + member);	
	
	if(member == 'admin') {
		console.log("안녕하세요 관리자님!");
	} else {
		alert("관리자 권한이 필요한 페이지입니다.");
		location.href='<%=request.getContextPath()%>/';}
		$("#admin_nav ul li a").click(function() {
			console.log("click()");
			var before_color = '#444c57';
			var after_color = '#9bbfd9';
			// 클릭한 이벤트 객체의 폰트색 변경
			$(this).css('color', after_color);
			// 클릭하지 않은 다른 객체들의 폰트색 변경
			$("#admin_nav > ul> li > a").not(this).css('color', before_color);
		}); --%>
	</script>
	<script>
		function ans_check() {
			var content = document.getElementById("anscontent");
			if (content.value == "") {
				alert("내용을 입력하세요.");
				content.focus();
				return false;
			}
			answer.submit();
		};
	</script>
</body>
</html>