<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.container {
	height: auto;
	min-height: 100%;
	padding-top: 50px;
  	padding-bottom: 90px;
}
.table-striped {
	margin-top: 20px;
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
.top{
	display:block;
}
/* 버튼 1번 css*/
.btn1 {
	border: none;
	border-radius: 3px;
	background-color: #666666;
	color: white;
	font-weight: 500;
	font-size: 15px;
	width: 120px;
	height: 50px;
	cursor: pointer;
}

.btn1:hover {
	opacity: 0.5;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/delUser.js"></script>
<title> </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div class="container">
	
	<!-- counting -->
	<div class="top"  >
		<h4 >[ 고객관리 - 탈퇴 ]</h4>
	</div>
	<div class="row panel-row">
	<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">총 회원</h5>
			<h1 class="overview-content">${mCount }</h1>
			<i class="far fa-file-alt"></i>
		</div>
	</div>
	<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">오늘 가입 회원</h5>
			<h1 class="overview-content">${mTodayCount }</h1>
			<i class="fas fa-users"></i>
		</div>
	</div>
	<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">서비스가입 회원</h5>
			<h1 class="overview-content">${serviceStatusY }</h1>
			<i class="fas fa-file-alt"></i>
		</div>
	</div>
	<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">탈퇴한 회원</h5>
			<h1 class="overview-content">${withdrawal }</h1>
			<i class="fas fa-user-circle"></i>
		</div>
	</div>
	</div>
	<div class="row panel-row">
	<div class="col">
		<div class="overview-div">
			<h6 class="overview-title">배너 통해 가입한 회원</h6>
			<h1 class="overview-content">${bUserCount}</h1>
			<i class="fas fa-user-circle"></i>
		</div>
	</div>
	<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">배너 클릭 횟수</h5>
			<h1 class="overview-content">${bClickCount}</h1>
			<i class="fas fa-user-circle"></i>
		</div>
	</div>
		<div class="col">
		<div class="overview-div">
			<h5 class="overview-title">탈퇴요청 회원</h5>
			<h1 class="overview-content">${reqWithdrawalCount }</h1>
			<i class="fas fa-user-circle"></i>
		</div>
		</div>
	</div>
	<br>

	
   	<table class="table table-striped">
   		<thead>
   			<tr>
   				<th>순번</th>
   				<th>핸드폰번호</th>
   				<th>요청일자</th>
   				<th>탈퇴여부</th>
   				<th>탈퇴처리</th>
   			</tr>
   		</thead>
   		<tbody>
   				<c:forEach var="vo" items="${reqWithdrawal }" varStatus="status">
   				<tr>
   					<input type="hidden" name="boardIdx" id="boardIdx" value="${vo.phone }">
   					<td><c:out value="${(pageMaker.totalCount-status.index)-((pageMaker.criteria.page-1)*pageMaker.criteria.numsPerPage)}" /></td>
   					<td>${vo.phone }</td>
   					<td>${vo.askDate}</td>
					<td>${vo.replyYn }</td>
					<td><button type="button" class="btn1"  name="deletBtn" data-idx="${vo.phone}" >탈퇴</button></td>
   				</tr>
   			</c:forEach>
   		</tbody>
   	</table>
  <script type="text/javascript">
   //회원탈퇴 버튼 클릭시 
     $("button[name=deletBtn]").on("click",function(e){
    	 var boardIdx = $(this).attr('data-idx');
    	
    	 alert("회원을 탈퇴처리");
    	// alert(boardIdx);
	    deleteWrite(boardIdx);//boardIdx 가지고 가기 
    	 });

    //회원 탈퇴처리 이벤트(값 가지고) 
    function deleteWrite(boardIdx){
    
    	$.ajax({
    		type : "get",
    		url : "adminbDel",
    		data : {
            	boardIdx: boardIdx
            },
    		success : function(data) {
    			if (data == "success") {
    				alert("회원탈퇴 완료되었습니다.");
    				location.reload();
    			}
    		},
    		error : function(data) {
    			alert("회원정보 탈되 실패 하였습니다.");
    			console.log(data);
    		}
    	});
    }
     
     </script>
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
   			if(keyword != null){
				location = 'customer?page=' + page + '&numsPerPage=' + $('#numsPerPage').val() + '&keyword=' + keyword + '&category=' + category;
   			} else {
   				location = 'customer?page=' + page + '&numsPerPage=' + $('#numsPerPage').val();
   			}
		}
    </script>
    
   
</body>
</html>