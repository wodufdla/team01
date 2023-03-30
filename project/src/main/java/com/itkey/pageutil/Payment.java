package com.itkey.pageutil;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class Payment {
	  public static void main(String[] args) {
	    try {
	      // 체크박스로 선택된 결제 금액을 변수에 저장
	      int amount1 = 10000;
	      int amount2 = 5000;
	      int amount3 = 100;

	      // API 요청 URL
	      String url = "https://api.example.com/payment";

	      // API 요청 파라미터 생성
	      Map<String, String> params = new HashMap<>();
	      params.put("amount1", String.valueOf(amount1));
	      params.put("amount2", String.valueOf(amount2));
	      params.put("amount3", String.valueOf(amount3));
	      params.put("payment_method", "credit_card");
	      params.put("customer_info", "John Doe");

	      // API 요청 보내기
	      URL obj = new URL(url);
	      HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	      con.setRequestMethod("POST");
	      con.setDoOutput(true);
	      OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
	      writer.write(getQuery(params));
	      writer.flush();
	      writer.close();

	      // API 응답 받기
	      int responseCode = con.getResponseCode();
	      BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      String inputLine;
	      StringBuffer response = new StringBuffer();
	      while ((inputLine = in.readLine()) != null) {
	        response.append(inputLine);
	      }
	      in.close();

	      // API 응답 출력
	      System.out.println(response.toString());
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }

	  // API 요청 파라미터 문자열로 변환
	  private static String getQuery(Map<String, String> params) throws UnsupportedEncodingException {
	    StringBuilder result = new StringBuilder();
	    boolean first = true;
	    for (Map.Entry<String, String> entry : params.entrySet()) {
	      if (first) {
	        first = false;
	      } else {
	        result.append("&");
	      }
	      result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
	      result.append("=");
	      result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
	    }
	    return result.toString();
	  }
	

}



