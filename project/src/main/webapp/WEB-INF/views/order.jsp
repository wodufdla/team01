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
                    <td>7일 100원 결제 체험 후 월정액<td>7일 100원 결제 체험 서비스를 통해 범죄 알리미 이용<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="0" onclick="checkLink(this);" id="check-0"><label class="form-check-label" for="check-0">9,900/월</label></div>
                    </td>
                </tr>
                <tr>
                    <td>월정액 서비스<td>매월 범죄 알리미의 컨텐츠 이용<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="1" onclick="checkLink(this);" id="check-1"><label class="form-check-label" for="check-1">9,900/월</label></div>
                    </td>
                </tr>
                <tr>
                    <td>단품결제<td>14일 동안 범죄 알리미의 컨텐츠 이용<td>
                        <div class="form-check checkbox-plan"><input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="2" onclick="checkLink(this);" id="check-2"><label class="form-check-label" for="check-2">10,000/월</label></div>
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
                                1. 100원 결제 7일 무료체험(168시간) 이용요금은 무료체험 종료 후 9,900원이 자동 결제됩니다.<br>
                                2. 홈페이지에서 가입하시는 경우 별도 보상은 없으며 해지는 언제든 가능합니다. (일할금 제외)<br><br>
                                [홈페이지가 아닌 타 채널을 통해 보상을 받으시고 7일 무료체험을 가입하신 경우]<br>
                                1. 가입 이후 72시간 이용하는 조건으로 보상을 지급하고 있습니다. (72시간 이후 서비스 해지 가능)<br>
                                2. 서비스 해지 없이 무료체험 기간(168시간) 경과 후 결제가 이뤄지면 최초 한달간 이용 조건으로 보상을 지급합니다. (한달 의무 사용 약정)<br><br>
                                * 보상을 받으시고 가입하신 경우 최초 한달은 약정기간으로 의무사용이 적용되니 신중히 가입하시기를 부탁드립니다.</span></td>
                    <td style="padding: 0;">
                        <div class="form-check checkbox-plan" style="padding: 5px 20px; margin: 10px;"><input class="form-check-input" type="checkbox" id="check-card" onclick="checkCard(this);"><label class="form-check-label" for="check-card" style="font-weight: 600;color: #fff;">카드결제</label></div>
                        <a id="a-pay" class="a-pay" href="javascript:alert('상품 선택 후 결제를 시도해주세요.');" style="margin-top: 80px;">상품 선택 후<br>결제해주세요.</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
<jsp:include page="common/footer.jsp" />    
</body>
</html>    