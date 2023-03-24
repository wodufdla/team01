<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<style>
.event {
	text-align: center;
	padding: 150px;
}
.form-check {
	text-align:left;
	margin: 10px 0 0 500px;
}
.u {
	text-decoration: underline;
}
.as {
	color: red;
	font-weight:bold;	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#chkAll").click(function() {
		if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#chkAll").prop("checked", false);
		else $("#chkAll").prop("checked", true); 
	});
});
</script>
<body>
<jsp:include page="common/header.jsp" />
	<div class="event">
		<img src="resources/img/event.jpg"><br><br>
			<a href="#" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">10,000캐시 받고 내 주변 범죄자 확인</a><br>
		
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="chkAll" value="option1" onclick="selectAll(this)">
		<label class="form-check-label as" for="inlineCheckbox1">전체 동의</label>
	</div>	
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option2"> 
		<label class="form-check-label" for="inlineCheckbox2">이용약관 <a class="u" href="#" onclick="window.open('service','service','width=414, height=700');">보기</a></label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option3"> 
		<label class="form-check-label" for="inlineCheckbox3">개인정보 취급방침 <a class="u" href="#" onclick="window.open('privacy','privacy','width=414, height=700');">보기</a></label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option4"> 
		<label class="form-check-label" for="inlineCheckbox3">상기 정기구독 내용을 확인하였습니다.</label>
	</div>
	</div>
<jsp:include page="common/footer.jsp" />
</body>
</html>