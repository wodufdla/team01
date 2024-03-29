<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
    
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    
    <script type="text/javascript">
    	//jquery
		$(function() {
			
			var banner = opener.$("#banner").val(); //banner 숫자가 뭔지 체크
			//var banner = 1;
			//alert(banner);
			
			//등록버튼 황선필
			$("#register").click(function() {
				//배너 체크
				//alert(banner);
				//각 빈칸들 변수
				var phone=$("#phone").val();
				var pw=$("#password").val();
				var email=$("#email").val();
				var repw=$("#repassword").val();
				var nickname=$("#nickname").val();
				
				//핸드폰 패턴
				var patternPhoneNumber=/^01([0|1|6|7|8|9]?)-?([0-9]{4})-?([0-9]{4})$/;
	            //이메일 체크 양식
	            var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				//폰번호 형식 확인1.
				var checkReg = /^[-0-9]*$/;
	            var phone1 = checkReg.test(phone);
	            
						//모든 항목 빈칸 확인
						if(pw ==""|| phone ==""|| email ==""|| repw ==""|| nickname ==""){
							alert("모든항목을 빈칸없이 작성해 주시기 바랍니다. ");
							
						}else{
				            //숫자만 검색
				            if(phone1==false){
					            alert("전화번호 양식에 맞춰 작성해주시기 바랍니다.");
				            }
				            //번호 양식 검색
				            else if(patternPhoneNumber.test($("#phone").val())!=true){
			                    alert("전화번호 양식에 맞춰 작성해주시기 바랍니다.");
			                    $("#phone").focus();
				            	
				            }else{
								//이메일 양식 검색
					            if(regEmail.test(email)!=true){
				                    alert("이메일 양식에 맞춰 작성해주시기 바랍니다.");
				                    $("#email").focus();
					            }else{
									//비밀번호 비교
									if(pw!=repw){
										alert("입력된 비밀번호가 다릅니다. 비밀번호를 다시 확인하여 주시기 바랍니다.");
									}else{
										//폰 중복 체크 아작스
										 $.ajax({
								     		 url:"./regphonecheck",
								     		 type:"post",
								     		 data:{
								     			 "phone":phone,
								     		 },
								     		 success:function(data){
								     			 if(data==1){
								     				 alert("이미 가입완료된 번호입니다.");
													 var regsubmit=confirm("결제를 진행 하시겠습니까? ");      
								     			 }else{
								     				 alert("사용가능한 번호입니다.");
								     				 var regsubmit=confirm("작성한 내용으로 가입이 진행됩니다. 계속하시겠습니까? ");
								     				 
								     				 /*
								     				 // 100원 결제창 띄우고, 결제 성공시 회원 가입하도록 처리
								     				 if(regsubmit==true){
								     					window.close();												     					
								     					window.open('orderEvent','orderEvent','width=850,height=700,location=no,status=no,scrollbars=no,left=700,top=200');
								     				 }
								     				 */

								     				 if(regsubmit==true){
								     					 //실질 회원가입 기능
														 $.ajax({
												     		 url:"./regAll",
												     		 type:"post",
												     		 data:{
												     			 "phone":phone,
												     			 "password":pw,
												     			 "email":email,
												     			 "nickname":nickname, 	
												     			 "banner":banner
												     		 },
												     		 success:function(data){
												     			 if(data==1){
												     				alert(" 회원가입이 완료되었습니다.");
												     				$.ajax({
												     					url:"./login",
															     		 type:"post",
															     		 data:{
															     			 "phone":phone,
															     			 "password":pw,
															     		 },
															     		success:function(data){
												     						window.open('orderEvent','orderEvent','width=850,height=700,location=no,status=no,scrollbars=no,left=700,top=200');
															     		}
												     				});
												     					//window.close();												     					
// 												     					opener.location.href="/orderEvent";
												     			 }else{
												     					 alert("회원else");
												     				 }
												     		 },
												     		 error:function(request, status, error){
													     			alert("code:"+request.status+"\n"+"message:"+request.statusText+"\n"+"error:"+error);
													     			 location.href="./exception?code="+request.status+"&message="+request.statusText+"&error="+error;
													     		 }
												     	  });
														 //ajax
								     				 }
								     			 }
								     		 },
								     		 error:function(request, status, error){
									     			alert("code:"+request.status+"\n"+"message:"+request.statusText+"\n"+"error:"+error);
									     			 location.href="./exception?code="+request.status+"&message="+request.statusText+"&error="+error;
									     		 }
								     	  });
										//폰 중복 체크
									}
					            }
				            }
						}
			})
			
			$("#fn_checkId").click(function() {
				var phone=$("#phone").val();
				//핸드폰 패턴
				var patternPhoneNumber=/^01([0|1|6|7|8|9]?)-?([0-9]{4})-?([0-9]{4})$/;
				var checkReg = /^[-0-9]*$/;
				var phone1 = checkReg.test(phone);
				
				if(phone ==""|| phone.length == 0){
					alert("핸드폰번호를 입력해주세요.");
					return false;
				}
				//숫자만 검색
	            if(phone1==false){
		            alert("전화번호 양식에 맞춰 작성해주시기 바랍니다.");
		            return false;
	            }
	            //번호 양식 검색
	            if(patternPhoneNumber.test($("#phone").val())!=true){
	                alert("전화번호 양식에 맞춰 작성해주시기 바랍니다.");
	                $("#phone").focus();
	                return false;
	            }
	            
	          //폰 중복 체크 아작스
				 $.ajax({
		     		 url:"./autoComplete",
		     		 type:"POST",
		     		 data:{
		     			 "phone":phone,
		     		 },
		     		 success:function(data){
		     			 //console.info(">>>> \n", data);
		     			if(data.phone != undefined) {
		     				 alert("이미 가입완료된 번호입니다.");
					     			    if (confirm("로그인 진행하시겠습니까?")) {
					     			    	/* //window.close();
					     			    	
					     			    	//alert($('#phone').val())
					     			    	//window.open('login2','login2','width=585,height=450,location=no,status=no,scrollbars=yes,left=700,top=200');
					     			   	
					     			    	
 					     			    	$('#password').val(data.password);
 					     			    	$('#password').attr('disabled', true);
 					     			    	$('#email').val(data.email);
 					     			    	$('#nickname').val(data.nickname);
 					     			    	document.getElementById( 'login' ).setAttribute( 'type', 'button' );
 					     			    	document.getElementById( 'register' ).setAttribute( 'type', 'hidden' ); */
 					     			    	
					     			    	
 					     			    	$('#password').val(data.password);
 					     			    	$('#password').attr('readonly', true);
 					     			    	$('#email').val(data.email);
 					     			    	$('#nickname').val(data.nickname);
 					     			    	document.getElementById( 'login' ).setAttribute( 'type', 'submit' );
 					     			    	document.getElementById( 'register' ).setAttribute( 'type', 'hidden' );
 					     			    	
 					     			    	
					     			     }
		     			 }else{
		     				 alert("사용가능한 번호입니다.");
		     				 var regsubmit=confirm("작성한 내용으로 가입이 진행됩니다. 계속하시겠습니까?")};
		     		 }
		     		 
				 }); 
	          

			
			})

			//등록버튼
			/* $("#login").click(function() {
				location = "./crime"
			});
			 */
			/* $("#login").click(function(){
				
				
				});
			  */
			
		})
		//제이쿼리
