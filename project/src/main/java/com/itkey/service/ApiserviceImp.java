package com.itkey.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class ApiserviceImp implements ApiService{
	
	// 불법 주정차 단속 정보
	public List<Map<String,Object>> getIllegalParking() throws IOException, ParseException {
		Map<String, Object> resultMap = new HashMap<>();
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		urlBuilder.append("/" +  URLEncoder.encode("414c646a49726b31363667717a5242","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
		//urlBuilder.append("/" +  URLEncoder.encode("sample","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
		urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
		urlBuilder.append("/" + URLEncoder.encode("TbOpendataFixedcctv","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
		urlBuilder.append("/" + URLEncoder.encode("999","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
		
		// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
		//urlBuilder.append("/" + URLEncoder.encode("20220301","UTF-8")); /* 서비스별 추가 요청인자들*/
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
		BufferedReader rd;

		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
				sb.append(line);
		}
		rd.close();
		conn.disconnect();
		//System.out.println(sb.toString());
		
		String jsonData = sb.toString();
		// reader를 Object로 parse
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(jsonData);
		
        JSONObject jsonObj = (JSONObject)obj;

        JSONObject jsonObj2 = (JSONObject)jsonObj.get("TbOpendataFixedcctv");
        Object obj1 = parser.parse(jsonObj2.get("row").toString());
        JSONArray jsonArr = (JSONArray)obj1;
        
        List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
        for(int i=0; i<jsonArr.size(); i++){
        	Map<String, Object> map = new HashMap<String, Object>();
            JSONObject jsonObj3 = (JSONObject)jsonArr.get(i);
			map.put("LATITUDE",(String)jsonObj3.get("LATITUDE")); // 위도
			map.put("LONGITUDE", (String)jsonObj3.get("LONGITUDE")); // 경도
			map.put("ADRES", (String)jsonObj3.get("ADRES")); // 주소
			map.put("PSTINST_CD",(String)jsonObj3.get("PSTINST_CD")); // 해당 구
			map.put("REGLT_SPOT_NM", (String)jsonObj3.get("REGLT_SPOT_NM")); // spot
			
			list.add(map);
        }

		return list;
	}

	//공공데이터_주차장 시설정보 api
	public String prkSttusInfo() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553881/Parking/PrkSttusInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("format","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*XML : 1, JSON : 2*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        return sb.toString();
    }
		
	//공공데이터_주차장 운영정보 api
		public String prkOprInfo() throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553881/Parking/PrkOprInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("format","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*XML : 1, JSON : 2*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        return sb.toString();
	    }	
		
		//공공데이터_주차장 실시간 정보 api
		public String prkRealtimeInfo() throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553881/Parking/PrkRealtimeInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("format","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*XML : 1, JSON : 2*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        return sb.toString();
	    }	
		
	
}
