package com.itkey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itkey.service.ApiService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ApiController{

	private static final Logger log = LoggerFactory.getLogger(ApiController.class);

	
	@Autowired
	private ApiService apiService;
	
	// 불법 주정차 단속 정보
    @RequestMapping("/illegalParking")
    public String illegalParking(Model model) throws IOException, ParseException {
    	
    	List<Map<String,Object>> result = apiService.getIllegalParking();
    	
    	model.addAttribute("list", result);
    	
    	return "illegalParking";
    }
	
	/*
	@RequestMapping("/apiTest")
    public String apiTest(Model model) throws Exception {
       
    	String sb = apiService.TbOpendataFixedcctv();
    
    	log.debug(sb);
    	
    	// JSONParser로 JSONObject로 변환
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(sb);
        
        // JSON 객체의 값 읽어서 출력하기
        System.out.println("========111======");
        System.out.println(jsonObject.get("TbOpendataFixedcctv"));        // apple
        JSONObject jsonObject2 = (JSONObject) jsonObject.get("TbOpendataFixedcctv");
        System.out.println("======22222========");
        System.out.println(jsonObject2.get("row"));
        JSONObject jsonObject3 = (JSONObject) jsonObject2.get("row");

        	System.out.println(jsonObject3.get("LATITUDE"));     // 1
        	System.out.println(jsonObject3.get("LONGITUDE"));    // 1000
        	System.out.println(jsonObject3.get("PSTINST_CD"));
        	System.out.println(jsonObject3.get("REGLT_SPOT_NM"));
        	System.out.println(jsonObject3.get("SPT_KIND_CD"));
        	System.out.println(jsonObject3.get("ADRES"));
        
       //전체 : sb -> json -> map -> model .add(map) 
       
       //1번 : sb -> json   : 구글 검색 결과  https://hianna.tistory.com/623
       //2번 : json-> map
       //3번 : model .add(map) 
       
       
      // model.addAttribute("map", map); //3번
       return "apiTest";
       
    }
*/
	//공공데이터_주차장 시설정보 api
	@RequestMapping("/PrkSttusInfo")
    public String PrkSttusInfo(Model model) throws Exception {
       
    	String sb = apiService.PrkSttusInfo();
    	log.debug(sb);
    	
    	// JSONParser로 JSONObject로 변환
        JSONParser parser = new JSONParser();
        JSONObject jsonObjectPSI = (JSONObject) parser.parse(sb);
        
        // JSON 객체의 값 읽어서 출력하기
        //System.out.println("========111======");
        //System.out.println(jsonObjectPSI.get("PrkSttusInfo"));        // apple
        //JSONObject jsonObj = (JSONObject) jsonObjectPSI.get("PrkSttusInfo");
        
        Object obj1 = parser.parse(jsonObjectPSI.get("PrkSttusInfo").toString());
        
        
        //Object obj1 = parser.parse(jsonObj.toString());
        JSONArray jsonArr = (JSONArray)obj1;
        
        //System.out.println("========jsonArr======");
        //System.out.println(jsonArr); 
        
        
        List<Map<String,Object>> listPSI = new ArrayList<Map<String, Object>>();
        
       // int  sum=0;
        for(int i=0; i<jsonArr.size(); i++){
        	JSONObject jsonObj3 = (JSONObject)jsonArr.get(i);
        	if(!((String)jsonObj3.get("prk_plce_nm")).equals("")) {
        		//sum += 1;
        		//System.out.println("id ::: " +(String)jsonObj3.get("prk_center_id")+"/prk_plce_nm :::"+(String)jsonObj3.get("prk_plce_nm"));
        		Map<String, Object> map = new HashMap<String, Object>();
        		map.put("prk_cmprt_co",(String)jsonObj3.get("prk_cmprt_co"));             //주차장의 총 주차 구획 수
                map.put("prk_center_id",(String)jsonObj3.get("prk_center_id"));          // 주차장 관리 ID (또는 확장ID)
    			map.put("prk_plce_entrc_la",(String)jsonObj3.get("prk_plce_entrc_la"));  // 위도
    			map.put("prk_plce_entrc_lo", (String)jsonObj3.get("prk_plce_entrc_lo")); // 경도
    			map.put("prk_plce_adres", (String)jsonObj3.get("prk_plce_adres"));       //주차장 도로명 주소 (도로명주소 공백 시 지번주소)
    			map.put("prk_plce_nm",(String)jsonObj3.get("prk_plce_nm"));              //주차장명
    			
    			listPSI.add(map);
        		//(String)jsonObj3.get("prk_center_id").equals("")
        	}
        }
        //System.out.println("sum === " + sum);
        
	model.addAttribute("listPSI", listPSI); //3번
    return "PrkSttusInfo";
       
    }
	
}
