package com.itkey.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

public interface ApiService {

	//공공데이터_주차장 시설정보 api
	public String PrkSttusInfo() throws Exception;
	
	// 불법 주정차 단속 정보
	public List<Map<String,Object>> getIllegalParking() throws IOException, ParseException;
}
