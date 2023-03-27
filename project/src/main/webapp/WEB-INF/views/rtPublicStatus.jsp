<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>실시간 공개현황</title>
<style type="text/css">
span {
	color: #3f78c5;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" />
<h3>공개현황 (실시간)</h3>
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
			<col width="30%">
			<col width="70%">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">특별시＊광역시/도</th>
			<th scope="col">성범죄자 수</th>
		</tr>
		</thead>
		<tbody>
			<!-- 지역별 성범죄자 수 -->
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.name }</td>
				<td>${list.count }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="common/footer.jsp" />
</body>
</html>