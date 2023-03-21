<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title> </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="container">
		<h1>고객 정보</h1>
   	<table class="table table-striped">
   		<thead>
   			<tr>
   				<th>닉네임</th>
   				<th>이메일</th>
   				<th>핸드폰번호</th>
   				<th>탈퇴여부</th>
   				<th>가입일자</th>
   			</tr>
   		</thead>
   		<tbody>
   			<c:forEach var="vo" items="${list }">
   				<tr>
   					<td>${vo.nickname }</td>
   					<td>${vo.email }</td>
   					<td>${vo.phone }</td>
   					<td>${vo.withdrawal }</td>
   					<td><fmt:formatDate value="${vo.joinDate }" pattern="YYYY.MM.DD HH:mm:ss"/></td>
   				</tr>
   			</c:forEach>
   		</tbody>
   	</table>
   	<br>
   	<nav aria-label="Page navigation example">
	   	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.hasPrev }">
			<li class="page-item"><a class="page-link" href="customer?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&lt;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPageNo }"
			end="${pageMaker.endPageNo }" var="num">
			<li id="page${num}" class="page-item"><a class="page-link" href="customer?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}">${num }</a></li>
		</c:forEach>
		<c:if test="${pageMaker.hasNext }">
			<li class="page-item"><a class="page-link" href="customer?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&gt;</a></li>
		</c:if>
		</ul>
	</nav>
	</div>
    <jsp:include page="common/footer.jsp" />
    <script type="text/javascript">
   		var admin = '<%=(String)session.getAttribute("admin")%>';
   		if (admin == 'null') {
   			location = '/';
   		}
   		
   		function getParameterByName(name) {
		  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		  results = regex.exec(location.search);
		  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
   		var page = getParameterByName('page');
   		var paging = document.getElementById("page" + page);
   		if($('#page' + page).text() == page) {
   			paging.className = 'page-item active';
   		} else {
   			for (var i = 1; i < 6; i++) {
   				paging.classList.remove('active');
   			}
   		}
   		
    </script>
</body>
</html>