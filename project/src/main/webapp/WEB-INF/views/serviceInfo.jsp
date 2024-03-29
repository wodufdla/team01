<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<title>범죄알리미-서비스 소개</title>
<style type="text/css">

#intro {
	height: auto;
	min-height: 100%;
	padding-bottom: 180px;
}
/* #intro {
   width: 100vw;
   height: 100vh;
} */
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
</style>
</head>
<body>
<jsp:include page="common/header.jsp" />
   <div id="intro">
      <jsp:include page="infoBody.jsp" />
      <!-- 가입하기 버튼 -->
      <div class="moveJoin">
         <a href="/order" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">서비스 가입하기</a>
      </div>
   </div>
<jsp:include page="common/footer.jsp" />
</body>
</html>