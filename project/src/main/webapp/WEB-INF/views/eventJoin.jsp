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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
.svc {
	text-align:left;
	margin: 10px 0 0 600px;
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
<section id="faq" class="section-default" style="background-image: url('/resources/img/event.jpg'); background-repeat : no-repeat; background-size : cover;">
	<div class="event">
		<img src="resources/img/eventback.jpg"><br><br>
			<a href="#" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">10,000캐시 받고 내 주변 범죄자 확인</a><br>
		
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="chkAll" value="option1" onclick="selectAll(this)">
		<label class="form-check-label as" for="inlineCheckbox1">전체 동의</label>
	</div>	
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option2"> 
		<label class="form-check-label" for="inlineCheckbox2">이용약관 <a class="u" href="#" onclick="window.open('service','service','width=414, height=700');" style="color:white";>보기</a></label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option3"> 
		<label class="form-check-label" for="inlineCheckbox3">개인정보 취급방침 <a class="u" href="#" onclick="window.open('privacy','privacy','width=414, height=700');" style="color:white";>보기</a></label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" name="chk" value="option4"> 
		<label class="form-check-label" for="inlineCheckbox3">상기 정기구독 내용을 확인하였습니다.</label>
	</div>
	</div>
	<div class="svc">
		<p>
			본 서비스는 (주)아이티키에서 운영합니다.<br>
			고객센터 : itkey@itkey.co.kr / 대표번호 : 02-6959-9966<br>
			서비스 가입 시 문자발송 비용 100원이 결제됩니다.<br>
			7일(168시간) 무료체험 종료 후 서비스 정상금액 29,900원(vat포함)이 매월 통신요금에 합산되어 결제됩니다.<br>
			해당 상품의 해지 신청은 상품 가입으로부터 72시간 경과 후 가능합니다.<br>
			(72시간 저희 서비스를 이용하시는 조건으로 보상을 드리고 있습니다.)<br>
			무료기간이 끝나 결제가 진행되면 최초 한달은 의무사용 약정이 적용되어 취소/환불이 진행되지 않습니다.<br>
			<br>
			1명당 1번만 참여가능합니다.<br>
			이를 악용할 경우 법적 처벌을 받을수 있습니다.<br>
			<br>
			서비스 해지와 문의는 홈페이지 상단 '서비스해지' '문의'를 통해 가능합니다.<br>			
		</p>
	</div>
</section>	
<jsp:include page="common/footer.jsp" />
</body>
</html>