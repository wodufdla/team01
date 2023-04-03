<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>마이 페이지_결제내역</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

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
	width: 1250px;
	height: 900px;
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

.container {
	height: auto;
	width: 70%;
	min-height: 100%;
	padding-top: 60px;
	padding-bottom: 140px;
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

#replyend {
	position: relative;
	font-size: 16px;
	color: rgb(250, 250, 250);
	top: 5px;
	background-color: rgb(241, 85, 87);
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}

.butT {
	padding: 10px;
	float: right;
}

.but-titletit {
	color: #444;
	font-weight: bold;
	width: 160px;
	height: 50px;
	border-radius: .25rem;
	cursor: pointer;
	font-size: 15px;
	border: 1px solid #dee2e6;
	background-color: #dee2e6;
}

.but-titletit:hover {
	background-color: rgba(0, 0, 0, 0.04);
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
}

.col {
	cursor: pointer;
	border-color: #364f9b;
	border-radius: .25rem;
	border: 1px solid #aaa;
	background-color: #fff;
	border-radius: 0.5em;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
	padding: 0.6em 1.4em 0.5em 0.8em;
	margin: 3px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$("#myinfo").click(function() {
			location.href = "myinfo";
		});

		$("#paymentHistory").click(function() {
			location.href = "paymentHistory";
		});

	});
</script>

</head>

<body>
	<jsp:include page="common/header.jsp" />
	<c:if test="${empty session_orderno}">
		<div class="container">
			<h2>> 결제내역</h2>
			결제내역이 없습니다.<br>
			<br>
			<br>
			<br>
			<br>
			<div style="text-align: center;">
				<input id="back" type="button" value="뒤로가기" onclick="history.go(-1)"
					style="width: 20%; margin: 0px auto 50px auto; background-color: #1a374f; 
					color: #fff; font-size: 20px; font-weight: bold; text-align: center; height: 50px; line-height: 50px; cursor: pointer;">
			</div>
		</div>
	</c:if>


	<c:if test="${not empty session_orderno}">
		<div class="container">
			<h2>> 결제내역</h2>
			<table class="table table-hover">
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<td>주문번호</td>
					<td>${session_orderno}</td>
				</tr>
				<tr>
					<td>폰 번호</td>
					<td>${phone}</td>
				</tr>
				<tr>
					<td>서비스종류</td>
					<td>
					<c:if test="${session_ordercont==1}">100원결제</c:if>
					<c:if test="${session_ordercont==2}">일반정기결제</c:if>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${session_price}</td>
				</tr>
				<tr>
					<td>자동결제상태</td>
					<td>
					<c:if test="${session_status==1}">자동결제처리안됨</c:if> 
					<c:if test="${session_status==2}">자동결제처리됨</c:if>
					</td>
				</tr>
				<tr>
					<td>서비스구매시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${session_rqsttime}" />
					</td>
				</tr>
				<tr>
					<td>서비스처리시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${session_success}" />
					</td>
				</tr>
				<tr>
					<td>다음결제시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${session_nextorderdate}"/>
					</td>
				</tr>
				<tr>
					<td>자동결제시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${session_autoorderdate}" />
					</td>
				</tr>
			</table>
		</div>
		<div style="text-align: center;">
			<input id="back" type="button" value="뒤로가기" onclick="history.go(-1)"
				style="width: 20%; margin: 0px auto 50px auto; background-color: #1a374f; 
				color: #fff; font-size: 20px; font-weight: bold; text-align: center; height: 50px; line-height: 50px; cursor: pointer;">
		</div>
	</c:if>

	<jsp:include page="common/footer.jsp" />

</body>
</html>