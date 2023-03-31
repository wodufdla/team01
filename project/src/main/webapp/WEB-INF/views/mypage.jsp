<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title> 마이 페이지 </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#modify").click(function() {
		location.href="./modify2";
	});
	
	$("#paymentHistory").click(function() {
		location.href="./paymentHistory";
	});
});
</script>
<style>
.container {
	height: auto;
	width: 70%;
	min-height: 100%;
	padding-top: 60px;
  	padding-bottom: 60px;
}
.table {
	text-align: center;
}
.btn {
	width: 100%;
	margin-top: 30px;
}
#modify, #paymentHistory {
	width: 20%;
	margin: 0px auto 50px auto;
	background-color: #1a374f;
	color: #fff;
	font-size: 1em;
	font-weight: bold;
	text-align: center;
	height: 50px;
	line-height: 50px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="container">
		<div>
			<h2> > 내 정보</h2>	
			<table class="table table-hover">
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<td>카카오톡 아이디 값</td>
					<td>${phone}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${session_email}</td>
				</tr>
				<tr>
					<td>가입한 날짜</td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${session_join_date}"/></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${session_nickname}</td>
				</tr>
				<tr>
					<td>가입경로</td>
					<td>
					<c:if test="${session_banner==1}">
						배너에서 가입
					</c:if>
					<c:if test="${session_banner==2}">
						회사 홈피에서 가입
					</c:if>
					</td>
				</tr>
				<tr>
					<td>서비스 가입 유무</td>
					<td>
					<c:if test="${serviceYN eq 'Y'}">
						서비스 가입 완료
					</c:if>
					<c:if test="${serviceYN eq 'N'}">
						서비스 미가입
					</c:if>
					</td>
				</tr>
			</table>
		</div>

		<div class="btn">
			<input id="modify" type="button" value="정보수정">
			<input id="paymentHistory" type="button" value="결제내역" >
		</div>
	</div>

    <jsp:include page="common/footer.jsp" />

</body>
</html>