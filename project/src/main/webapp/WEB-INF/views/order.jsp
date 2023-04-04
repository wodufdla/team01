<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>범죄 알리미_서비스 가입</title>
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
	//iamport();
});
  

   if( $("check-link").is(":checked") == true ){
	   log.info(checkVal);
      var checkVal = $(this).val();
      log.info(checkVal); 
    }
 
	
	function iamport(){
		  const query = 'input[name="check-link"]:checked';
		  const selectedEls = 
		      document.querySelectorAll(query);
		  
		  // 선택된 목록에서 value 찾기
		  let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
		  
		  // 출력
		console.log("result : " + result);
		  
		var itemPrice = result; // 체크박스의 value 가져와서 넣어주기
		
		var order_cont = "2"; // 1. 단기결제 2. 정기결제
		var id =  '<c:out value="${session_nickname}"/>'; //닉네임
		var phone = '<c:out value="${phone}"/>';          //폰번호 
		var email = '<c:out value="${session_email}"/>';  //이메일
		var buyerName = '<c:out value="${session_nickname}"/>';  //닉네임
		var customer_uid = "c_" + new Date().getTime();      //
		var merchant_uid = "order_" + new Date().getTime();
		var itemTitle = "Test";  
		itemPrice = itemPrice; /*  가격 */
		
		dataP: JSON.stringify({
			amount : itemPrice,
			customer_uid : customer_uid,
			buyerName : buyerName
		}),
		
		IMP.init('imp40774547');
		IMP.request_pay({
			pg : 'danal_tpay.9810030929',
			pay_method : 'card',
			customer_uid : customer_uid,  // 빌링킹 대응 하는  정기결제 키번호 
			merchant_uid : merchant_uid, // 상점에서 관리하는 주문 번호
			name : itemTitle,
			amount : itemPrice,          //금액
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
						//세션에 있는 값 넘겨 주기  ( rsp 넘겨 줘도 되나 지금은 화면창 세션 부분을 사용 )
						phone : phone,
						buyerName : buyerName ,              //닉네임
						merchantUid : merchant_uid, // 빌링킹 대응 하는  정기결제 키번호 
						customer_uid : customer_uid,                          
						amount : itemPrice,
					}),
					success:function(token){
						console.info(token);
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
				alert(msg);
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
        	console.log(data);
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
<!-- 서비스 가입 시 -->
<c:if test="${not empty session_orderno }">
<div class="container">   
   <h2> 서비스 가입/이용 중입니다.</h2>   
   <table class="table table-hover">
      <colgroup>
         <col width="40%">
         <col width="60%">
      </colgroup>
      <tr>
         <td>가입 번호</td>
         <td>${phone}</td>
      </tr>
      <tr>
         <td>서비스 종류</td>   
         <td>
         <c:if test="${session_ordercont==1}">
            100원결제
         </c:if>
         <c:if test="${session_ordercont==2}">
            일반정기결제
         </c:if>
         </td>
      </tr>
      <tr>
         <td>결제 금액</td>
         <td>${session_price} 원</td>
      </tr>
      <tr>
         <td>결제 일자</td>
         <td><fmt:formatDate pattern = "yyyy/MM/dd" value="${session_rqsttime}"/></td>
      </tr>      
      <tr>
         <td>다음 결제일자</td>
         <td><fmt:formatDate pattern = "yyyy/MM/dd" value="${session_nextorderdate}"/></td>
      </tr>      
   </table>   
</div>   
</c:if>
<!-- 서비스 미가입 시 -->
<c:if test="${empty session_orderno }">
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
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link"  onclick="checkLink(this)" dataid="5000" value="5000"  id="check-2"><label class="form-check-label" for="check-2">5,000/월</label></div>
                    </td>
                </tr>
                <tr>
                    <td>단품결제<td>7일 범죄 알리미의 컨텐츠 이용 체험<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link"  onclick="checkLink(this)" dataid="100" value="100"  id="check-3"><label class="form-check-label" for="check-3">100/월</label></div>
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
                        <div class="form-check checkbox-plan" style="padding: 5px 20px; margin: 10px;"><input class="form-check-input" type="checkbox" id="check-card" onclick="checkCard(this);"><label class="form-check-label" for="check-card" style="font-weight: 600;color: #fff;">카드결제</label></div>
                        <a id="a-pay" class="a-pay" href="#" onclick="iamport();" style="margin-top:80px;">상품 선택후<br>결제해주세요.</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</c:if>

<!-- <section id="join" class="section-default" style="background: #8C8C8C;">
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
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link"  onclick="checkLink(this)" dataid="5000" value="5000"  id="check-2"><label class="form-check-label" for="check-2">5,000/월</label></div>
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
                        <div class="form-check checkbox-plan" style="padding: 5px 20px; margin: 10px;"><input class="form-check-input" type="checkbox" id="check-card" onclick="checkCard(this);"><label class="form-check-label" for="check-card" style="font-weight: 600;color: #fff;">카드결제</label></div>
                        <a id="a-pay" class="a-pay" href="#" onclick="iamport();" style="margin-top:80px;">상품 선택후<br>결제해주세요.</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section> -->
<jsp:include page="common/footer.jsp" /> 
</body>
</html>    