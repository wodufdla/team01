<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서비스소개</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<style>
.container {
    margin: 25px;
}
</style>
</head>
<body>
    <jsp:include page="common/header.jsp" />
    <section class="section-default" style="background: #8C8C8C;">
    <!-- <div class="container"> -->
        <img src="/resources/img/service_detail.jpg" style="width: 960px;">
        
        <input type="button" value="가입하기" onClick="location.href='order'">
        
    <!-- </div> -->
    </section>
    
    <jsp:include page="common/footer.jsp" />
</body>
</html>