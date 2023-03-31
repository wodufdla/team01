<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var banner = opener.$("#banner").val(); //banner 숫자가 뭔지 체크
	$("#restapibtn").click(function() {
		var api1 = $("#restapiinput").val();
		//alert("api1:"+api1);
		
		 //실질 회원가입 기능
		 $.ajax({
    		 url:"./kakaoapikey",
    		 type:"post",
    		 data:{
    			 "apikey":api1,
    			 "banner":banner

    		 },
    		 success:function(data){
    			 if(data==1){
    				 //alert("apikey세션등록 완료");
    				 //var api2 = "${apikey}";
    				 //alert("apikey2:"+api2);
					location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id='+api1+'&redirect_uri=http://localhost:8080/kakaoLogin';
    				 
    			 }else{
    					 alert("apikey세션등록else");
    				 }
    		 },
    		 error:function(request, status, error){
	     			alert("code:"+request.status+"\n"+"message:"+request.statusText+"\n"+"error:"+error);
	     			 location.href="./exception?code="+request.status+"&message="+request.statusText+"&error="+error;
	     		 }
    	  });
		 //ajax
		
		
		
	});
});

</script>
</head>
<body>
	<input type="text" id="restapiinput" name="restapiinput" placeholder="rest api 입력해주세요"  style="width: 50%; padding: 5px;">
	<img id="restapibtn" src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" /><br>
<span>선애APIKEY:ce6bfb3119068337a8b67b7871d34cce</span><br>
<span>승환APIKEY:26efd59e4acb6b996ae394b646a3ade5</span>

  
<p>카카오톡 생일:${session_birthday}</p>
<p>카카오톡 이메일:${session_email}</p>
<p>카카오톡 닉네임:${session_nickname}</p>
<p>카카오톡 토큰:${access_Token}</p>
<p>카카오톡 아이디:${phone}</p>
<p>카카오톡 apikey:${apikey}</p>


</body>
</html>