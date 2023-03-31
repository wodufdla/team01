package com.itkey.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PhoneService {

	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {

		String api_key = "NCSEJAULRUJGHKYX";
	    String api_secret = "EAGHTZJVJII5ULZVTNOE1TD7SKUHT3B2";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);
		params.put("from", "01041088448");
		params.put("type", "SMS");
		params.put("text", "[범죄알리미] 인증번호 "+randomNumber+" 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	/* https://console.coolsms.co.kr/oauth2/login cooolsms사이트 가입해서 api-key, secret_key 받아야됨 */	
	
}
