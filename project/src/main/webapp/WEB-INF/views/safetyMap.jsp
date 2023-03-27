<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>생활안전지도</title>
</head>
<body>
<jsp:include page="common/header.jsp" />
<iframe src="https://www.safemap.go.kr/main/smap.do?flag=2" width="100%" height="900px">
    <p>현재 사용 중인 브라우저는 iframe 요소를 지원하지 않습니다!</p>
</iframe>
<jsp:include page="common/footer.jsp" />
</body>
</html>