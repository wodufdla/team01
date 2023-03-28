
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 1:1 askY 응답완료 페이지 </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
	width: 1200px;
	height: 800px;
}

#admin_nav {
	/* float: left; */
	width: 20%;
	height: 100%;
}

#admin_nav ul {
	border-right: 1px solid #ccc;
	width: 200px;
	height: 600px;
	padding-top: 50px;
}

#admin_nav li {
	margin: 25px;
}

#admin_nav li a {
	color: #444c57;
}

.main_menu {
	font-family: SUIT-SemiBold;
	font-size: 20px;
	font-weight: bold;
}

.sub_menu {
	padding-left: 30px;
	font-family: SUIT-Regular;
	font-size: 14px;
}

/* #main_body {
	width: 80%;
	height: 100%;
} */
</style>
<style>
.tableWrap {
	position: relative;
	top: 15%;
	margin-left: 15px;
	margin: 5%;
}

.page_title {
	border-bottom: 1px solid #ccc;
	height: 40px;
	font-family: SUIT-SemiBold;
	font-size: 25px;
	top: 70px;
	margin-left: 15px;
	position: relative;
}

.table {
	text-align: center;
}

.table tr th, .table tr td:not(:last-child) {
	
	overflow: hidden;
}
.contentModal {
	position: absolute;
	width: 319px;
	height: 247px;
	background: #c1c1c1e4;
	bottom: -2px;
	right: 159px;
	padding: 16px;
	text-align: left;
	border: solid 1.7px;
	border-radius: 18px;
	overflow: auto;
	display: none;
}

.ansView {
	cursor: pointer;
}

.ansView:hover .contentModal {
	display: block;
}

#replyend {
	position: relative;
	font-size: 16px;
	color: rgb(250, 250, 250);
	top: 5px;
	background-color:  rgb(241 85 87);
	box-shadow: 0px 2px 4px -1px #0000000f, 0px 4px 6px -1px #0000001a;
}

.butT{
padding: 10px;
float: right;
	

}
.but-titletit {
	color: #444;
	font-weight: bold;
	width: 160px;
	height: 50px;
	border-radius: .25rem;
	cursor: pointer;
	font-size: 15px;
	border: 1px solid #dee2e6;
	background-color: #dee2e6;
	
}

.but-titletit:hover {
  
  background-color: rgba(0, 0, 0, 0.04);
  box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
  
	
}
.col{
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
<script type="text/javascript">

//문의 미답변 페이지 이동 

function askNBtn(){
	location.href = "/askN";	
}

function askYBtn(){
	location.href = "/askY";	
}
function askBtn(){
	location.href = "/ask";	
}
</script>
</head>
<body>
	<jsp:include page="common/header.jsp" />


	<div class="container">
		<div id="main_body">
		
			<div class="tableWrap">
			<div class="top">
			<h4 >[ 1:1 문의 _답변완료 ]</h4>
			</div>
			<div class="row panel-row">
							<div class="col">
								<div class="overview-div">
									<h5 class="overview-title">총 문의글 수 </h5>
									<h1 class="overview-content">${askTotalCount}</h1>
									<i class="far fa-file-alt"></i>
								</div>
							</div>
							<div class="col">
								<div class="overview-div">
									<h5 class="overview-title">오늘 문의글 수 </h5>
									<h1 class="overview-content">${askTodayCount}</h1>
									<i class="fas fa-users"></i>
								</div>
							</div>
							<div class="col">
								<div class="overview-div">
									<h5 class="overview-title">미답변 문의글 수 </h5>
									<h1 class="overview-content">${askNTotalCount}</h1>
									<i class="fas fa-file-alt"></i>
								</div>
							</div>
							<div class="col">
								<div class="overview-div">
									<h5 class="overview-title">답변완료 문의글 수</h5>
									<h1 class="overview-content">${askYTotalCount}</h1>
									<i class="fas fa-user-circle"></i>
								</div>
							</div>
				      </div>
			
				<div  class=butT>
				   <button class="but-titletit" onclick="askNBtn()" >관리자_문의미응답</button>
					<button  class="but-titletit" onclick="askBtn()" >관리자 _문의전체</button>
				</div>
			    
				<form action="ask" method="get">
					<input type="hidden" name="page" value="1"> 
					<input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
				</form>
			
				<table class="table table-hover">
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>문의종류</th>
							<th>핸드폰</th>
							<th>작성일</th>
							<th>결과</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ask_Y}" var="askY">
								<tr>
								    <td>${askY.rowNum}</td>
									<td>${askY.askTitle}</td>
									<td>${askY.askCategory}</td>
									<td>${askY.phone}</td>
									<td>${askY.askDate}</td>
									<td class="ansView" style="width: 110px;position: relative;">답변내용확인
								     <div class="contentModal">
										<p>제목:${askY.askTitle}</p>
										<p>내용:${askY.askContent}</p>
										<br><br>
										<p>답변내용:${askY.ansContent}</p>
									 </div>
									</td>
								</tr>
						</c:forEach>
					    <c:if test="${empty ask_Y}">
							<td colspan="5" style="font-size: 18px">등록된 답변이 없습니다.</td>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<c:choose>
			<c:when test="${pageMaker.criteria.keyword eq null}">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.hasPrev }">
						<li class="page-item"><a class="page-link"
							href="askY?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPageNo }"
						end="${pageMaker.endPageNo }" var="num">
						<li id="page${num}" class="page-item"><a class="page-link"
							href="askY?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.hasNext }">
						<li class="page-item"><a class="page-link"
							href="askY?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&gt;</a></li>
					</c:if>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.hasPrev }">
						<li class="page-item"><a class="page-link"
							href="askY?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">&lt;</a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPageNo }"
						end="${pageMaker.endPageNo }" var="num">
						<li id="page${num}" class="page-item"><a class="page-link" id="page2${num}"
							href="askY?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.hasNext }">
						<li class="page-item"><a class="page-link"
							href="askY?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}}">&gt;</a>
						</li>
					</c:if>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>



	<jsp:include page="common/footer.jsp" />
		<script>
		$(".ansView").click(function() {
			var option = "width=700, height=20";
			var m_no = $(this).children().val();
			var url = "/ask/askNo=";
			url += askNo;
			console.log("url: " + url);
			window.open(url, "popup", option);
		});
	</script>
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
   			if(keyword != null){
				location = 'ask?page=' + page + '&numsPerPage=' + $('#numsPerPage').val() + '&keyword=' + keyword + '&category=' + category;
   			} else {
   				location = 'ask?page=' + page + '&numsPerPage=' + $('#numsPerPage').val();
   			}
		}
   		
    </script>


</body>
</html>
