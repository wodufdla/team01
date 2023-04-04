<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지 _eventJoin</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<style>
.event {
	text-align: center;	
}
.t {
	margin-left: auto;
	margin-right: auto;
}
.u {
	text-decoration: underline;
}
.r {
	color: red;
	font-weight:bold;	
}
.svc {
	text-align:left;
	margin: 10px 0 0 600px;
}
</style>
<script type="text/javascript">
/* 모바일 버전 체크 */
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
$(document).ready(function() {
	
	var newDivHtml = '';
	newDivHtml += '<section id="faq" class="section-default" style="background: #ffa200;"><p>FAQ</p><hr><p>Frequently Asked Questions (자주 묻는 질문)</p><div class="table-responsive table-default" style="max-width: 1200px;"><table class="table"><tbody><tr><td>이용안내</td><td>휴대폰으로 홈페이지에 접속하셔서 범죄 알리미를 다운로드 받거나 구글 Play스토어에서 "범죄 알리미" 검색 후 다운로드하여 이용하시면 됩니다.</td></tr><tr><td>서비스 해지 안내</td><td>서비스 해지 방법은 가입 시 전화번호로 보내드렸으며 홈페이지 우측 상단에 서비스해지를 누르면 가능합니다.<br>해지가 정상 진행되시면 해지 문자를 받으실 수 있습니다. 이후 별도의 추가 결제는 발생하지 않습니다.<br>무료기간(168시간)이 지나 정상 구독되어 서비스 비용이 결제되면 이후 취소나 환불이 어려운 점 참고 부탁드립니다.</td></tr><tr><td>탈퇴안내</td><td>회원탈퇴는 로그인 후 내정보에서 하실 수 있으며, 범죄 알리미 서비스에서는 휴대폰번호 외 개인정보를 수집하지 않아 이메일 로그인 하신 회원들만 탈퇴하실 수 있습니다.</td></tr></tbody></table></div><span>이 외에 궁금한 사항은 1:1 문의로 남겨주시면 친절하게 답변해 드리겠습니다.</span></section>';

	var div = parent.document.createElement("div");
	div.id = "divMobile";
	div.innerHTML = newDivHtml;
	
    if(!isMobile) {
        //PC
		console.log("isMobile / PC : "+isMobile);
		$("#myDIV").hide();
	} else {
		//MOBILE
		console.log("isMobile / MOBILE : "+isMobile);
		parent.document.getElementById("targetDiv").appendChild(div);
	}
	
	$("#chkAll").click(function() {
		if($("#chkAll").is(":checked")) {
			$("input[name=chk]").prop("checked", true);
			//alert("allcheck");
		}
		else{
			$("input[name=chk]").prop("checked", false);
		}
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#chkAll").prop("checked", false);
		else{
			$("#chkAll").prop("checked", true); 
			
		}
	});
	
	$("#cashBtn").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total == checked){
			alert("회원가입 후 캐시 수령이 가능합니다.");
			
			 //동의 후 클릭한 수
			 $.ajax({
	     		 url:"./cashClick",
	     		type:"post",
	     		 success:function(data){
	     			 //alert("alertclick:"+data)
	     			 if(data==1){
	     				 //alert("click1");
	     				//opener.location.reload();
	     				//window.close();
	     			 }else{
	     				 //alert("else");
	     				 }
	     			 
	     		 },
	     		 error:function(textStatus){
	     			 alert("error : "+textStatus);
	     		 }
	     	  });
			 //아작스
			
			var child1;
			var child2;
			//child1 = window.open('register','register','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
			child2 = window.open('register','register','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
			//child.$("#banner").val(1);
		}else{
			alert("모든 동의가 이루어지지 않았습니다.");
			
		}

		
		
	});
	
});
</script>
<body>
 <!-- 배너통해서 왔는지 유무 황선필 -->
 <input type="hidden" id="banner" name="banner" placeholder="banner 입력"  maxlength="24" style="width: 100%; padding: 5px;" value="1">
<!-- 헤더 재 추가 -->
<jsp:include page="common/header2.jsp" />
<section id="faq" class="section-default" style="background-image: url('/resources/img/eventJoin.jpg'); background-repeat : no-repeat; background-size : cover;">
	<div class="event">
	
		<table class="t board-write margin-top-15">
			<tr>
				<td>
					<img src="resources/img/eventback.jpg" style="width:800px; height:500px;">
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:void(0);" class="btn btn-dark btn-lg active" role="button" aria-pressed="true" id="cashBtn">10,000캐시 받고 내 주변 범죄자 확인</a><br>
				</td>
			</tr>
			<tr align="left">
				<td>
					<p><label><input type="checkbox" id="chkAll" value="01" onclick="selectAll(this)"><span class="r">전체동의</span></label></p>
					<p><label><input type="checkbox" name="chk" value="02">이용약관  <a class="u" href="#" onclick="window.open('service','service','width=414, height=700');" style="color:white";>보기</a></label></p>
					<p><label><input type="checkbox" name="chk" value="03">개인정보 취급방침 <a class="u" href="#" onclick="window.open('privacy','privacy','width=414, height=700');" style="color:white";>보기</a></label></p>
					<p><label><input type="checkbox" name="chk" value="04">상기 정기구독 내용을 확인하였습니다.</label></p>
				</td>
			</tr>			
			<tr align="left">
				<td >				
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
				</td>
			</tr>
		</table>			
	</div>
</section>	
<div id="targetDiv"></div>
<jsp:include page="common/footer.jsp" />
</body>
</html>