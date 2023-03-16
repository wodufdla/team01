<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
</head>
<style type="text/css">
#faq {
	width: 100vw;
	height: 100vh;
}
</style>
<body>
	<jsp:include page="common/header.jsp" />
   
	<section id="faq" class="section-default" style="background: #ffa200;">
        <p>FAQ</p>
        <hr>
        <p>Frequently Asked Questions (자주 묻는 질문)</p>
        <div class="table-responsive table-default" style="max-width: 1200px;">
            <table class="table">
                <tbody>
                    <tr>
                        <td>이용안내</td>
                        <td>휴대폰으로 홈페이지에 접속하셔서 범죄 알리미를 다운로드 받거나 구글 Play스토어에서 "범죄 알리미" 검색 후 다운로드하여 이용하시면 됩니다.</td>
                    </tr>
                    <tr>
                        <td>서비스 해지 안내</td>
                        <td>서비스 해지 방법은 가입 시 전화번호로 보내드렸으며 홈페이지 우측 상단에 서비스해지를 누르면 가능합니다.<br>해지가 정상 진행되시면 해지 문자를 받으실 수 있습니다. 이후 별도의 추가 결제는 발생하지 않습니다.<br>무료기간(168시간)이 지나 정상 구독되어 서비스 비용이 결제되면 이후 취소나 환불이 어려운 점 참고 부탁드립니다.</td>
                    </tr>
                    <tr>
                        <td>이용안내</td>
                        <td>회원탈퇴는 로그인 후 내정보에서 하실 수 있으며, 범죄 알리미 서비스에서는 휴대폰번호 외 개인정보를 수집하지 않아 이메일 로그인 하신 회원들만 탈퇴하실 수 있습니다.</td>
                    </tr>
                </tbody>
            </table>
        </div><span>이 외에 궁금한 사항은 1:1 문의로 남겨주시면 친절하게 답변해 드리겠습니다.</span>
    </section>
    
	<jsp:include page="common/footer.jsp" />
</body>
</html>