<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=120889e69f4a494d50b65ad4326cafe2"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:100,200,300,400,500,600,700&amp;subset=korean&amp;display=swap">
<link rel="stylesheet" href="/resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>실시간 공개현황</title>
<style type="text/css">
.contain {
	margin: 30px auto;
	width: 60%;
}
span {
	color: #3f78c5;
}
table {
	width: 100%;
	border-top: 1px solid #cecece;
	border-collapse: collapse;
	text-align: center;
}
th{
	background-color: #eeeeee;
	border-bottom: 1px double #cecece;
	border-left: 1px solid #eeeeee;
	padding: 10px;
}
td {
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
	padding: 10px;
}
th:first-child, td:first-child {
	border-left: none;
}
</style>
<script language=JavaScript>
    var arr = new Array();
    <c:forEach items="${list}" var="item">        
            arr.push({name: "${item.name}"
                    ,count : "${item.count}"});
    </c:forEach>
</script>
</head>
<body>
<jsp:include page="common/header.jsp" />
<div class="contain">
	<h3>실시간 공개현황</h3>
	<div>
	<h4>> 특별시＊광역시/도 성범죄자 통계</h4>
	<p>
	우리나라의 특별시, 광역시, 각 시도별 성범죄자 통계를 보실 수 있습니다.<br>
	<span>통계는 실제 거주지 주소 공개자 수입니다.</span>
	</p>
	</div>
	<div>
		<div id="map" style="width:800px;height:500px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=624004e4c75704cb568252115e1bcde6"></script>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script> -->
	    <script>
	    $(document).ready(function() {
	    	
	    	//https://apis.map.kakao.com/web/sample/customOverlay1/
	    	$('#map').width($('#tblSummary').width()+'px');
	    	
	    	var container	= document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    	var options		= { //지도를 생성할 때 필요한 기본 옵션
	    		center			: new kakao.maps.LatLng(36.2683, 127.6358), //지도의 중심좌표.
	    		level			: 14 //지도의 레벨(확대, 축소 정도)
	    	};
	    	var map			= new kakao.maps.Map(container, options),
	    	  customOverlay = new kakao.maps.CustomOverlay({}),
    			 infowindow = new kakao.maps.InfoWindow({removable: true}); //지도 생성 및 객체 리턴
	    	
	    	// json 파싱
	    	var jsonLocation = "/resources/jsonData/SIDO_MAP_2022.json";

	    	var points = [];

	        function displayArea(coordinates, name, count) {
		    	var polygonPath = [];        

	            $.each(coordinates[0], function(i, coordinate) {
					//좌표	            	
	            	//console.info(coordinate);
	                var point = new Object(); 
	                point.x = coordinate[1];
	                point.y = coordinate[0];
	                points.push(point);
	                polygonPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
	            });	
		        var polygon = new kakao.maps.Polygon({
	                path:polygonPath, // 그려질 다각형의 좌표 배열입니다
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#39DE2A', // 선의 색깔입니다
	                strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'longdash', // 선의 스타일입니다
	                fillColor: '#A2FF99', // 채우기 색깔입니다
	                fillOpacity: 0.7 // 채우기 불투명도 입니다
	            });
		        
		    	polygon.setMap(map);
		    	
		        // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		        // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		        kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
		            polygon.setOptions({fillColor: '#09f'});

		            customOverlay.setContent('<div class="area">' + name + '</div>');
		            
		            customOverlay.setPosition(mouseEvent.latLng); 
		            customOverlay.setMap(map);
		        });

		        // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		        kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		            
		            customOverlay.setPosition(mouseEvent.latLng); 
		            var content = '<div class="info">' + 
                    '   <div class="title">' + name + '</div>' +
                    '   <div class="size">성 범죄자 수: ' + count + ' 명</div>' +
                    '</div>';

			        infowindow.setContent(content); 
			        infowindow.setPosition(mouseEvent.latLng); 
			        infowindow.setMap(map);
		        });

		        // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		        // 커스텀 오버레이를 지도에서 제거합니다 
		        kakao.maps.event.addListener(polygon, 'mouseout', function() {
		            polygon.setOptions({fillColor: '#fff'});
		            customOverlay.setMap(null);
		        }); 
	        };
	        
	    	$.getJSON(jsonLocation, function(data) {
	    		var data = data.features;
	    		var coordinates = [];
	    		var name = '';
	    		var count = '';
	    		
	    	    $.each(data, function(i, val){
	    		if(val.geometry.type == "Polygon"){
	    	    	
	    	    	coordinates = val.geometry.coordinates;
	    	    	name = val.properties.CTP_KOR_NM;

	    	    	//console.log("name :" + name);
	    	    	//console.log("coordinates :" + coordinates);
	    	    	
			        for(var i= 0 ; i < arr.length; i ++){
			        	if (arr[i].name == name) {
			        		count = arr[i].count;
			        	}
			        }
			        
	    		    displayArea(coordinates, name, count);	
	    			}
	    	    });
	    	});
	    	
	    	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	    	var mapTypeControl = new kakao.maps.MapTypeControl();

	    	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	    	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	    	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	    	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	    	var zoomControl = new kakao.maps.ZoomControl();
	    	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	    });	
	    
	    </script>
	
		<table summary="특별시＊광역시/도,성범죄자 수 순서로 성범죄자 통계를를 나타낸 표 입니다" id="tblSummary">
			<colgroup>
				<col width="40%">
				<col width="60%">
			</colgroup>
			<thead>
			<tr>
				<th scope="col">특별시＊광역시/도</th>
				<th scope="col">성범죄자 수</th>
			</tr>
			</thead>
			<tbody>
				<!-- 지역별 성범죄자 수 -->
				<tr>
					<td><b>총계</b></td>
					<td><strong id="totCount"><fmt:formatNumber value="${total }" pattern="#,###" /></strong>명</td>
				</tr>
				<c:forEach items="${list }" var="list">
				<tr>
					<td><b>${list.name }</b></td>
					<td><strong><fmt:formatNumber value="${list.count }" pattern="#,###" /></strong>명</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="common/footer.jsp" />
</body>
</html>