<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
.container {
	height: auto;
	width: 60%;
	min-height: 100%;
	padding-top: 60px;
  	padding-bottom: 60px;
  	font-size: 0.8em;
}
/* .modify_cont {
	margin: auto;
	padding: 20px 0;
	font-size: 0.8em;
} */
#sub {
	font-weight: bold;
	font-size: 20px;
	line-height: 50px;
	text-align: center;
	width: 35%;
	display: block;
	height: 50px;
	margin:10px auto 50px;
}
h2 {
	padding-bottom: 20px;
}
.normal-font {
	display: block;
	padding: 8px;
}
input[type=text] {
	width: 100%;
	padding: 5px;
}
#pw, #repw {
	width: 100%;
	padding: 5px;
}
ul {
	padding: 0;
	display: flex;
	list-style:none;
}
input[type=button] {
	width: 30%;
	background-color: #1a374f;
	color: #fff;
	font-size: 1.5em;
	font-weight: bold;
	text-align: center;
	height: 50px;
	line-height: 50px;

}
</style>
<script type="text/javascript">
		$(function() {
			$("#withdrawal").click(function() {
				var phone = "${phone}"
				alert("1:1 문의 게시판을 이용해주세요.");
/* 				var wc = confirm("정말 회원탈퇴 하시겠습니까?");
				if(wc==1){
					alert("회원탈퇴 되었습니다.");
					location.href="withdrawal?phone="+phone;
				} */
			});
			//수정버튼 황선필
			$("#modify").click(function() {
				
				var pw=$("#pw").val();
				var repw=$("#repw").val();
				var user_id=$("#user_id").val();
				var email=$("#email").val();
				var nickname=$("#nickname").val();
				
	            //이메일 체크 양식
	            var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				
				//모든 항목 빈칸 확인
				if(pw ==""|| email ==""|| repw ==""|| nickname ==""){
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
			     					 //실질 수정 기능
									 $.ajax({
							     		 url:"./modifydo",
							     		 type:"post",
							     		 data:{
							     			 "phone":user_id,
							     			 "password":pw,
							     			 "email":email,
							     			 "nickname":nickname,
							     		 },
							     		 success:function(data){
							     			 //alert("alertmodify:"+data)
							     			 if(data==1){
							     				 alert("회원 정보 수정 완료");
							     				 location.href="crime";
							     			 }else{
							     				 alert("else");
							     				 }
							     			 
							     		 },
							     		 error:function(textStatus){
							     			 alert("error : "+textStatus);
							     		 }
							     	  });
			     					 //아작스
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
	<jsp:include page="common/header.jsp" />
	<div class=container>
		<!-- <span id="sub">정보수정</span> -->
		<form action="modifyform" method="post">
			<div>
			<h2> > 정보수정</h2>	
		      <ul>
		          <li style="width: 40%; list-style:none;">
		          	<span class="normal-font">핸드폰 번호</span>
		          </li>
		          <li style="display: flex;width: 80%;">
		          	<input type="text" id="user_id" name="user_id" placeholder="'-' 제외하고 번호만 입력" maxlength="11" readonly="readonly" value="${user.phone}">
		          </li>
		      </ul>
		      <ul>
		          <li style="width: 40%; list-style:none;">
		          	<span class="normal-font">비밀번호</span>
		          </li>
		          <li style="width: 80%;display: flex;">
		          	<input type="password" id="pw" name="pw" placeholder="비밀번호 입력"  maxlength="24">
		          </li>
		      </ul>
		      <ul>
		          <li style="width: 40%; list-style:none;">
		          	<span class="normal-font">PW재입력</span>
		          </li>
		          <li style="width: 80%;display: flex;">
		          	<input type="password" id="repw" name="repw" placeholder="비밀번호 재입력"  maxlength="24">
		          </li>
		      </ul>
		      <ul>
		          <li style="width: 40%; list-style:none;">
		          	<span class="normal-font">이메일</span>
		          </li>
		          <li style="width: 80%;display: flex;">
		          	<input type="text" id="email" name="email" placeholder="이메일 입력"  maxlength="24">
		          </li>
		      </ul>
		      <ul>
		          <li style="width: 40%; list-style:none;">
		          	<span class="normal-font">닉네임</span>
		          </li>
		          <li style="width: 80%;display: flex;">
		          	<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력"  maxlength="24">
		          </li>
		      </ul>
		      </div>
		      <!-- 스타일 추가 황선필 -->
		    <div style="text-align:center; padding:20px; margin:auto;"> 
				<input id="modify" type="button" value="수정">
				<input id="withdrawal" type="button" value="회원탈퇴">
				<input id="back" type="button" value="뒤로가기" onclick="history.go(-1)">
			</div>
		</form>
	</div>
 	<jsp:include page="common/footer.jsp" />
</body>
</html>