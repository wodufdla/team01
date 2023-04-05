<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>범죄 알리미</title>
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">

<!-- 빌링키 사용을 위한 셋팅 -->    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

$(document).ready(function(){
	iamport();
});

function iamport(){
	
	var order_cont = "2"; // 1. 단기결제 2. 정기결제
	var id =  '<c:out value="${session_nickname}"/>';
	var phone = '<c:out value="${phone}"/>';
	var email = '<c:out value="${session_email}"/>';
	var buyerName = '<c:out value="${session_nickname}"/>';
	var customer_uid = "c_" + new Date().getTime();
	var merchant_uid = "order_" + new Date().getTime();
	var itemTitle = "Test";
	var itemPrice = 100; /*  가격 */
	
	dataP: JSON.stringify({
		amount : itemPrice,
		customer_uid : customer_uid,
		buyerName : buyerName
	}),
	
	IMP.init('imp40774547');
	IMP.request_pay({
		pg : 'danal_tpay.9810030929',
		pay_method : 'card',
		customer_uid : customer_uid,
		merchant_uid : merchant_uid,
		name : itemTitle,
		amount : itemPrice,
		buyer_email : email,
		buyer_name : id,
		buyer_tel : phone
	}, function(rsp) {
		if ( rsp.success ) {
			$.ajax({
				type:'post',
				url:'/order',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:"text",
				data: JSON.stringify({
					buyerName : id,
					merchantUid : customer_uid,
					amount : itemPrice,
				}),
				success:function(token){
					
					// 빌링키 ajax
					$.ajax({
				        url: "https://api.iamport.kr/subscribe/customers/", 
				        method: "POST",
				        headers: { "Content-Type": "application/json",
				        			"Authorization": token  
				        	},
				        data: {
				          customer_uid: customer_uid, // 카드(빌링키)와 1:1로 대응하는 값
				        }
				   }); // 빌링키 ajax
					alert("가입성공");
					location.href="/crime";
				}	
			});
		} else {
			alert(rsp.error_msg);
			window.close();
			history.go(-1);
		}
	});
}
</script>
</head>
<body>

</body>
</html>