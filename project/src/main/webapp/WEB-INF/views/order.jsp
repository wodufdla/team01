<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
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
<!-- 아임포트 결제 참고사이트 -->
<!-- 일반결제 https://tyrannocoding.tistory.com/44 -->
<!-- 카카오 정기결제 https://tjdqlscjswp.tistory.com/33?category=855326 -->
<script>

$(document).ready(function(){
	var buyerEmail = "구매자 이메일";
	var buyerName = "이재열";   //재결제 요청에서 사용
	var buyerTel = "010-4108-8448";
	let merchantUid='merchant_' + new Date().getTime();
	
	iamport();
})

 

 	

//  	function iamport(){
// // 	var price = 100;
// 	$("checkLink").on("click", function(){
// 		$(this).val()
//   return;
// });
	
	function iamport(){


		var order_cont = "2";
		var id = "tkhyfy_test";
		var phone = $('#phone').val();
		var email					= "test@naver.com";
		var buyerName			= $("#nickname").val();
		var customer_uid			= "c_2" + id;
		d = new Date();
		var merchant_uid = "order" + d.getTime();
		
		var itemPrice = 100; /*  가격 */
		var itemTitle = "범죄알리미 인증";
		
		d = new Date();
		var merchant_uid = "order" + d.getTime();
		
		dataP: JSON.stringify({
			amount : itemPrice,
			customer_uid : customer_uid,
			buyerName : buyerName
		}),
		
		IMP.init('imp40774547');
		IMP.request_pay({
			pg : 'danal_tpay.9810030929',
			pay_method : 'card',
			merchant_uid : merchant_uid,


			: customer_uid,
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
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				basicModal(msg);
			}
		});
	}

/**
 * 결제 데이터 DB 저장
 */
function pass(dataP) {
    $.ajax({
        type: "post",
        url: "/paymentOk",
        data: dataP,
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
//check
function checkLink(element) {
	//alert(element);
    const checkboxes = document.getElementsByName("check-link");
    for (var i = 0; i < checkboxes.length; i++) {
    	checkboxes[i].checked = false;	
    }
    element.checked = true;
}
</script>

</head>
<body>
<jsp:include page="common/header.jsp" />
<section id="join" class="section-default" style="background: #8C8C8C;">
        <p>범죄 알리미 가입하기</p>
        <hr>
        <p>가입하고 싶으신 서비스를 선택 후 결제하여 범죄를 미리 예방하세요</p>
        <div class="table-responsive table-default" style="max-width: 1200px;">
            <table class="table">
                <tbody>                
                <tr>
                    <td>월정액 서비스<td>매월 범죄 알리미의 컨텐츠 이용<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link" onClick="checkLink(this)" value="10000"  id="check-1"><label class="form-check-label" for="check-1">10,000/월</label></div>
                    </td>
                </tr> 
                <tr>
                    <td>단품결제<td>14일 동안 범죄 알리미의 컨텐츠 이용<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link"  onclick="checkLink(this)" value="5000"  id="check-2"><label class="form-check-label" for="check-2">5,000/월</label></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="table-responsive table-default" style="max-width: 1200px;background-color: rgba(0,0,0,0);padding: 0;">
            <table class="table">
                <tbody>
                <tr style="border-bottom: solid 0px rgba(0,0,0,0);">
                    <td style="color: #fff;padding: 0;">
                            <span>
                                [홈페이지에서 가입하는 경우]<br>
                                1. 서비스 가입을 하셔야 이용이 가능하며, 원할 시 언제든 중도 해지 가능합니다.<br>
                                2. 중도 해지 시 별도로 환불처리는 받을수없습니다
                                .<br><br>
                                [홈페이지가 아닌 타 채널을 통해 보상을 받으시고 7일 무료체험을 가입하신 경우]<br>
                                1. 가입 즉시 포인트가 발행되며 포인트 결제 시 한달 의무약정 약정 가입이 진행됩니다.<br>
                                2. 한달 의무 사용 이후 자유롭게 해지가능합니다.<br><br>
                                * 보상을 받으시고 가입하신 경우 최초 한달은 약정기간으로 의무사용이 적용되니 신중히 가입하시기를 부탁드립니다.</span></td>
                    <td style="padding: 0;">
                        <!-- <div class="form-check checkbox-plan" style="padding: 5px 20px; margin: 10px;"><input class="form-check-input" type="checkbox" id="check-card" onclick="checkCard(this);"><label class="form-check-label" for="check-card" style="font-weight: 600;color: #fff;">카드결제</label></div> -->
                        <a id="a-pay" class="a-pay" href="#" onclick="iamport();" style="margin-top:80px;">상품 선택후<br>결제해주세요.</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
<jsp:include page="common/footer.jsp" /> 
</body>
</html>    