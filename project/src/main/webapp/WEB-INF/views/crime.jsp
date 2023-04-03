<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<style type="text/css">
#intro {
	height: auto;
	min-height: 100%;
}
#introimg {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
   <jsp:include page="common/header.jsp" />
   
   <div id="intro" style="background: #b6b6b6;">
   <img id="introimg" src="/resources/img/intro.png" style="height: 100%; width: 100%; display: block;">
   </div>
    
    <jsp:include page="common/footer.jsp" />
</body>
</html>