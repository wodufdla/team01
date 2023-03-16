<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<title>Insert title here</title>
<style type="text/css">
#infobody {
	/* border: 1px solid #999; */
	margin-right: auto;
   	margin-left: auto;
	padding: 30px;
	width: 50%;
}
.moveJoin {
	text-align: center;
	padding: 30px;
}
#btn_join {
	background: #8C8C8C;
	border: none;
	width: 220pt;
	border: none;
	font-size: 40px;
}
input:hover {
	color: white;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" />
<section style="background: #8C8C8C;">
	<section id="infobody">
	<jsp:include page="infoBody.jsp" />
	</section>
	<!-- 가입하기 버튼 -->
	<div class="moveJoin">
		<!-- <button>가입하기</button> -->
		<input id="btn_join" type="button" value="가입하기" onClick="location.href='order'">
	</div>
</section>
<jsp:include page="common/footer.jsp" />
</body>
</html>