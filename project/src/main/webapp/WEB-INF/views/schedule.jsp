<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 빌링키 사용을 위한 셋팅 -->    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아임포트 결제 참고사이트 -->
<!-- 일반결제 https://tyrannocoding.tistory.com/44 -->
<!-- 카카오 정기결제 https://tjdqlscjswp.tistory.com/33?category=855326 -->
<script>
var buyerEmail = "구매자 이메일";
var buyerName = "구매자 이름";   //재결제 요청에서 사용
var buyerTel = "구매자 전화번호";
let merchantUid='merchant_' + new Date().getTime();

var IMP = window.IMP; // 생략 가능
IMP.init("imp40774547"); // 예시 : imp00000000

function requestPay() {
	
	const price = $('input[name=check-link]:checked').val();

   IMP.request_pay({
      pg: "kcp",
      pay_method: "card",
      merchant_uid: merchantUid,   // 주문번호
      customer_uid: merchantUid, // 카드(빌링키)와 1:1로 대응하는 값, 필수값
      name: "최초 인증 결제",
      amount: price,                         // 금액 
      buyer_email: buyerEmail,
      buyer_name: buyerName,
      buyer_tel: buyerTel,
      //buyer_addr: "서울특별시 강남구 신사동",
      //buyer_postcode: "01181",
   	  //m_redirect_url: "/paymentOk"
    }, function (rsp) { // callback
    	if (rsp.success) {
    		alert("빌링키 발급 성공");
    		// 빌링키 발급 성공후 실질적인 결제로직
            pass();
    	} else {
    		alert("빌링키 발급 실패");
    		console.log(rsp.error_msg);
    	}
    }); 
}

/**
 * 결제 데이터 DB 저장
 1.회원테이블에 회원에 상응하는 빌링키를 집어넣을 필드 추가
 2.단건결제 완료시 빌링키를 회원테이블에 insert
 */
function pass() {
    $.ajax({
        type: "post",
        url: "/paymentOk",
        data: {
            "amount":   consumPrice,
            "membershipKey":merchantUid,
            "buyerName":buyerName
        },
        success: function (data) {
            if (data ==1){
                // 실질적인 결제 및 정액제 유료회원 처리
                alert("pass2 test : " + data);
                pass2();
            }else {
                console.log("결제 정보 저장 실패");
            }
        }
    });
}   

/**
 * 실질적인 결제 및 정액제 유료회원 처리
 */
function pass2() {
    $.ajax({
        type: "post",
        url: "/payRegister",
        data: {
            "amount":   consumPrice,
            "membershipKey":merchantUid,
            "buyerName":buyerName
        },
        success: function (data) {
        	alert("pass2 성공", data);
            /**
             * 결제 완료후 갈 url(PC)
             * @type {string}
             */
            location.href = "/payRegisterOk";
        },
        fail: function (data){
            console.log("결제 실패");
        }
    });
}

function checkLink(element) {
    const checkboxes = document.getElementsByName("check-link");
    for (var i = 0; i < checkboxes.length; i++) {
    	checkboxes[i].checked = false;	
    }
    element.checked = true;
}
</script>

<body>

</body>
</html>