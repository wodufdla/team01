<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>불법주정차 단속 위치 확인</title>
<script language=JavaScript>
    var arr = new Array();
    <c:forEach items="${list}" var="item">        
            arr.push({LATITUDE: "${item.LATITUDE}"
                    ,LONGITUDE : "${item.LONGITUDE}"
                   	,ADRES : "${item.ADRES}"
                   	,PSTINST_CD : "${item.PSTINST_CD}"
            		,REGLT_SPOT_NM : "${item.REGLT_SPOT_NM}"
            });
    </c:forEach>
    const json = JSON.stringify(arr, ['LATITUDE', 'LONGITUDE']);
</script>
</head>
<body>
	<div id="map" style="width:600px;height:600px;padding:10px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=624004e4c75704cb568252115e1bcde6&libraries=clusterer""></script>
	<script>
		//console.log("arr", arr.length);
		let lat = '';
    	let lon = '';
/* 		navigator.geolocation.getCurrentPosition(function(pos) {
		    latitude = pos.coords.latitude;
		    longitude = pos.coords.longitude;
		    console.log("현재 위치는 : " + latitude + ", "+ longitude);
		}); */
	
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation != null) {
			// 현재 위치를 요청하는 것은 동일하지만, 지속적으로 확인하여 사용자의 위치가 변경될 때마다 지정된 콜백 함수를 호출한다.
			navigator.geolocation.watchPosition(function(position) {
				lat = position.coords.latitude;
				lon = position.coords.longitude;
			});
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        lat = position.coords.latitude, // 위도
		        lon = position.coords.longitude; // 경도
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
            		console.log("카카오 현재 위치는 : " + lat + ", "+ lon);
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		        
				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
				    center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다. 현재 위치 좌표 가져올 것
				    radius: 50, // 미터 단위의 원의 반지름입니다 
				    strokeWeight: 1, // 선의 두께입니다 
				    strokeColor: '#B70000', // 선의 색깔입니다
				    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'solid', // 선의 스타일 입니다
				    fillColor: '#FFC6C6', // 채우기 색깔입니다
				    fillOpacity: 0.7  // 채우기 불투명도 입니다   
				}); 
				console.log("circle ::: ", lat, lon);
				// 지도에 원을 표시합니다 
				circle.setMap(map); 
			});
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    var locPosition = new kakao.maps.LatLng(lat, lon),    
		        message = '현재 위치를 사용할 수 없습니다.'
		    displayMarker(locPosition, message);
		}
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(lat, lon),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커 이미지 변경
		var imageSrc = '/resources/img/curPosition.png', // 마커이미지의 주소입니다    
	       imageSize = new kakao.maps.Size(36, 39), // 마커이미지의 크기입니다
	       imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	         
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다.
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
		
		// 불법주정차단속위치
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다.
		var positions = [];
		for(var i = 0; i < arr.length; i++) {
			positions.push({
				title: arr[i].REGLT_SPOT_NM, 
				content: arr[i].REGLT_SPOT_NM, 
		        latlng: new kakao.maps.LatLng(arr[i].LATITUDE, arr[i].LONGITUDE)
			});
		};
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		

		function getInfo() {
		    // 지도의 현재 중심좌표를 얻어옵니다 
		    var center = map.getCenter(); 
		    
		    // 지도의 현재 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도타입을 얻어옵니다
		    var mapTypeId = map.getMapTypeId(); 
		    
		    // 지도의 현재 영역을 얻어옵니다 
		    var bounds = map.getBounds();
		    
		    // 영역의 남서쪽 좌표를 얻어옵니다 
		    var swLatLng = bounds.getSouthWest(); 
		    
		    // 영역의 북동쪽 좌표를 얻어옵니다 
		    var neLatLng = bounds.getNorthEast(); 
		    
		    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
		    var boundsStr = bounds.toString();
		    
		    
		    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
		    message += '경도 ' + center.getLng() + ' 이고 <br>';
		    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
		    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
		    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
		    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
		    
		    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
		    // ex) console.log(message);
		    alert(message);
		}
	    
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		        
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}
		
		
		
	</script>
	
</body>
</html>