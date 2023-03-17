<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div>
		<h1>고객 정보</h1>
    </div>
    <div>
    	<table>
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
    					<td>${vo.joinDate }</td>
    				</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    	<hr>
    	<ul>
		<c:if test="${pageMaker.hasPrev }">
			<li><a href="customer?page=${pageMaker.startPageNo - 1 }">이전</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPageNo }"
			end="${pageMaker.endPageNo }" var="num">
			<li><a href="customer?page=${num }">${num }</a></li>
		</c:forEach>
		<c:if test="${pageMaker.hasNext }">
			<li><a href="customer?page=${pageMaker.endPageNo + 1 }">다음</a></li>
		</c:if>
	</ul>
    </div>
    <jsp:include page="common/footer.jsp" />
    <script type="text/javascript">
   		var admin = '<%=(String)session.getAttribute("admin")%>';
   		if (admin == 'null') {
   			location = '/';
   		}
    </script>
</body>
</html>