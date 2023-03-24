
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 1대1 문의 관리</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
/* header */
#admin_navigator {
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
	height: 130px;
	color: #444c57;
	padding-top: 20px;
}

#admin_navigationbar {
	position: relative;
	width: 1280px;
	height: 100px;
	margin: 0 auto;
}

#logo_wrap {
	position: absolute;
	top: 0;
	width: 100px;
}

#logo {
	width: 95px;
	height: 65px;
}

#admin_header_title {
	position: absolute;
	top: 30%;
	left: 150px;
	font-family: SUIT-SemiBold;
	font-size: 28px;
}
</style>
<style>
* {
	font-family: SUIT-Regular;
}

a {
	text-decoration: none;
}

#container {
	display: flex;
	flex-flow: row wrap;
	margin: 0 auto;
	width: 1200px;
	height: 800px;
}

#admin_nav {
	/* float: left; */
	width: 20%;
	height: 100%;
}

#admin_nav ul {
	border-right: 1px solid #ccc;
	width: 200px;
	height: 600px;
	padding-top: 50px;
}

#admin_nav li {
	margin: 25px;
}

#admin_nav li a {
	color: #444c57;
}

.main_menu {
	font-family: SUIT-SemiBold;
	font-size: 20px;
	font-weight: bold;
}

.sub_menu {
	padding-left: 30px;
	font-family: SUIT-Regular;
	font-size: 14px;
}

/* #main_body {
	width: 80%;
	height: 100%;
} */

</style>
<style>
.tableWrap {
	position: relative;
	top: 15%;
	margin-left: 15px;
	margin: 5%;
}

.page_title {
	border-bottom: 1px solid #ccc;
	height: 40px;
	font-family: SUIT-SemiBold;
	font-size: 25px;
	top: 70px;
	margin-left: 15px;
	position: relative;
}

.table {
	text-align: center;
}

.table tr th, .table tr td:not (:last-child ) {
	width: 100px;
	max-width: 100px;
	overflow: hidden;
}

.contentModal {
	position: absolute;
	width: 319px;
	height: 247px;
	background: #c1c1c1e4;
	bottom: -2px;
	right: 159px;
	padding: 16px;
	text-align: left;
	border: solid 1.7px;
	border-radius: 18px;
	overflow: auto;
	display: none;
}

.ansView {
	cursor: pointer;
}

.ansView:hover .contentModal {
	display: block;
}
/*  목록제목 CSS */
.replyend {
	position: relative;
	font-size: 25px;
	color: rgb(250, 250, 250);
	top: 5px;
    padding: 0.375rem 0.75rem;
	background-color:rgb(242 85 81);
	border: rgb(242 85 81); solid 1.5px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
.replyend2 {
	position: relative;
	font-size: 25px;
	color: rgb(250, 250, 250);
	top: 5px;
	padding: 0.375rem 0.75rem;
	background-color: rgb(89 121 217);
	border: rgb(89 121 217) solid 1.5px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
/*  답변 글자 CSS  */
#replyend {
	position: relative;
	font-size: 16px;
	color: rgb(250, 250, 250);
	top: 5px;
	background-color: rgb(102 102 102);
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}

#replyend2 {
	position: relative;
	font-size: 16px;
	top: 5px;
	
}
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="container">

		<div id="main_body">
			
			<div class="tableWrap">
				<p class="replyend" style="margin-bottom: 22px;">미응답 문의</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자(email)</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<form action="answer" method="get" id="answer">
							<c:forEach items="${ask_N}" var="askN">
								<tr>
									<input type="hidden" name="askno" value="${askN.askno}">
									<td>${askN.asktitle}</td>
									<td>${askN.askcategory}</td>
									<td>${askN.phone}</td>
									<td>${askN.askdate}</td>
									<td  style="width: 110px;"><a id="replyend"
										href="<%=request.getContextPath()%>/answer/${askN.askno}">답변하러가기</a>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty ask_N}">
								<td colspan="5" style="font-size: 18px">등록된 문의가 없습니다.</td>
							</c:if>
						</form>
					</tbody>
				</table>

				<p class="replyend2" style="margin-top: 75px; margin-bottom: 22px;">응답완료 문의</p>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ask_Y}" var="askY">
							<tr>
								<td>${askY.asktitle}</td>
								<td>${askY.askcategory}</td>
								<td>${askY.phone}</td>
								<td>${askY.askdate}</td>
								<td class="ansView"  style="width: 110px; position: relative;">
								<a id="replyend2" >답변내용확인</a>
									<div class="contentModal">
										<p>제목:${askY.asktitle}</p>
										<p>내용:${askY.askcontent}</p>
										<br>
										<br>
										<p>답변내용:${askY.anscontent}</p>
									</div>
								</td>

							</tr>
						</c:forEach>
						<c:if test="${empty ask_Y}">
							<td colspan="5" style="font-size: 18px">등록된 답변이 없습니다.</td>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	
	<jsp:include page="common/footer.jsp" />
	
	
	<script>
	<%-- var member=  '${Phone}';
	console.log("접근한회원정보: " + member);	
	
	if(member == 'admin') {
		console.log("안녕하세요 관리자님!");
	} else {
		alert("관리자 권한이 필요한 페이지입니다.");
		location.href='<%=request.getContextPath()%>/';
	}
		$("#admin_nav ul li a").click(function() {
			console.log("click()");
			var before_color = '#444c57';
			var after_color = '#9bbfd9';

			// 클릭한 이벤트 객체의 폰트색 변경
			$(this).css('color', after_color);
			// 클릭하지 않은 다른 객체들의 폰트색 변경
			$("#admin_nav > ul> li > a").not(this).css('color', before_color);
		}); --%>
		
		  $(".ansView").click(function() {
		        
		       	var option= "width=700, height=20";
		       	var m_no = $(this).children().val();
		       	var url = "<%=request.getContextPath()%>/ask/askno=";
		       	url += askno;
		       	
		       	console.log("url: " + url);
		        window.open(url, "popup", option);
			});
	</script>

</body>
</html>
