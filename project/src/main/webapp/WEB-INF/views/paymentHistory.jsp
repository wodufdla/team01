<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.container {
	height: auto;
	width: 70%;
	min-height: 100%;
	padding-top: 60px;
	/* padding-bottom: 140px; */
}

/* #main_body {
	width: 80%;
	height: 100%;
} */

.table {
	text-align: center;
}

.table tr th, .table tr td:not (:last-child ) {
	width: 100px;
	max-width: 100px;
	overflow: hidden;
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
</head>

<body>
	<jsp:include page="common/header.jsp" />
	<c:if test="${empty order.orderNo}">
		<div class="container">
			<h2>> 결제내역</h2><br><br>
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


	<c:if test="${not empty order.orderNo}">
		<div class="container">
			<h2>> 결제내역</h2>
			<table class="table table-hover">
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<td>주문번호</td>
					<td>${order.orderNo}</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td><c:set var="phone" value="${order.phone}" />${fn:substring(phone,0,3) }-${fn:substring(phone,3,7) }-${fn:substring(phone,7,13) }</td>
				</tr>
				<tr>
					<td>서비스종류</td>
					<td>
					<c:if test="${order.orderCont==1}">범죄알리미 서비스(이벤트가입)</c:if><!--  100원 결제 7일 서비스 -->
					<c:if test="${order.orderCont==2}">범죄알리미 서비스(정기결제)</c:if><!--  29900원 결제 정기한달 서비스 -->
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td><fmt:formatNumber value="${order.price }" pattern="#,###" /></td>
				</tr>
				<tr>
					<td>서비스 유효 여부</td>
					<td>
					<c:if test="${order.status==0}">만료</c:if>
					<c:if test="${order.status==1}">유지중</c:if> 
					<c:if test="${order.status==2}">해지</c:if>
					</td>
				</tr>
				<tr>
					<td>서비스구매시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${order.rqstTime}" />
					</td>
				</tr>
				<tr>
					<td>서비스처리시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${order.successTime}" />
					</td>
				</tr>
				<tr>
					<td>다음결제시간</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${order.nextOrderDate}"/>
					</td>
				</tr>
			</table>
		</div>
		<div style="text-align: center;">
			<input id="back" type="button" value="뒤로가기" onclick="history.go(-1)"
				style="width: 22%; margin: 10px auto 50px auto; background-color: #1a374f; 
				color: #fff; font-size: 20px; font-weight: bold; text-align: center; height: 50px; line-height: 50px; cursor: pointer;">
		</div>
	</c:if>

	<jsp:include page="common/footer.jsp" />

</body>
</html>