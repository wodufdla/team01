<%@ page contentType="text/html; charset=UTF-8" %>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<nav class="navbar navbar-light navbar-expand-md">
   	<div class="container-fluid">
   		<a class="navbar-brand" href="/">
   			<img src="/resources/img/logo.png" style="height: 30px;">
   		</a>
        <a class="nav-link-command" href="javascript:onQna();" style="border: solid 1px #192a5e;color: #192a5e;">문의</a>
        <a class="nav-link-command" href="javascript:onResign();" style="border: solid 1px #bc401e;color: #bc401e;">해지</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol"><span class="visually-hidden"></span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol">
            <ul class="navbar-nav" style="width: 100%;">
                <li class="nav-item"><a class="nav-link" href="#service">서비스 소개</a></li>
                <li class="nav-item"><a class="nav-link" href="order">서비스 가입</a></li>
                <li class="nav-item"><a class="nav-link" href="#faq">FAQ</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:onQna();">1:1 문의</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:onResign();">서비스 해지</a></li>
                <li class="nav-item">
                <a id="login" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('login','login','width=585,height=400,location=no,status=no,scrollbars=yes,left=472,top=200');">로그인</a>
            </ul>
        </div>
    </div>
</nav>