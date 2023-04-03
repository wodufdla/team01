<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>로그인 2 : 회원가입버튼만 없음 (팝업 화면) > 메인페이지 crime 이동 - 중복된 루틴</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<span style="background-color: #1a374f;font-weight: bold;font-size: 20px;line-height: 50px;text-align: center;width: 100%;display: block;height: 50px;color: #fff;box-shadow: 0px 5px 10px 0px #aaaa;">로그인</span>
	<form action="login2" method="post">
		<div style="width: 90%;margin: auto;padding: 20px 0;font-size: 13px;">
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">휴대폰 번호</span>
	          </li>
	          <li style="display: flex;width: 100%;">
	          	<input type="text" id="phone" name="phone" placeholder="'-' 제외하고 번호만 입력" maxlength="11" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">비밀번호</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="password" id="password" name="password" placeholder="비밀번호 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul><!-- 버튼 크기 조절 황선필 -->
		<input type="submit" value="로그인" style="width: 50%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">
		<button type="button" id="btnFind" style="width: 50%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">비밀번호 찾기</button>
		</div>
	</form>
	<input type="hidden" id="alert" value=${login_result }>
	<input type="hidden" id="admin_alert" value=${admin_result }>
	
	<script type="text/javascript">
	
	var phone = "";
	var regPhone= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	var userPhone = $('.phone')
	var userPassword = $('password')
	
	userPhone.onblur = function (e) {
		if (regPhone.test($("#phone").val()) !== true) {
		      alert("핸드폰번호를 확인해주세요.");
		      location.reload();
		      return;
		} else {
		    	phone = $("#phone").val();
		        $("#password").focus();
		   }
	}
	
	$("#phone").focus();
	
	function request() {
		if (regPhone.test($("#phone").val()) !== true) {
	      alert("핸드폰번호를 확인해주세요.");
	      location.reload();
	      return;
	    } else {
	    	phone = $("#phone").val();
	        $("#password").focus();
	    }
		if ($("#password").val() < 12 && $("#password").val() < 20) {
	        alert("비밀번호는 8 ~ 20 까지 입니다.");
	        location.reload();
	        return;
	    }
	}

	$(document).ready(function(){
		var result = $('#alert').val();
		var admin_result = $('#admin_alert').val();
		if(admin_result == 'success2') {
			alert('관리자 로그인 성공')
			opener.location.href="/crime";
			window.close();
		} else {
			if(result == 'successLogin2'){
				alert('로그인 성공 !')
				//연창 새로고침 황선필
				opener.location.href="/crime";
				window.close();
			}else if(result == 'wdstatus') {
				alert('탈퇴한회원입니다.')
				
				location.reload();
				return
			} else if (result == 'fail2') {
				alert('존재하지 않는 회원입니다. 핸드폰번호를 확인해주세요. ')
				
				location.reload();
				return
			} else if(result == 'failLogin2') {
				alert('로그인 실패 ! 비밀번호를 확인해주세요.')
				
				location.reload();
				return
			}
		}
		
		$("#btnFind").click(function() {
			location = '/find';
		});
		//회원가입 버튼 추가 황선필
		$("#registerbtn").click(function() {
			location = '/register';
		});
	})

	</script>
</body>
</html>