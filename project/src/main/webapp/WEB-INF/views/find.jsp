<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>find</title>
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
    <link rel="stylesheet" href="/resources/css/styles.css">
</head>

<body>
    <a href="javascript:close();" style="position: absolute;right: 0;">
    	<img src="/resources/img/popup_close.png" style="padding: 14px;width: 50px;">
    </a>
    <span style="background-color: #1a374f;font-weight: bold;font-size: 20px;line-height: 50px;text-align: center;width: 100%;display: block;height: 50px;color: #fff;box-shadow: 0px 5px 10px 0px #aaaa;">비밀번호 찾기</span>
    <form action="find" method="post">
	    <div style="width: 90%;margin: auto;padding: 20px 0;font-size: 13px;">
	        <ul style="padding: 0;display: flex;">
	            <li style="width: 40%;max-width: 100px;">
	            	<span class="normal-font" style="display: block;padding: 8px;">핸드폰 번호</span>
	            </li>
	            <li style="width: 100%;display: block;">
	            	<input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력" maxlength="11" style="width: 100%;padding: 5px;">
	            	<span id="phone-check" style="font-size: 12px;color: var(--bs-red); display: none;" class="">* 휴대폰 번호를 확인해주세요.</span>
	            </li>
	        </ul>
	        <ul style="padding: 0;display: flex;">
	            <li style="width: 40%;max-width: 100px;">
	            	<span class="normal-font" style="display: block;padding: 8px;">이메일</span>
	            </li>
	            <li style="width: 100%;display: flex;">
					<input type="text" id="email1" name="email" placeholder="이메일 입력" style="width: 100%;padding: 5px;">
	            	<span style="display: block;padding: 8px;">@</span>
	            	<input type="text" id="email2" name="email" readonly style="width: 100%;padding: 5px;">
	            	<select name="select_email" id="select_email">
					    <option value="">E-Mail 선택</option>
					    <option value="naver.com">네이버</option>
					    <option value="daum.net">다음</option>
					    <option value="nate.com">네이트</option>
					    <option value="google.co.kr">구글</option>
					    <option value="hanmail.net">한메일</option>
					    <option value="9">직접입력</option>
					</select>
	            </li>
	        </ul>
           	<input type="submit" value="찾기" style="width: 50%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">
           	<!-- <button type="button" id="btnLogin" style="width: 90%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">로그인</button> -->
	    </div>
    </form>
    <input type="hidden" id="find_alert" value=${find_result }>
    <span style="margin-top: 10px;border-top: solid 1px #1a374f;width: 100%;display: block;text-align: center;padding: 30px 10px;font-size: 12px;font-weight: bold;">가입하신 핸드폰과 이메일로 찾아주시기 바랍니다.</span>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/script.js"></script>
</body>
<script>
	var regPhone= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	var userPhone = $('.phone')
	
	$('#phone').focus();
	
	$(document).ready(function(){
		$('#phone').change(function () {
			if (regPhone.test($("#phone").val()) !== true) {
				$("#phone-check").css("display", "block");
		   } else {
				$("#phone-check").css("display", "none");s
		   }
		});
	});
	
	$("#select_email").change(function() {
		if ($("#select_email").val() == "9" ) {
			$('#email2').val("");
			$("#email2").prop('readonly', false);
			$("#email2").focus();
		} else {
			$("#email2").val($("#select_email").val());
			$("#email2").prop('readonly', true);
		}
	});
	
	$(document).ready(function(){
		var result = $('#find_alert').val();
		if(result == "failFind") {
			alert("핸드폰번호와 이메일을 다시 확인해주세요.")
			return
		} else if (result != ""){
			alert("비밀번호는 " + result + " 입니다.")
			return
		}
		
		
		$("#btnLogin").click(function() {
			location = '/login';
		});
	})
</script>
</html>