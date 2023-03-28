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

<title> 마이 페이지 </title>

	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
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

.table {
	text-align: center;
}

.table tr th, .table tr td:not(:last-child) {
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
	background-color:  rgb(241 85 87);
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}

.butT{
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
.col{
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
			location.href="myinfo";
		});
		
		$("#paymentHistory").click(function() {
			location.href="paymentHistory";
		});

		

		
	});
	</script>

</head>

<body>
	<jsp:include page="common/header.jsp" />
	
<h2>내 정보</h2>	
<table class="table table-hover">
<thead>
<tr>
<th>1.폰번호</th>
<th>2.이메일</th>
<th>3.가입한 날짜</th>
<th>4.닉네임</th>
<th>5.배너통해서 가입 유무</th>
<th>6.서비스 가입 유무</th>

</tr>
</thead>
<tbody>
<tr>
<td>${phone}</td>
<td>${session_email}</td>
<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${session_join_date}"/></td>
<td>${session_nickname}</td>
<td>
<c:if test="${session_banner==1}">
	배너에서 가입
</c:if>
<c:if test="${session_banner==2}">
	회사 홈피에서 가입
</c:if>

</td>
<td>
<c:if test="${serviceYN eq 'Y'}">
	서비스 가입 완료
</c:if>
<c:if test="${serviceYN eq 'N'}">
	서비스 미가입
</c:if>

</td>

</tr>
</tbody>

</table>	
	
		
	
	

    <jsp:include page="common/footer.jsp" />

</body>
</html>