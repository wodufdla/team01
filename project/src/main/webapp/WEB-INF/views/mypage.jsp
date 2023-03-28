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
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#myinfo").click(function() {
			location.href="./myinfo";
		});
		
		$("#paymentHistory").click(function() {
			location.href="./paymentHistory";
		});

		

		
	});
	</script>

</head>

<body>
	<jsp:include page="common/header.jsp" />
	
	
<section id="faq" class="section-default" style="background-repeat : no-repeat; background-size : cover;">
		<button id="myinfo" type="button">내 정보</button>
		<button id="paymentHistory" type="button">결제 내역</button>
	
</section>	
	
	
		
	
	

    <jsp:include page="common/footer.jsp" />

</body>
</html>