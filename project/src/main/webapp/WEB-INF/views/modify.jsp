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
    <link rel="stylesheet" href="/assets/css/styles.css">
    
    <script type="text/javascript">
		$(function() {
			
			//수정버튼
			$("#modify1").click(function() {
				//각 빈칸들 변수
				var sessionfile = "${session_FILE_IDX}";
				var file=$("#uploadpic").val();
				
				var idx = "${session_BOARD_WRITER_IDX}";
				var id=$("#id").val();
				var pw=$("#pw").val();
				var repw=$("#repw").val();
				var name=$("#name").val();
				var phone=$("#phone").val();
				var email=$("#email").val();
				
				//핸드폰 패턴
				var patternPhoneNumber=/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	            //이메일 체크 양식
	            var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				//폰번호 형식 확인1.
				var checkReg = /^[-0-9]*$/;
	            var phone1 = checkReg.test(phone);
	            
				//jpg,png 파일 형식
	 				if(file != ""){
					var fileExt = file.substring(file.lastIndexOf(".")+1);
					var reg = /jpg|jpeg|png/i;//업로드 가능 확장자.
					if(reg.test(fileExt) == true || sessionfile == file){
						//모든 항목 빈칸 확인
						if(id=="" || pw ==""|| name ==""|| phone ==""|| email ==""|| repw ==""){
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
									//암호 비교
									if(pw!=repw){
										alert("작성된 암호가 다릅니다. 암호를 다시 확인하여 주시기 바랍니다.");
									}else{
										
					     				 var regsubmit=confirm("작성한 내용으로 수정이 진행됩니다. 계속하시겠습니까? ");
					     				 if(regsubmit==true){
											 $.ajax({
									     		 url:"./modifyAll",
									     		 type:"post",
									     		 data:{
									     			 "BOARD_WRITER_IDX":idx,
									     			 "BOARD_WRITER_NAME":name,
									     			 "BOARD_WRITER_PW":pw,
									     			 "BOARD_WRITER_PHONE":phone,
									     			 "BOARD_WRITER_EMAIL":email,
									     		 },
									     		 success:function(data){
									     			 if(data==1){
									     				 alert("이미지 제외 다 수정");
									     				if(sessionfile==file){
									     					location.href="./board";
									     				}
									     			 }else{
									     				 alert("else");
									     				 }
									     			 
									     		 },
									     		 error:function(textStatus){
									     			 alert("error2 : "+textStatus);
									     		 }
									     	  });
	
											  var form = new FormData();
									          form.append( "up", $("#up")[0].files[0] );
									          //파일이 바뀌었을때 파일 저장한다.
												if(sessionfile!=file){
													
											          jQuery.ajax({
												             url : "./modifyImage"
												           , type : "POST"
												           , processData : false
												           , contentType : false
												           , data : form
												           , success:function(data) {
												        	   if(data==1){
												        		    alert("이미지 수정 성공."); 
												        		   location.href="./board";
												     			 }
												               
												               /* console.log(data); */
												           }
												           ,error: function (textStatus) 
												           { 
												               alert("error3:"+textStatus); 
												           }
												       });
												}
					     				 }
	
									}
					            }
				            }
						}
					}else if(reg.test(fileExt) == false){
						alert("첨부파일은 jpg, png로 된 이미지만 가능합니다.");
						
					}
					//프로필 사진 업로드 확인
				}else if(file == ""){
					alert("프로필 사진을 업로드 해주세요.");
				}
			})
			//수정버튼
			
			//수정버튼진짜
			$("#modify").click(function() {
				
				var pw=$("#pw").val();
				var repw=$("#repw").val();
				var user_id=$("#user_id").val();
				var email=$("#email").val();
/* 				alert("modify"+user_id);
				alert("modify"+pw);
				alert("modify"+repw);
				alert("modify"+email); */
				
	            //이메일 체크 양식
	            var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				
				//모든 항목 빈칸 확인
				if(pw ==""|| email ==""|| repw ==""){
					alert("모든항목을 빈칸없이 작성해 주시기 바랍니다. ");
					
				}else{


						//이메일 양식 검색
			            if(regEmail.test(email)!=true){
		                    alert("이메일 양식에 맞춰 작성해주시기 바랍니다.");
		                    $("#email").focus();
			            	
			            }else{
							//암호 비교
							if(pw!=repw){
								alert("작성된 암호가 다릅니다. 암호를 다시 확인하여 주시기 바랍니다.");
							}else{
								
			     				 var regsubmit=confirm("작성한 내용으로 수정이 진행됩니다. 계속하시겠습니까? ");
			     				 if(regsubmit==true){
									 $.ajax({
							     		 url:"./modifydo",
							     		 type:"post",
							     		 data:{
							     			 "phone":user_id,
							     			 "password":pw,
							     			 "email":email,
							     		 },
							     		 success:function(data){
							     			 //alert("alertmodify:"+data)
							     			 if(data==1){
							     				 alert("다 수정");
							     				opener.location.reload();
							     				window.close();
							     			 }else{
							     				 alert("else");
							     				 }
							     			 
							     		 },
							     		 error:function(textStatus){
							     			 alert("error : "+textStatus);
							     		 }
							     	  });


			     				 }

							}
			            }
		            
				}
				
				
				
			});
			
		})
		//제이쿼리
	
	</script>
    
</head>
<body>
	<a href="javascript:close();" style="position: absolute;right: 0;">
		<img src="/resources/img/popup_close.png" style="padding: 14px;width: 50px;">
	</a>
	<span style="background-color: #1a374f;font-weight: bold;font-size: 20px;line-height: 50px;text-align: center;width: 100%;display: block;height: 50px;color: #fff;box-shadow: 0px 5px 10px 0px #aaaa;">정보수정</span>
	<form action="login" method="post">
		<div style="width: 90%;margin: auto;padding: 20px 0;font-size: 13px;">
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">Phone</span>
	          </li>
	          <li style="display: flex;width: 100%;">
	          	<input type="text" id="user_id" name="user_id" placeholder="'-' 제외하고 번호만 입력" maxlength="11" style="width: 100%; padding: 5px;" readonly="readonly" value="${phone}">
	          </li>
	      </ul>
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">Password</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="password" id="pw" name="pw" placeholder="비밀번호 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">RePassword</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="password" id="repw" name="repw" placeholder="비밀번호 재입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      <ul style="padding: 0;display: flex;">
	          <li style="width: 40%;max-width: 100px;">
	          	<span class="normal-font" style="display: block;padding: 8px;">email</span>
	          </li>
	          <li style="width: 100%;display: flex;">
	          	<input type="text" id="email" name="email" placeholder="이메일 입력"  maxlength="24" style="width: 100%; padding: 5px;">
	          </li>
	      </ul>
	      
		<input id="modify" type="button" value="정보수정">
		</div>
	</form>

</body>
</html>