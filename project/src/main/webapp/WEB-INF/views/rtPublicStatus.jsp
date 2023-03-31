<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>실시간 공개현황</title>
<style type="text/css">
.contain {
	margin: 30px auto;
	width: 60%;
}
span {
	color: #3f78c5;
}
table {
	width: 100%;
	border-top: 1px solid #cecece;
	border-collapse: collapse;
	text-align: center;
}
th{
	background-color: #eeeeee;
	border-bottom: 1px double #cecece;
	border-left: 1px solid #eeeeee;
	padding: 10px;
}
td {
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
	padding: 10px;
}
th:first-child, td:first-child {
	border-left: none;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" />
<div class="contain">
	<h3>실시간 공개현황</h3>
	<div>
	<h4>> 특별시＊광역시/도 성범죄자 통계</h4>
	<p>
	우리나라의 특별시, 광역시, 각 시도별 성범죄자 통계를 보실 수 있습니다.<br>
	<span>통계는 실제 거주지 주소 공개자 수입니다.</span>
	</p>
	</div>
	<div>
		<table summary="특별시＊광역시/도,성범죄자 수 순서로 성범죄자 통계를를 나타낸 표 입니다">
			<colgroup>
				<col width="40%">
				<col width="60%">
			</colgroup>
			<thead>
			<tr>
				<th scope="col">특별시＊광역시/도</th>
				<th scope="col">성범죄자 수</th>
			</tr>
			</thead>
			<tbody>
				<!-- 지역별 성범죄자 수 -->
				<tr>
					<td><b>총계</b></td>
					<td><strong id="totCount"><fmt:formatNumber value="${total }" pattern="#,###" /></strong>명</td>
				</tr>
				<c:forEach items="${list }" var="list">
				<tr>
					<td><b>${list.name }</b></td>
					<td><strong><fmt:formatNumber value="${list.count }" pattern="#,###" /></strong>명</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="common/footer.jsp" />
</body>
</html>