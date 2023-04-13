<%@ page contentType="text/html; charset=UTF-8" %>
<!-- jstl 추가	황선필-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<!-- 제이쿼리 추가 황선필 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.dropdown{
	padding: 8px 8px 8px 0;
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
.open_menu_layer {
    position: absolute;
    right: 20px;
    top: 50%;
    width: 48px;
    height: 48px;
    background: url(https://cdn.jejujini.kr/resources/KR/img/web/btn_gnb_menu_gray.png) no-repeat center;
    background-size: 100%;
    transform: translateY(-50%);
    line-height: normal;
    border: none;
    
}
.blind {
    position: absolute !important;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
}
.menu_layer {
    display: none;
    flex-direction: column;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 100vh;
    overflow: auto;
    padding-top: 45px;
    background: #fff;
}
.before_login {
    flex-shrink: 0;
    padding: 20px 0 45px;
    border-bottom: 15px solid #EFF0F2;
    text-align: center;
}
.txt_primary {
    display: block;
    margin-top: 5px;
    font-size: 2.2rem;
    color: #4385F0;
}
a.btn_primary {
    display: inline-block;
    width: 100%;
    padding: 0 15px;
    height: 50px;
    line-height: 48px;
    border: 1px solid #4385F0;
    border-radius: 10px;
    text-align: center;
    color: #fff;
    color: #4385F0;
    font-size: 1.5rem;
    width: auto;
    margin-top: 25px;
    padding: 0 39px;
}
.webLogin_m {
    flex-shrink: 0;
    padding: 20px 0 45px;
    border-bottom: 15px solid #EFF0F2;
    text-align: center;
}
.nav-link_m {
	text-align:center;
    display: flex;
    align-items: center;
    padding: 10px;
    margin-bottom: 20px;
    font-weight: 500;
    font-size: 2.7rem;
    line-height: 1.3;
    color: #333;
}
.nav-link_m2 {
	text-align:center;
    display: flex;
    align-items: center;
    padding: 10px;
    margin-bottom: 20px;
    font-weight: 500;
    font-size: 1.7rem;
    line-height: 1.3;
    color: #333;
}
</style>
<script type="text/javascript">
/* 모바일 버전 체크 */
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

$(document).ready(function(){
	/* logout 알러트 수정 황선필 */
/*	$("#logout").click(function() {
		alert("로그아웃 됐습니다!");
		location.href="logout";
	});
*/	
	$('.logout').each(function(i){
		$(this).click(function(e){
			e.preventDefault();
			alert("로그아웃 됐습니다!");
			location.href="logout";
		});
	});
	/*모바일 btnIPO Event*/
	$(".open_menu_layer").click(function() {
		if('none' == $("#menuLayer").css("display")) {
			$("#menuLayer").show();
			
		} else {
			$("#menuLayer").hide();
		}
		//margin top 
		var mgnTop		= $("#headerDiv").height();
		$("#menuLayer").css("margin-top", mgnTop)+'px';
	});
	
	/*모바일 화면 구성*/
	window.addEventListener("resize", function() {
		fnSetScreen();
	});
	fnSetScreen();
});
function fnSetScreen() {
	var bodyWth		= 1200;
	if($(document.body).length > 0) {
		if($(document.body.clientWidth)[0] <= 1200) {
			isMobile		= true;
		} else {
			$("#menuLayer").hide();
			isMobile		= false;
		}
	}
	if(!isMobile) {
		//PC
		$("#navPC").show();
		$("#navMo").hide();
	} else {
		//MOBILE
		$("#navPC").hide();
		$("#navMo").show();
	}
}
function fnShowLogin() {
	window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
	return false;
}
//서비스 가입, 서비스 해지, 1:1 문의 로그인 안할때 클릭시 알람 뜨게 하고 로그인 창 뜸
function registeralarm() {
	alert("로그인 후 이용 가능합니다!");
	window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
	//window.open('register','register','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
}
//mypage
function mypage() {
	location.href="mypage";
}

// 서비스 소개, 서비스 가입 시 이용 가능
function joinchk(num){

	// 서비스 가입 여부 확인 후 미가입시 안내창
	// alert("서비스 가입 후 이용 가능합니다.");
	if ('<%=(String)session.getAttribute("session_status")%>' != '1'){
		alert("서비스 가입 후 이용 가능합니다.");
		window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
	} else {
		if (num==1) {
			window.open("https://www.sexoffender.go.kr/m1s2_login.nsc", "_blank")
			/* location.href = "https://www.sexoffender.go.kr/m2s3_7.nsc"; */
		} else if (num==2){
			/* window.open("https://www.safemap.go.kr/main/smap.do?flag=2", "_blank"); */
			location.href ="/safetyMap";
		} else if (num==3){
			location.href ="/rtPublicStatus";
		}
	}
}

function withdrawal() {
	alert("1:1 문의 게시판을 이용해주세요.");
}
</script>
<div id="headerDiv">
<nav class="navbar navbar-light navbar-expand-md">
	<!-- 배너통해서 왔는지 유무 황선필 -->
	<input type="hidden" id="banner" name="banner" placeholder="banner 입력"	maxlength="24" style="width: 100%; padding: 5px;" value="2">
	<%-- PC --%>
	<div id="navPC" class="container-fluid">
		<a class="navbar-brand" href="crime"><img src="/resources/img/logo.png" style="height: 30px;"></a>
		<div class="collapse navbar-collapse" >
			<ul class="navbar-nav" style="width: 100%;">
				<!-- 이해리 메뉴 수정 -->
				<!-- <li class="nav-item">
					<div class="dropdown">
						<span class="dropbtn">서비스 소개</span>
							<div class="dropdown-content">
							<a class="dropdown-item" href="#" onclick="joinchk(3);">실시간 공개현황</a>
							<a class="dropdown-item" href="#" onclick="joinchk(1);">성범죄자 찾아보기</a>
							<a class="dropdown-item" href="#" onclick="joinchk(2);">범죄주의 구간 확인</a>
							<a class="dropdown-item" href="/howRespond">성범죄 대응법</a>
							<a class="dropdown-item" href="/PrkSttusInfo">주차장 위치 확인</a>
							<a class="dropdown-item" href="/illegalParking">주정차위반 위치 확인</a>
						</div>
					</div>
				</li> -->
				<!-- 황선필 메뉴 수정 스타일 수정 등록 창으로 연결 -->
				<!-- 이해리 메뉴 수정(admin) -->
				<c:if test="${phone!=null}">
					<li class="nav-item"><a class="nav-link" href="order">서비스 가입</a></li>
					<li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
					<li class="nav-item"><a class="nav-link" href="question">1:1 문의</a></li>
					<li class="nav-item"><a class="nav-link" href="#" onclick="withdrawal();">서비스 해지</a></li>
				</c:if>
				<c:if test="${phone==null && admin==null}">
				
					<li class="nav-item"><a class="nav-link" href="/PrkSttusInfo">주차장 위치</a></li>
					<li class="nav-item"><a class="nav-link" href="/illegalParking">주정차위반</a></li>
							
							
					<li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 가입</a></li>
					<li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
					<li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">1:1 문의</a></li>
					<li class="nav-item"><a href="javascript:registeralarm();" class="nav-link" style="cursor : pointer;">서비스 해지</a></li>
				</c:if>
				<c:if test="${admin!=null}"></c:if>
				<!-- 황선필 메뉴 수정 -->
				<li class="nav-item">
				<!-- 로그인 상태인지 아닌지 상태 추가 황선필 -->
				<c:if test="${phone==null && admin == null}">
					<a id="login" class="nav-link" style="float: right; cursor : pointer; display:inline-block;" onclick="window.open('login','login','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');">로그인</a>
					<a id="register" class="nav-link" style="float: right; cursor : pointer;" onclick="window.open('register','register','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');">회원가입</a>
				</c:if>
				<c:if test="${phone!=null}"><!-- style 수정 황선필 -->
					<a href="#" id="logout" class="nav-link logout" style="float: right; display:inline-block;">로그아웃</a>
					<a href="javascript:mypage();" id="mypage" class="nav-link" style="width: 20%; float: right; cursor : pointer;" >마이페이지</a>
					<a href="javascript:void(0);" class="nav-link" style="width: 30%; font-weight: bold; float: right; cursor: auto;">${session_nickname}님 환영합니다!</a>
				</c:if>
				<c:if test="${admin != null }"><!-- 관리자 환영합니다 스타일 수정 황선필-->
					<a href="#" id="logout" class="nav-link logout" style="width: 10%; float: right; display:inline-block;">로그아웃</a>
					<a href="product" id="product_management" class="nav-link" style="width: 10%; float: right;cursor : pointer">매출 관리</a>
					<a href="customer" id="customer_management" class="nav-link" style="width: 10%; float: right;cursor : pointer">고객 관리</a>					
					<a href="ask" class="nav-link" style="width: 10%; float: right;cursor : pointer">1:1 문의</a>
					<a href="javascript:void(0);" class="nav-link" style="width: 30%; font-weight: bold; float: right; cursor: auto;">관리자님 환영합니다!</a>
				</c:if>
			</ul>
		</div>
	</div>
	<%-- Mobile --%>
	<div id="navMo" style="min-height:70px; ">
		<a class="navbar-brand" href="crime"><img src="/resources/img/logo.png" style="height: 30px;"></a>
		<button type="button" class="open_menu_layer ui_btn_pop" data-href="#menuLayer"><span class="blind">메뉴</span></button>
	</div>
	<div class="menu_layer open" id="menuLayer" data-pop="layer" style="z-index: 901;" tabindex="-1" style="display:none;">
		<!-- 로그인 전 -->
		<c:if test="${phone==null && admin == null}">
		<div id="webLogin_m" class="webLogin_m" style="font-size: 1.7rem; line-height: 1.3; text-align:center;">
			<p class="text">1분 만에 간편 회원가입하면,<strong class="txt_primary">7일간 100원에<br>컨텐츠 제공!</strong></p>
			<a href="#none" class="btn_primary" onclick="fnShowLogin();return false;"><span class="txt" id="btnLogin">로그인하기</span></a>
		</div>
		</c:if>
		<!-- //로그인 전 -->
		<!-- 로그인 후 -->
		<c:if test="${phone!=null}"><!-- style 수정 황선필 -->
		<div id="webLogin_m" class="webLogin_m" style="font-size: 1.7rem; line-height: 1.3; text-align:center;">
			<p class="text"><strong class="txt_primary">${session_nickname}님 환영합니다!</strong></p>
			<a class="btn_primary logout" href="#">로그아웃</a>
		</div>
		<%-- <div id="webLogin_m" class="webLogin_m" style="font-size: 1.9rem; line-height: 1.3; text-align:center;">
			<p class="text"><strong class="txt_primary">${session_nickname}님의 남은 서비스 이용 기간</strong></p>
			<p class="text">현재 0일 0시간 남아있습니다.</p>
		</div> --%>
		<div id="webLogin_m" class="webLogin_m" style="font-size: 1.7rem; line-height: 1.3; text-align:center;">
			<ul class="" style="width: 100%;">
				<li class="nav-item"><a class="nav-link_m" href="">> 서비스 소개</a></li>
				<ul class="" style="width: 100%;">
					<li class="nav-item"><a class="nav-link_m2" href="/rtPublicStatus"> > 실시간 공개현황</a></li>
					<li class="nav-item"><a class="nav-link_m2" href="#" onclick="joinchk(1);"> > 성범죄자 찾아보기</a></li>
					<li class="nav-item"><a class="nav-link_m2" href="#" onclick="joinchk(2);"> > 범죄주의 구간 확인</a></li>
				</ul>
				<li class="nav-item"><a class="nav-link_m" href="order">> 서비스 가입</a></li>
				<li class="nav-item"><a class="nav-link_m" href="faq">> FAQ</a></li>
				<li class="nav-item"><a class="nav-link_m" href="question">> 1:1 문의</a></li>
				<li class="nav-item"><a class="nav-link_m" href="#" onclick="withdrawal();">> 서비스 해지</a></li>
			</ul>
		</div>
		<div id="webLogin_m" class="webLogin_m" style="font-size: 1.7rem; line-height: 1.3; text-align:center;">
		</div>
		</c:if>
	</div>
</nav>
</div>