<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>문의하기 글쓰기</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	font-family: SUIT-Regular;
}
body {
	width: 100%;
}
.askAllWrap {
	width: 1200px;
	margin: 100px auto 0;
}
.textWrap {
	width: 900px;
	margin: 0 auto;
}
.askAllWrap .titleWrap {
	display: flex;
	justify-content: left;
	align-items: center;
}
.askcategory {
	position: relative;
	left: 22px;
	height: 45px;
	width: 95px;
	font-size: 15px;
	border-radius: 5px;
	text-align: center;
}
.askcategory:hover {
	border-color: #9bbfd9;
}
.askAllWrap .contentWrap {
	display: flex;
	justify-content: center;
	align-items: center;
}
.buttonWrap {
	margin-top: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.askContent {
	margin-top: 15px;
}
.askboxborder {
	padding: .375rem .75rem;
	font-size: 15px;
	font-weight: 400;
	color: #212529;
	background-color: #fff;
	border: 1.8px solid #212529;
	border-radius: 5px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}
.askboxborder:hover {
	border-color: #9bbfd9;
}
.askboxborder:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9bbfd9;
	outline: 0;
	box-shadow: 0 0 0 .10rem #9bbfd9;
}
.askboxborder-color::-moz-color-swatch {
	border-radius: 3px;
}
.askTop {
	display: flex;
	width: 120px;
	font-size: 22px;
	margin: 20px auto;
	background: white;
	z-index: 999;
}
</style>
</head>

<body>

<jsp:include page="common/header.jsp" />
문의하기 
<form action="doAsk" method="post" id="doAsk">
		<div class="askAllWrap">
			<div class="textWrap">
				<div>
					<h2 class="askTop">문의 글쓰기</h2>
					<hr
						style="position: relative; bottom: 35; z-index: -1; border: double;">
				</div>
				<input type="hidden" name="email" value="${loginInfo.email}" />
				<div class="titleWrap">
					<input class="askboxborder" type="text" name="asktitle" placeholder="제목을 입력해주세요."
						id="asktitle" style="width: 784px; height: 46px;"> <select
						size="1" class="askcategory" name="askcategory">
						<option selected>환불</option>
						<option>결제</option>
						<option>상품</option>
						<option>기타</option>
					</select>
				</div>
				<div class="contentWrap">
					<div>
						<textarea class="askContent askboxborder" name="askcontent" placeholder="내용을 입력해주세요."
							id="askcontent" style="width: 900px; height: 352px; resize: none;"></textarea>
						<br>
					</div>
				</div>
				<div class="buttonWrap" style="margin-bottom: 100px;">
					<button class="btn btn-fill-fcolor" type="button"
						style="width: 206px;" onclick="ask_check();">등록하기</button>
				</div>
			</div>
		</div>
	</form>
	
	<script>
		function ask_check() {
			var title = document.getElementById("asktitle");
			var content = document.getElementById("askcontent");
			if (title.value == "") {
				alert("제목을 입력하세요.");
				title.focus();
				return false;
			}
			if (content.value == "") {
				alert("내용을 입력하세요.");
				content.focus();
				return false;
			}
			doAsk.submit();
		};
	</script>


<jsp:include page="common/footer.jsp" />
</body>
</html>