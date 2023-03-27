<%@ page contentType="text/html; charset=UTF-8" %>
<!-- jstl 추가  황선필-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<!-- 제이쿼리 추가 황선필 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.dropdown{
  padding: 8px;
  color: #666666;
  position: relative;
  display: inline-block;
}
.dropbtn {
  font-weight: bold;
}
.dropdown-content{
  background-color: #ffffff;
  width: 145px !important;
  display: none;
  position: absolute;
  z-index: 1; /*다른 요소들보다 앞에 배치*/
  font-size: 10pt;
  text-align: left;
}
.dropdown-content a{
  display: block;
}
.dropdown-content a:hover{
  background-color: #ececec
}
.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown-item {
  margin: 1px;
  padding: 2px;
  font-weight: bold;
}
</style>
<script>

$(document).ready(function(){
    
    /* logout 알러트 수정 황선필 */
    $("#logout").click(function() {
        alert("로그아웃 됐습니다!");
        location.href="logout";
    });

});
//서비스 가입, 서비스 해지, 1:1 문의 로그인 안할때 클릭시 알람 뜨게 하고 로그인 창 뜸
function registeralarm() {
    alert("로그인 후 이용 가능합니다!");
    window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
}

// 서비스 소개, 서비스 가입 시 이용 가능
function joinchk(num){

    // 서비스 가입 여부 확인 후 미가입시 안내창
    alert("서비스 가입 후 이용 가능합니다.");
    if(1){

        switch(num) {
        case 1:
            window.open("https://www.sexoffender.go.kr/m1s2_login.nsc", "_blank")
            /* location.href = "https://www.sexoffender.go.kr/m2s3_7.nsc"; */
            break;
        case 2:
            /* window.open("https://www.safemap.go.kr/main/smap.do?flag=2", "_blank"); */
            location.href ="/safetyMap";
            break;  
        }
        return true;
    } else {
        return false;
    }
}

</script>

<nav class="navbar navbar-light navbar-expand-md">
<<<<<<< HEAD
       <div class="container-fluid">
           <a class="navbar-brand" href="/">
               <img src="/resources/img/logo.png" style="height: 30px;">
           </a>
=======
	  <!-- 배너통해서 왔는지 유무 황선필 -->
	 <input type="hidden" id="banner" name="banner" placeholder="banner 입력"  maxlength="24" style="width: 100%; padding: 5px;" value="2">
   	<div class="container-fluid">
   		<a class="navbar-brand" href="/">
   			<img src="/resources/img/logo.png" style="height: 30px;">
   		</a>
>>>>>>> HSP
        <a class="nav-link-command" href="javascript:onQna();" style="border: solid 1px #192a5e;color: #192a5e;">문의</a>
        <a class="nav-link-command" href="javascript:onResign();" style="border: solid 1px #bc401e;color: #bc401e;">해지</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol"><span class="visually-hidden"></span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol">
            <ul class="navbar-nav" style="width: 100%;">
            <!-- 이해리님 요청 -->
                <li class="nav-item"><!-- <a class="nav-link" href="serviceInfo">서비스 소개</a> -->
                    <div class="dropdown">
                      <span class="dropbtn">서비스 소개</span>
                      <div class="dropdown-content">
                          <a class="dropdown-item" href="/rtPublicStatus">실시간 공개현황</a>
                        <a class="dropdown-item" href="#" onclick="joinchk(1);">성범죄자 찾아보기</a>
                        <a class="dropdown-item" href="#" onclick="joinchk(2);">범죄주의 구간 확인</a>
                        <a class="dropdown-item" href="/howRespond">성범죄 대응법</a>
                      </div>
                    </div>
                </li>
                <!-- 황선필 메뉴 수정 스타일 수정 등록 창으로 연결 -->
                   <!-- 이해리 메뉴 수정(admin) -->
                <c:if test="${phone!=null || admin!=null}">
                    <li class="nav-item"><a class="nav-link" href="order">서비스 가입</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link" href="question">1:1 문의</a></li>
                    <li class="nav-item"><a class="nav-link" href="javascript:onResign();">서비스 해지</a></li>
                </c:if>
                <c:if test="${phone==null && admin==null}">
                    <li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 가입</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
                    <li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">1:1 문의</a></li>
                    <li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 해지</a></li>
                </c:if>

                <!-- 황선필 메뉴 수정 -->

                <li class="nav-item">
                
                <!-- 로그인 상태인지 아닌지 상태 추가 황선필 -->
                <c:if test="${phone==null && admin == null}">
                    <a id="login" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');">로그인</a>
                    <a id="register" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('register','register','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');">회원가입</a>
                </c:if>
                
                <c:if test="${phone!=null}"><!-- style 수정 황선필 -->
                <!-- banner test -->

<%--                 <c:if test="${session_banner!=null}">
	                ${session_banner}
                </c:if> --%>
	                <a href="#" id="logout" class="nav-link" style="width: 10%;  float: right;">로그아웃</a>
	                <a id="modify" class="nav-link" style="width: 10%; float: right; cursor : pointer;" onclick="window.open('modify','modify','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');">회원수정</a>
	                <a href="javascript:void(0);" class="nav-link" style="width: 30%; font-weight: bold; float: right; cursor: auto;">${session_nickname}님 환영합니다!</a>
	                

                </c:if>
                <c:if test="${admin != null }">
                    <span style="font-weight: bold; text-decoration: underline; ">관리자</span><span style="font-weight: bold; " >님 환영합니다!</span>
                    <a href="#" id="logout" class="nav-link" style="width: 10%; float: right;">로그아웃</a>
                    <a href="product" id="product_management" class="nav-link" style="width: 10%; float: right;cursor : pointer">주문 관리</a>
                    <a href="customer?page=1&numsPerPage=3" id="customer_management" class="nav-link" style="width: 10%; float: right;cursor : pointer">고객 관리</a>                    
                <a href="ask" class="nav-link" style="width: 10%; float: right;cursor : pointer">1대1문의</a>
                </c:if>
            </ul>
        </div>
    </div>