<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ� ����Ʈ</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	box-sizing: border-box;
	padding: 0px;
}
/* .allWrap p, h2, h3, h4, h5, h6 {
	margin-left: 15px;
} */
.allWrap {
	width: 100%;
	text-align: center;
	width: 1200px;
	margin: 0 auto;
	word-break: break-all;
}
.allWrap .top {
	position: relative;
	top: 100px;
}
.allWrap .ask {
	position: relative;
	top: 130px;
	width: 60%;
	margin: 15px auto;
	border-radius: 10px;
	background-color: rgba(153, 153, 153, 0.333);
	display: flex;
	text-align: justify;
}
.allWrap .askWrap {
	align-items: center;
	justify-content: center;
	position: relative;
	top: 200px;
}
.allWrap .content {
	width: 95%;
	margin: 25px 0 30px 10px;
	text-align: left;
	padding: 20px;
	border-radius: 4px;
	background-color: rgba(243, 244, 245, 0.805);
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
.allWrap>.askWrap>li, h2 {
	margin-left: 10px;
}
.allWrap .reply {
	position: relative;
	text-align: left;
	top: 135px;
	width: 60%;
	margin: 0 auto;
	border-radius: 10px;
	background-color: rgba(153, 153, 153, 0.333);
	padding: 1px;
}
.allWrap .toggle {
    font-size: 30px;
    transition: all .4s;
    cursor: pointer;
    position: absolute;
    right: 51px;
    cursor: pointer;
}
.allWrap .content {
	margin-top: 20px;
	margin-bottom: 20px;
}
.allWrap .toggle:hover {
	color: #9bbfd9;
}
.allWrap ul, li {
	list-style: none;
}
.allWrap .ask_sort {
	position: relative;
	font-size: 15px;
	color: white;
	top: 5px;
	margin-left: 10px;
	height: 21px;
	background-color: chocolate;
	border: chocolate solid 1.5px;
}
.allWrap .reply_end {
	position: relative;
	font-size: 15px;
	color: rgb(250, 250, 250);
	top: 5px;
	margin-left: 10px;
	height: 21px;
	background-color: rgba(147, 135, 252, 0.819);
	border: rgba(147, 135, 252, 0.819) solid 1.5px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
.allWrap .reply_end2 {
	position: relative;
	font-size: 15px;
	color: rgb(250, 250, 250);
	top: 5px;
	margin-left: 10px;
	height: 21px;
	background-color: rgb(89, 179, 248);;
	border: rgb(89, 179, 248); solid 1.5px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
.allWrap .btn {
	margin: 33px 0 20px 10px;
	width: 200px;
}
.ask01 {
	width: 275px;
	text-align: left;
	font-size:18px;
}
.ask_date {
	text-align: right;
	width: 22%;
	position: relative;
	left: 1%;
}
.ask_delete {
	transition: all .3s;
	cursor: pointer;
	width: 80px;
	position: relative;
	left: 138px;
}
.ask_delete:hover {
	color: #EF9A9A;
}
.ask_box {
	margin-top: 10px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
	padding: 1px 1px 1px 5px;
	border-radius: 10px;
}
.tg2 {
display: none;
}
</style>

</head>
<body>
<jsp:include page="common/header.jsp" />
 <div class="allWrap">
		<div class="imgWrap"></div>
		<div class="top">
			<p>
			<p
				style="top: 20px; position: relative; font-family: SUIT-SemiBold; font-size: 25px;">${loginInfo.name}
				���� 1:1 ���� ����</p>
			<hr
				style="width: 29%; margin: 0 auto; position: relative; top: 30px; border-style: groove;">
			</p>
		</div>
		<div class="askWrap" style="width: 90%; margin: 0 auto;">
			<ul>
				<li style="display: flex;"><c:if test="${not empty ask}">
						<a href="<%=request.getContextPath()%>/customerCenter/doAsk">
							<button class="btn btn-fill-fcolor">�����ϱ�</button>
						</a>
					</c:if></li>


					<c:forEach items="${ask}" var="ask">
					<form action="deleteAsk.do" method="post" id="deleteAsk">
						<div class="ask_box" style="position: relative;">
							<li style="display: flex; margin-top: 30px;margin-bottom: 10px;">
								<h2 class="ask01">${ask.ask_title}</h2> <span class="ask_sort">${ask.ask_category}����</span>
								<c:if test="${ask.reply_yn eq 'N'}">
									<span class="reply_end">�亯���</span>
								</c:if> <c:if test="${ask.reply_yn eq 'Y'}">
									<span class="reply_end2">�亯�Ϸ�</span>
								</c:if> <span class="toggle tg1">&#9660</span> <span class="toggle tg2">&#9650</span>
							</li>
							<li class="content">
								<div style="display: flex;">
									<span style="width: 75%;">${ask.ask_content}</span>
									<div class="ask_date">
										<p>${ask.ask_date}</p>


										<p class="ask_delete" id="ask_delete${ask.ask_no}">�����ϱ�</p>
										<input type="hidden" name="ask_no" value="${ask.ask_no}">


									</div>
								</div>
								<hr style="width: 100%; margin: 20px auto 20px;">

								<h4 style="width: 75%;">
									<c:if test="${ask.reply_yn eq 'N'}">�亯�� ��ٸ��� ���Դϴ�. </c:if>
								</h4>
								<h4>
									<c:if test="${ask.reply_yn eq 'Y'}">${ask.ans_content}</c:if>
								</h4>

							</li>
						</div>
					</form>
				</c:forEach>
			</ul>
			<c:if test="${empty ask}">
				<div style="position: relative; top: 60px;">
					<h4>��ϵ� 1:1 ���ǰ� �����ϴ�.</h4>
					<h4>�ñ��ϰų� ������ ������ �ִٸ� �������� �������ּ���!</h4>
				</div>
				<a href="<%=request.getContextPath()%>/customerCenter/doAsk"><button
						class="btn btn-fill-fcolor" style="position: relative; top: 90px;">�����ϱ�</button></a>
			</c:if>
		</div>
	</div>



	
	<script>
		$(document).ready(function() {
			var tDegree = 0;
			$(".content").hide();
			
	/* ��� */
			$(".toggle").click(function() {
				$(this).parent().next().toggle("fast", "swing");	
			});
			$(".tg1").click(function() {
				$(this).next().show();
				$(this).hide();
			});
			$(".tg2").click(function() {
				$(this).prev().show();
				$(this).hide();
			});
			
			$("[id^='ask_delete']").click(function() {
				console.log($(this));
				console.log($(this).parents("form"));
				if (confirm("�����Ͻðڽ��ϱ�?")) {
					$(this).parents("form").submit();
				} else {
					return false;
				}
			});
		});
	</script>

</body>

</html>