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
import com.itkey.service.JsonUtil;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class ApiController {

	private static final Logger log = LoggerFactory.getLogger(ApiController.class);

	@Autowired
	private ApiService apiService;

	// 불법 주정차 단속 정보
	@RequestMapping("/illegalParking")
	public String illegalParking(Model model) throws IOException, ParseException {

		List<Map<String, Object>> result = apiService.getIllegalParking();

		model.addAttribute("list", result);

		return "illegalParking";
	}

	// 공공데이터_ 주차정보제공 api
	@RequestMapping("/PrkSttusInfo")
	public String prkSttusInfo(Model model) throws Exception {
		log.debug("===========공공데이터_전국 주차api=============");

		// 공공데이터_1.주차장 시설정보 PrkSttusInfo api
		String sb = apiService.prkSttusInfo();
		log.debug("===공공데이터_1.주차장 시설정보 PrkSttusInfo api====");
		log.debug(sb);

		// JSONParser로 JSONObject로 변환
		JSONParser parser = new JSONParser();
		JSONObject jsonObjectPSI = (JSONObject) parser.parse(sb);
		Map<String, Object> mapPsi = JsonUtil.getMapFromJsonObject(jsonObjectPSI);
		log.debug("========mapPsi======");
		log.debug(mapPsi.toString());

		List<Map<String, Object>> listPsi = (List<Map<String, Object>>) mapPsi.get("PrkSttusInfo");
		log.debug("========listPsi======");
		log.debug(listPsi.size() + "");

		// 공공데이터_2.주차장 운영정보 api
		String prkOprInfo = apiService.prkOprInfo();
		log.debug("===공공데이터_2.주차장 운영정보 api====");
		log.debug(prkOprInfo);

		JSONParser parserPoi = new JSONParser();
		JSONObject jsonObjectPOI = (JSONObject) parserPoi.parse(prkOprInfo); // json 처리
		Map<String, Object> mapPoi = JsonUtil.getMapFromJsonObject(jsonObjectPOI);// json > map 처리
		log.debug("========mapPoi======");
		log.debug(mapPoi.toString());

		List<Map<String, Object>> listPoi = (List<Map<String, Object>>) mapPoi.get("PrkOprInfo"); // mapdmf list 변환
		log.debug("========listPrkOpr======");
		log.debug(listPoi.size() + "");

		// 공공데이터_3.주차장 실시간 정보 api
		String prkRealtimeInfo = apiService.prkRealtimeInfo();
		log.debug("===3.주차장 실시간 정보 api====");
		log.debug(prkRealtimeInfo);

		JSONParser parserPri = new JSONParser();
		JSONObject jsonObjectPRI = (JSONObject) parserPri.parse(prkRealtimeInfo);
		Map<String, Object> mapPri = JsonUtil.getMapFromJsonObject(jsonObjectPRI);
		log.debug("========mapPri======");
		log.debug(mapPri.toString());

		List<Map<String, Object>> listPri = (List<Map<String, Object>>) mapPri.get("PrkRealtimeInfo");
		log.debug("========listPri======");
		log.debug(listPri.size() + "");
		/*
		 * Object obj1 = parser.parse(jsonObjectPSI.get("PrkSttusInfo").toString());
		 * JSONArray jsonArr = (JSONArray) obj1; List<Map<String, Object>> listPsi2 =
		 * JsonUtil.getListMapFromJsonArray(jsonArr);
		 * log.debug("========listPsi======"); log.debug(listPsi.size()+"");
		 * log.debug(listPsi.get(0)+"");
		 * 
		 * List<Map<String, Object>> listPSI = new ArrayList<Map<String, Object>>();
		 * 
		 * // int sum=0; for (int i = 0; i < jsonArr.size(); i++) { JSONObject jsonObj3
		 * = (JSONObject)jsonArr.get(i); if (!((String)
		 * jsonObj3.get("prk_plce_nm")).equals("")) { // sum += 1; //
		 * System.out.println("id ::: " //
		 * +(String)jsonObj3.get("prk_center_id")+"/prk_plce_nm //
		 * :::"+(String)jsonObj3.get("prk_plce_nm")); Map<String, Object> map = new
		 * HashMap<String, Object>(); map.put("prk_cmprt_co", (String)
		 * jsonObj3.get("prk_cmprt_co")); // 주차장의 총 주차 구획 수 map.put("prk_center_id",
		 * (String) jsonObj3.get("prk_center_id")); // 주차장 관리 ID (또는 확장ID)
		 * map.put("prk_plce_entrc_la", (String) jsonObj3.get("prk_plce_entrc_la")); //
		 * 위도 map.put("prk_plce_entrc_lo", (String) jsonObj3.get("prk_plce_entrc_lo"));
		 * // 경도 map.put("prk_plce_adres", (String) jsonObj3.get("prk_plce_adres")); //
		 * 주차장 도로명 주소 (도로명주소 공백 시 지번주소) map.put("prk_plce_nm", (String)
		 * jsonObj3.get("prk_plce_nm")); // 주차장명
		 * 
		 * listPSI.add(map); // (String)jsonObj3.get("prk_center_id").equals("") } } //
		 * System.out.println("sum === " + sum);
		 */
		model.addAttribute("listPSI", listPsi);
		model.addAttribute("listPOI", listPoi);
		model.addAttribute("listPRI", listPri);
		return "PrkSttusInfo";

	}

}
