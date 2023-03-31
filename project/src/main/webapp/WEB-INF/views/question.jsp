<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의하기 리스트</title>
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
	width: 85%;
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
	/*  top: 200px;*/
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
.allWrap .asksort {
	position: relative;
	font-size: 15px;
	color: #000;
	top: 5px;
	margin-left: 10px;
	height: 21px;

}
.allWrap .replyend {
	position: relative;
	font-size: 15px;
	color: rgb(250, 250, 250);
	top: 5px;
	margin-left: 10px;
	height: 21px;
	background-color: rgb(242 85 81);
	border: rgb(242 85 81) solid 1.5px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}
.allWrap .replyend2 {
	position: relative;
	font-size: 15px;
	color: rgb(250, 250, 250);
	top: 5px;
	margin-left: 10px;
	height: 21px;
	background-color: rgb(89 121 217);
	border:rgb(89 121 217)  solid 1.5px;
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
.askDate {
	text-align: right;
	width: 22%;
	position: relative;
	left: 1%;
}
.askdelete {
	transition: all .3s;
	cursor: pointer;
	width: 80px;
	position: relative;
	left: 138px;
}
.askdelete:hover {
	color: #EF9A9A;
}
.askbox {
	margin-top: 10px;
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
	padding: 1px 1px 1px 5px;
	border-radius: 10px;
}
.tg2 {
display: none;
}
.askWrap{
padding:30px;
}
/* 버튼  css*/

.btn-check:focus+.btn, .btn:focus {
	outline: 0;
}

.btn-fill-fcolor {
	color: #fff;
	background-color: #192a5e;
	border-color: #364f9b;
	width: 160px;
	height: 50px;
	border-radius: .25rem;
	cursor: pointer;
	font-size: 20px;
	
}

.btn-fill-fcolor:hover {
    color:  #fff;
    background-color: rgb(89 121 217); 

	
}

.btn-check:checked+.btn-fill-fcolor, .btn-check:active+.btn-fill-fcolor,
	.btn-fill-fcolor:active, .btn-fill-fcolor.active, .btn-fill-fcolor.dropdown-toggle.show {
    color: #fff;
    background-color: #9bbfd9; 
	border-color: #9bbfd9;
}

.btn-fill-fcolor:disabled, .btn-fill-fcolor.disabled {
	color: #9bbfd9;
	background-color: transparent; 
}

.pasgbody{
padding:30px;
}

</style>

</head>
<body>
<jsp:include page="common/header.jsp" />
 <div class="allWrap">
		<div class="imgWrap"></div>
		
		<div class="top" >
			<p>
				<p style="top: 20px; position: relative; font-family: SUIT-SemiBold; font-size: 25px; font-weight: 500;">
				${session_nickname}님의 1:1 문의 내역</p>
				<input type="hidden" name="phone" value="${phone}" />
				<hr style="width: 29%; margin: 0 auto; position: relative; top: 30px; border-style: groove;">
			</p>
		</div>
		
		<div class="askWrap" style="width: 100%; margin: 10% auto;">
			<ul>
				<li style="display: flex;">
				    <c:if test="${not empty ask}">
						<a href="/doAskView">
							<button  class= btn-fill-fcolor >문의하기</button>
						 </a>
					</c:if>
			    </li>
					<c:forEach items="${ask}" var="ask">
					<form action="deleteAsk.do" method="post" id="deleteAsk">
					
					<input type="hidden" name="page" value="1">
		            <input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
		             
						<div class="askbox" style="position: relative;">
							<li style="display: flex; margin-top: 30px;margin-bottom: 10px;">
								<h2 class="ask01">${ask.askTitle}</h2> <span class="asksort">${ask.askCategory}문의</span>
								<c:if test="${ask.replyYn eq 'N'}">
									<span class="replyend">답변대기</span>
								</c:if> <c:if test="${ask.replyYn eq 'Y'}">
									<span class="replyend2">답변완료</span>
								</c:if> <span class="toggle tg1">&#9660</span> <span class="toggle tg2">&#9650</span>
							</li>
							<li class="content">
								<div style="display: flex;">
									<span style="width: 75%;">${ask.askContent}</span>
									<div class="askDate">
										<p>${ask.askDate}</p>
										<p class="askdelete" id="askdelete${ask.askNo}">삭제하기</p>
										
										<input type="hidden" name="askNo" value="${ask.askNo}">
									</div>
								</div>
								<hr style="width: 100%; margin: 20px auto 20px;">
								<h4 style="width: 75%;">
									<c:if test="${ask.replyYn eq 'N'}">답변을 기다리는 중입니다. </c:if>
								</h4>
								<h4>
									<c:if test="${ask.replyYn eq 'Y'}">${ask.ansContent}</c:if>
								</h4>
							</li>
						</div>
					</form>
				</c:forEach>
			</ul>
			<c:if test="${empty ask}">
				<div style="position: relative; top: 60px;">
					<h4>등록된 1:1 문의가 없습니다.</h4>
					<h4>궁금하거나 건의할 사항이 있다면 언제든지 문의해주세요!</h4>
				</div>
				<a href="/doAskView">
				<button class="btn-fill-fcolor" style="position: relative; top: 90px;">문의하기</button></a>
			</c:if>
		</div>

 </div>
 <div class="pasgbody">
    <c:choose>

	   	<c:when test="${pageMaker.criteria eq null}">
		   	<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.hasPrev }">
					<li class="page-item"><a class="page-link" href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&lt;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo }"
					end="${pageMaker.endPageNo }" var="num">
					<li id="page${num}" class="page-item"><a class="page-link" href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext }">
					<li class="page-item"><a class="page-link" href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&gt;</a></li>
				</c:if>
			</ul>
		</c:when>
	
		<c:otherwise>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.hasPrev }">
					<li class="page-item">
						<a class="page-link" href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}">&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo }"
					end="${pageMaker.endPageNo }" var="num">
					<li id="page${num}" class="page-item">
						<a class="page-link" id="page2${num}" href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}">${num }</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext }">
					<li class="page-item">
						<a class="page-link" href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}}">&gt;</a>
					</li>
				</c:if>
			</ul>
		</c:otherwise>
		
	</c:choose>	
 </div>


<jsp:include page="common/footer.jsp" />


  <script>
		$(document).ready(function() {
			var tDegree = 0;
			$(".content").hide();
			
	/* 토글 */
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
			/* 삭제 부분 */	
			$("[id^='askdelete']").click(function() {
				console.log($(this));
				console.log($(this).parents("form"));
				if (confirm("삭제하시겠습니까?")) {
					$(this).parents("form").submit();
				} else {
					return false;
				}
			});
			/* 수정 부분 - 에이작스로 수정예정*/	
			
			
			
		});
	</script>
</body>

</html>