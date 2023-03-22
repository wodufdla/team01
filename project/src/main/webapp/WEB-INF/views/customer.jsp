<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
select, input{
	float: right;
 	-moz-appearance: none;
  	-webkit-appearance: none;
 	appearance: none;
 	line-height: 1.5;

	color: #444;
	background-color: #fff;
	
	padding: 0.6em 1.4em 0.5em 0.8em;
	margin: 0;
	
	border: 1px solid #aaa;
	border-radius: 0.5em;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
}
select:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222;
  outline: none;
}
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
	<br>
	<form action="customer" method="get">
		<input type="submit" value="검색">	
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
		<input type="text" id="keyword" name="keyword">
		<select name="category">
			<option value="all">전체검색</option>
			<option value="nickname">닉네임</option>
			<option value="phone">핸드폰</option>
			<option value="email">E-mail</option>
		</select>
	</form>
	<br>
	<br>
	<select name="numsPerPage" id="numsPerPage" onchange="selectChange()">
		<option value="">-- 선택 --</option>
		<option value="3">3 개</option>
		<option value="5">5 개</option>
		<option value="7">7 개</option>
		<option value="10">10 개</option>
	</select>
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
   	<c:choose>
	   	<c:when test="${pageMaker.criteria.keyword eq null}">
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
		</c:when>
		<c:otherwise>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.hasPrev }">
					<li class="page-item">
						<a class="page-link" href="customer?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo }"
					end="${pageMaker.endPageNo }" var="num">
					<li id="page${num}" class="page-item">
						<a class="page-link" id="page2${num}" href="customer?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">${num }</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext }">
					<li class="page-item">
						<a class="page-link" href="customer?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}}">&gt;</a>
					</li>
				</c:if>
			</ul>
		</c:otherwise>
	</c:choose>	
	</div>
    <jsp:include page="common/footer.jsp" />
    <script type="text/javascript">
   		var admin = '<%=(String)session.getAttribute("admin")%>';
   		if (admin == 'null') {
   			location = '/';
   		}
   		
   		const urlParams = new URL(location.href).searchParams;
   		const numsPerPage = urlParams.get('numsPerPage');
   		$('#numsPerPage').val(numsPerPage).attr('selected', 'selelcted');
   		
   		const page = urlParams.get('page');
   		var paging = document.getElementById("page" + page);
   		if($('#page' + page).text() == page || $('#page2'+page).text() == page) {
   			paging.className = 'page-item active';
   		} else {
   			for (var i = 1; i < 6; i++) {
   				paging.classList.remove('active');
   			}
   		}
   		const keyword = urlParams.get('keyword');
   		const category = urlParams.get('category');
   		function selectChange() {
   			if(keyword != ''){
				location = 'customer?page=' + page + '&numsPerPage=' + $('#numsPerPage').val() + '&keyword=' + keyword + '&category=' + category;
   			} else {
   				location = 'customer?page=' + page + '&numsPerPage=' + $('#numsPerPage').val();
   			}
		}
   		
   		
    </script>
</body>
</html>