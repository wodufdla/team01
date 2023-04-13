<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PrkSttusInfo _주차장 시설정보</title>
<script language=JavaScript>
var arr = new Array();
<c:forEach items="${listPSI}" var="listPSI">        
			 arr.push({prk_cmprt_co: "${listPSI.prk_cmprt_co}"
						,prk_center_id : "${listPSI.prk_center_id}"
			   		  ,longitude : "${listPSI.prk_plce_entrc_lo}"  // 경도 
					   ,prk_center_id : "${listPSI.prk_center_id}"
					   ,prk_plce_nm : "${listPSI.prk_plce_nm}"
						 ,latitude : "${listPSI.prk_plce_entrc_la}" // 위도
				  ,prk_plce_adres : "${listPSI.prk_plce_adres}"});
</c:forEach>
console.log("arr ::: ", arr);
</script>
</head>
<body>

<jsp:include page="common/header.jsp" />

	<center><div id="map" style="width:90%;height:80vh;padding:10px;"></div></center>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1577c56f41213c14bdf0929a39c727bc"></script>
	<script>
	
	// 1. 지도생성
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.4793995, 126.8846023),
			level: 5
		};
		
		var map = new kakao.maps.Map(container, options); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// 지도에 로드뷰 정보가 있는 도로를 표시하도록 지도타입을 추가합니다
		//설정
// 	 	map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);    
		//해제
		map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
		
		var imageSrc = '/resources/img/curPosition.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(36, 39), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		markerPosition = new kakao.maps.LatLng(37.4793995, 126.8846023); // 마커가 표시될 위치입니다
	
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div>스윙파크 민영주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.484944477304 , 126.90067809529)
		    },
		    {
		        content: '<div>구로JnK디지털타워 주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.482331187668, 126.89736658147)
		    },
		    {
		        content: '<div>G-Tower 주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.4798477003537, 126.895318461208)
		    },
		    {
		        content: '<div>소망유료 주차장</div>',
		        latlng: new kakao.maps.LatLng(37.478590939655, 126.89303642375)
		    },
		    {
		        content: '<div>가산동 공영주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.476858199535, 126.89551213771)
		    },
		    {
		        content: '<div>gs타임즈 어바니엘 가산주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.485086523976, 126.87988094849)
		    },
		    {
		        content: '<div>벽산디지털밸리6차주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.484678204469, 126.87923514244)
		    },
		    {
		        content: '<div>견인보관소 공영주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.48324534723, 126.87604226951)
		    },
		    {
		        content: '<div>백상스타타워주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.482515460262, 126.87749077074)
		    },
		    {
		        content: '<div>가산주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.480579310163, 126.88325570199)
		    },
		    {
		        content: '<div>가산w센터주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.481485174607, 126.88069354362)
		    },
		    {
		        content: '<div>디폴리스 주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.479278527043, 126.87637391137)
		    },
		    {
		        content: '<div>신한이노플렉스 주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.47885004871, 126.88212131182)
		    },
		    {
		        content: '<div>sk트윈타워주차장</div>', 
		        latlng: new kakao.maps.LatLng(37.47593983932, 126.88340841393)
		    }
		    
		];

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
		
		
/* 시작위치
// 		   주차장 위치 별 반복문 사용
		var positions = [];
		for(var i = 0; i < arr.length; i++) {
			positions.push({
				title: arr[i].REGLT_SPOT_NM, 
				content: arr[i].prk_plce_nm, 
			    latlng: new kakao.maps.LatLng(arr[i].longitude, arr[i].latitude)
			});
		};
// 	    {
// 	        content: '<div>카카오</div>', 
// 	        latlng: new kakao.maps.LatLng(37.4730836, 126.8788276)
// 	    }
	 
	    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커의 위치
		        clickable : true // 마커를 클릭했을 때 지도이 클릭 이벤트가 발생하지 않도록 설정합니다.
		    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div>'+positions[i].content+'</div>'
	        		+	'<div>'+positions[i].prk_center_id+'</div>'	// 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
	
		종료위치	*/	    
	
/* 		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
		});
 */
		
		// 마커를 지도에 표시합니다.
		marker.setMap(map);
 
 		kakao.maps.event.addListener(marker, "click", function() {
 			var infowindow = new kakao.maps.InfowWindow({
 				//content
 			});
 			infowindow.open(map, marker);
 		});
		
/* 		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">곧 무너짐</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		}); */
		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});
		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style=padding:5px;>사용자 위치</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		        
		            
				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
			          //center : new kakao.maps.LatLng(37.4793995, 126.8846023),  // 원의 중심좌표 입니다 
			          center : new kakao.maps.LatLng(lat, lon),
			          radius: 50, // 미터 단위의 원의 반지름입니다 
			          strokeWeight: 1, // 선의 두께입니다 
			          strokeColor: '#B70000', // 선의 색깔입니다
			          strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			          strokeStyle: 'solid', // 선의 스타일 입니다
			          fillColor: '#FFC6C6', // 채우기 색깔입니다
			          fillOpacity: 0.7  // 채우기 불투명도 입니다   
			      }); 
			      // 지도에 원을 표시합니다 
			      circle.setMap(map); 

			      
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(37.4730836, 126.8788276),    
		        message = '현재위치를 찾을수 없습니다...'
		        
		    displayMarker(locPosition, message);
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

<jsp:include page="common/footer.jsp" />
</body>
</html>