<%@ page contentType="text/html; charset=UTF-8" %>
<!-- jstl 추가  황선필-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<!-- 제이쿼리 추가 황선필 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	
	/* logout 추가 황선필 */
	$("#logout").click(function() {
		alert("logout 됐습니다!");
		location.href="logout";
	});

});
//서비스 가입, 서비스 해지, 1:1 문의 로그인 안할때 클릭시 알람 뜨게 하고 회원가입 창 뜸
function registeralarm() {
	alert("로그인을 해야 이용 가능합니다!");
	window.open('register','register','width=585,height=400,location=no,status=no,scrollbars=yes,left=700,top=200');
}

</script>

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
            <!-- 이해리님 요청 -->
                <li class="nav-item"><a class="nav-link" href="serviceInfo">서비스 소개</a></li>
                <!-- 황선필 메뉴 수정 스타일 수정 등록 창으로 연결 -->
                <c:if test="${phone!=null}">
	                <li class="nav-item"><a class="nav-link" href="order">서비스 가입</a></li>
                </c:if>
                <c:if test="${phone==null}">
	                <li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 가입</a></li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
                <c:if test="${phone!=null}">
                	<li class="nav-item"><a class="nav-link" href="javascript:onQna();">1:1 문의</a></li>
                </c:if>
                <c:if test="${phone==null}">
                	<li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">1:1 문의</a></li>
                </c:if>
                <c:if test="${phone!=null}">
                	<li class="nav-item"><a class="nav-link" href="javascript:onResign();">서비스 해지</a></li>
                </c:if>
                <c:if test="${phone==null}">
                	<li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 해지</a></li>
                </c:if>
                <!-- 황선필 메뉴 수정 -->

                <li class="nav-item">
                
                <!-- 로그인 상태인지 아닌지 상태 추가 황선필 -->
                <c:if test="${phone==null && admin == null}">
	                <a id="login" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('login','login','width=585,height=400,location=no,status=no,scrollbars=yes,left=700,top=200');">로그인</a>
	                <a id="register" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('register','register','width=585,height=400,location=no,status=no,scrollbars=yes,left=700,top=200');">회원가입</a>
                </c:if>
                
                <c:if test="${phone!=null}"><!-- style 추가 황선필 -->
	                <span style="font-weight: bold; text-decoration: underline; ">${session_nickname}</span><span style="font-weight: bold; " >님 환영합니다!</span>
	                <!-- <a href="#" id="modify">정보수정</a> -->
	                <a href="#" id="logout" class="nav-link" style="width: 10%; float: right;">로그아웃</a>
	                <a id="modify" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('modify','modify','width=585,height=400,location=no,status=no,scrollbars=yes,left=700,top=200');">정보수정</a>
	                <!-- session값 확인 황선필 -->
<%-- 	                ${phone}<br>
	                ${session_password}<br>
	                ${session_email}<br>
	                ${session_withdrawal}<br> --%>
                </c:if>
                <c:if test="${admin != null }">
                	<span style="font-weight: bold; text-decoration: underline; ">관리자</span><span style="font-weight: bold; " >님 환영합니다!</span>
	                <a href="#" id="logout" class="nav-link" style="width: 10%; float: right;">로그아웃</a>
                </c:if>
            </ul>
        </div>
    </div>
</nav>