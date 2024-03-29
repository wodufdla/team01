<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#modify").click(function() {
			location.href = "./modify";
		});

		$("#paymentHistory").click(function() {
			location.href = "./paymentHistory";
		});
	});
</script>

<style>
.container {
	height: auto;
	width: 70%;
	min-height: 100%;
	padding-top: 60px;
}

.table {
	text-align: center;
}

.btn {
	width: 100%;
	margin-top: 30px;
}

.bnt3 {
	width: 22%;
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
			<h2>> 내 정보</h2>
			<table class="table table-hover">
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<td>핸드폰 번호</td>
					<td><c:set var="phone" value="${user.phone}" />${fn:substring(phone,0,3) }-${fn:substring(phone,3,7) }-${fn:substring(phone,7,13) }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${user.email}</td>
				</tr>
				<tr>
					<td>가입한 날짜</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${user.joinDate}" /></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${user.nickname}</td>
				</tr>
				<tr>
					<td>가입경로</td>
					<td><c:if test="${user.banner==1}">
						배너 통해서 가입
					</c:if> <c:if test="${user.banner==2}">
						회사 홈페이지에서 가입
					</c:if></td>
				</tr>
				<tr>
					<td>서비스 가입 유무</td>
					<td id="serviceyn" value="${user.serviceyn}">
					<c:if test="${user.serviceyn eq 'Y'}">
						서비스 가입 완료
					</c:if> 
					<c:if test="${user.serviceyn eq 'N'}">
						서비스 미가입
					</c:if></td>
					
				</tr>
			</table>
		</div>

		<div class="btn">
			<input class="bnt3" id="modify" type="button" value="정보수정"> <input
				class="bnt3" id="withdrawal" type="button" value="회원탈퇴"> <input
				class="bnt3" id="paymentHistory" type="button" value="결제내역">
		</div>
	</div>
	<jsp:include page="common/footer.jsp" />
	
	
<script type="text/javascript">
	/*탈퇴버튼 클릭시   1.서비스해지  (7일 이후) 1.탈퇴가능 >문의하기 게시판 이용 */
	$("#withdrawal").click(function() {
		var phone = "${phone}"
		var userJoinDate = "${session_join_date}"
		 
		
		var today = new Date(); //오늘날짜
		var joinDate = new Date(userJoinDate); //가입날짜

		joinDate.setDate(joinDate.getDate() + 7);
		// alert(today.getTime());// 현재날짜

		if (today.getTime() > joinDate.getTime()) {
			alert("탈퇴는 1:1 문의 게시판을 이용해주세요."); //가입일자 7일 이후에 나오는 멘트
		} else {
			alert("서비스 가입 후 7일 이후에  해지하실 수 있으며, 1:1 문의 게시판을 이용해주세요 "); //가입후 7일 이전까지 멘트
			return false;
		}

	});
</script>
</body>
</html>