// 		$(document).ready(function() {
		
// 	});

	</script>
    
</head>
<body>

<!-- 	<a href="javascript:close();" style="position: absolute;right: 0;"> -->
		<img src="/resources/img/popup_close.png" style="padding: 14px;width: 50px;">
	</a>
	<span style="background-color: #1a374f;font-weight: bold;font-size: 20px;line-height: 50px;text-align: center;width: 100%;display: block;height: 50px;color: #fff;box-shadow: 0px 5px 10px 0px #aaaa;">회원가입</span>
	<form action="/login" method="post">
		<div style="width: 90%;margin: auto;padding: 20px 0;font-size: 13px;">
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px; list-style:none;">
	          	<span class="normal-font" style="display: block;padding: 8px;">핸드폰 번호</span>
	          </li>
	          <li style="display: flex;width: 100%;">
	          	<input type="text" id="phone" name="phone" placeholder="'-' 제외하고 번호만 입력" maxlength="11" style="width: 100%; padding: 5px;" >
	          </li>
	          
	          <button type="button" id="fn_checkId" class="checkId">중복 확인</button>
	          <input type="hidden" name="idUncheck" value="idUncheck" />
	          
	      </ul>
	      
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px; list-style:none;">
	          	<span class="normal-font" style="display: block;padding: 8px;">비밀번호</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="password" id="password" name="password" placeholder="비밀번호 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px; list-style:none;">
	          	<span class="normal-font" style="display: block;padding: 8px;">PW 재입력</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="password"  id="repassword" name="repassword" placeholder="비밀번호 재입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px; list-style:none;">
	          	<span class="normal-font" style="display: block;padding: 8px;">이메일</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="text" id="email" name="email" placeholder="이메일 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px; list-style:none;">
	          	<span class="normal-font" style="display: block;padding: 8px;">닉네임</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>


	      <!-- 스타일 추가 황선필 -->
		<input id="register" type="button" value="가입" style="width: 50%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">
		<input id="login"  type="hidden" value="로그인" style="width: 50%;display: block;margin: 0 auto 20px auto;background-color: #1a374f;color: #fff;font-size: 20px;font-weight: bold;text-align: center;height: 50px;line-height: 50px;">
		
		</div>
	</form>
	
</body>
</html>