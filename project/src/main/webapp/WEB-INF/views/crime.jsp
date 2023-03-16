<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<style type="text/css">
#intro {
   width: 100vw;
   height: 100vh;
}
#introimg {
   display: block;
   margin-left: auto;
   margin-right: auto;
}
</style>
<body>
   <jsp:include page="common/header.jsp" />
   
   <section id="intro" style="background: #b6b6b6;">
   <img id="introimg" src="/resources/img/intro.png" style="height: 700px; display: block;">
   </section>
    
    <jsp:include page="common/footer.jsp" />
</body>
</html>