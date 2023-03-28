<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>문의하기 등록페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/button.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	font-family: SUIT-Regular;
}
body {
	width: 100%;
}
.askAllWrap {
	width: 1200px;
	margin: 100px auto 0;
}
.textWrap {
	width: 900px;
	margin: 0 auto;
}
.askAllWrap .titleWrap {
	display: flex;
	justify-content: left;
	align-items: center;
}
.askCategory {
	position: relative;
	left: 22px;
	height: 45px;
	width: 95px;
	font-size: 15px;
	border-radius: 5px;
	text-align: center;
}
.askCategory:hover {
	border-color: #9bbfd9;
}
.askAllWrap .contentWrap {
	display: flex;
	justify-content: center;
	align-items: center;
}
.buttonWrap {
	margin-top: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.askContent {
	margin-top: 15px;
}
.askboxborder {
	padding: .375rem .75rem;
	font-size: 15px;
	font-weight: 400;
	color: #212529;
	background-color: #fff;
	border: 1.8px solid #212529;
	border-radius: 5px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}
.askboxborder:hover {
	border-color: #9bbfd9;
}
.askboxborder:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9bbfd9;
	outline: 0;
	box-shadow: 0 0 0 .10rem #9bbfd9;
}
.askboxborder-color::-moz-color-swatch {
	border-radius: 3px;
}
.askTop {
	display: flex;
	width: 120px;
	font-size: 22px;
	margin: 20px auto;
	background: white;
	z-index: 999;
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
	.btn-fill-fcolor:active, .btn-fill-fcolor.active, .btn-fill-fcolor.dropdown-toggle.show
	{
    color: #fff;
    background-color: #9bbfd9; 
	border-color: #9bbfd9;
}

.btn-fill-fcolor:disabled, .btn-fill-fcolor.disabled {
	color: #9bbfd9;
	background-color: transparent; 
}
</style>
</head>

<body>

<jsp:include page="common/header.jsp" />
 
<form method="post" id="frmAsk">
		<div class="askAllWrap">
			<div class="textWrap">
				<div>
					<h2 class="askTop">문의 글쓰기</h2>
					<hr
						style="position: relative; bottom: 35; z-index: -1; border: double;">
				</div>
				<input type="hidden" name="phone" value="${phone}" />
				<div class="titleWrap">
					<input class="askboxborder" type="text" name="askTitle" placeholder="제목을 입력해주세요."
						id="askTitle" style="width: 784px; height: 46px;"> 
						<select size="1" class="askCategory" name="askCategory">
							<option selected>환불</option>
							<option>결제</option>
							<option>상품</option>
							<option>기타</option>
					  </select>
				</div>
				<div class="contentWrap">
					<div>
						<textarea class="askContent askboxborder" name="askContent" placeholder="내용을 입력해주세요."
							id="askContent" style="width: 900px; height: 352px; resize: none;"></textarea>
						<br>
					</div>
				</div>
				<div class="buttonWrap" style="margin-bottom: 100px;">
					<button class= btn-fill-fcolor type="button"
						style="width: 206px;" onclick="ask_check();">등록하기</button>
				</div>
			</div>
		</div>
	</form>
	
	<script>
	/* 등록버튼 클릭시 이벤트 */
		function ask_check() {
			var title =  $("#askTitle").val();
			var content =  $("#askContent").val();
			var formData = $("#frmAsk").serialize();
			
			if (title == "") {
				alert("제목을 입력해 주세요.");
				title.focus();
				return false;
			}
			if (content == "") {
				alert("내용을 입력해 주세요.");
				content.focus();
				return false;
			} 
			//문의글 쓰기: 컨트롤러 doAsk 전달되는 ajax
			$.ajax({
				type: 'get',
				url : '/doAsk',
				data: formData,
				contentType : 'application/text; charset=UTF-8',
				success : function(data) {
					if (data == "success") {
						alert("문의하기 글 등록이 완료되었습니다.");
						location.href = "/question"; //문의하기 url 
					}
				},
				 error: function (request, status, error) {
					     alert("문의하기 글 등록이 실패하였습니다.");
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
				    }
			});
		};
	</script>

<jsp:include page="common/footer.jsp" />
</body>
</html>