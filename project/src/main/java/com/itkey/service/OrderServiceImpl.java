package com.itkey.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.itkey.dao.OrderDAO;
import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UserVO;

@Service
public class OrderServiceImpl implements OrderService {
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<OrderVO> read_list(PageCriteria criteria) {
		log.info("OrderVO read() 호출 : start = " + criteria.getStart());
		log.info("OrderVO read() 호출 : end = " + criteria.getEnd());
		return orderDAO.select_list(criteria);
	}

	@Override
	public int totalCounts(PageCriteria criteria) {
		log.info("OrderVO totalCounts() 호출");
		return orderDAO.totalCounts(criteria);
	}

	// 서비스 유지중
	@Override
	public int select_y() {
		log.info("OrderVO select_y() 호출");
		return orderDAO.select_y();
	}
	// 누적 매출액
	@Override
	public int totalSales() {
		log.info("OrderVO totalSales() 호출");
		return orderDAO.totalSales();
	}
	
	// 월 매출액
	@Override
	public int totalMonths(String thisMonth) {
		log.info("OrderVO totalMonths() 호출");
		return orderDAO.totalMonths(thisMonth);
	}
	
	// 오늘자 매출액
	@Override
	public int todaySSales(String today) {
		log.info("OrderVO todaySSales() 호출");
		return orderDAO.todaySSales(today);
	}
	
	@Override
	public void regularPay(String merchantUid) {
			
		//토큰 받아오기
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
		
	    //서버로 요청할 Body
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("imp_key", "4874013767742225");
	    map.put("imp_secret", "OcILAVyTMAqtx43YVB2my8cyy1vmjPTdgvkMW4it8oPWDOkl1QUaLHpZ9Rs0WiOAsdkdnRfVNqockM6t");
	    
	    Gson var = new Gson();
	    String json = var.toJson(map);
		
	    HttpEntity<String> entity = new HttpEntity<String>(json, headers);
	    RestTemplate restTemplate = new RestTemplate();
	    String url = "https://api.iamport.kr/users/getToken";
		String token = restTemplate.postForObject(url , entity, String.class);
		log.debug("* service getToken의 token받아오기 *" + token);
		//그냥 string token으로 작업하면 값이 안 들어와서  stringBuffer사용
		StringBuffer sb = new StringBuffer();
		sb.append(token);
		String result = sb.toString();
		String pray = result.substring(53, 93);
		log.debug("* service getToken의 token2받아오기 *" + pray);
		
		//재결제
		//서버로 요청할 Header
		headers.add("Authorization", pray);
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		//서버로 요청할 Body  
		Map<String, Object> again = new HashMap<String, Object>();
		again.put("customer_uid", "your-customer-unique-FD");	
		again.put("merchant_uid", merchantUid);
		again.put("amount", "100");	   
		again.put("name", "정상결제");	   
		
		String againjson = var.toJson(again);
		
       
		HttpEntity<String> entity2 = new HttpEntity<String>(againjson, headers);
        url = "https://api.iamport.kr/subscribe/payments/again";
        String againResult = restTemplate.postForObject(url, entity2, String.class);	
        
        
        System.out.println(againResult);
//        JSONParser jsonParser = new JSONParser(); 
//		try {	  
//	        Object obj = jsonParser.parse(againResult);;			
//	        JSONObject jsonObj = (JSONObject) obj;        
//	        logger.debug("* service 정기결제 배치 끝 *" +jsonObj);
//	        //string -> json 변환 안하면 콘솔에서 한글 다 깨짐
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block	
//			e.printStackTrace();
//		}
		
	}


	@Override
	public String getToken() throws Exception {
		
		String imp_key = "4874013767742225";
		String imp_secret = "OcILAVyTMAqtx43YVB2my8cyy1vmjPTdgvkMW4it8oPWDOkl1QUaLHpZ9Rs0WiOAsdkdnRfVNqockM6t";
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();


		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	@Override
	public String bilingCredit(Map<String,Object> param) throws Exception {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmmss");
		String format_time1 = format1.format (System.currentTimeMillis());
		
		String result_txt = "";
		
		String token = (String)param.get("token");
		String customer_uid = (String)param.get("cuid");
		
		String merchant_uid = "order" + format_time1;
		String amount = "900";
		String name = "범죄알리미 정기권";
		
		Map<String, Object> Cparam = new HashMap<String, Object>();
		Cparam.put("id", (String)param.get("id"));
		Cparam.put("phone", (String)param.get("phone"));
		Cparam.put("itemname", name);
		Cparam.put("merchant_uid", merchant_uid);
		Cparam.put("amount", Integer.parseInt(amount));
		
	//	mMapper.insertCredit(Cparam); DB에 저장
		
		try {
			JSONObject reqParams = new JSONObject();
			reqParams.put("customer_uid", customer_uid);
			reqParams.put("merchant_uid", merchant_uid);
			reqParams.put("amount", amount);
			reqParams.put("name", name);

			URL url = new URL("https://api.iamport.kr/subscribe/payments/again");

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json; utf-8");
			conn.setRequestProperty("Authorization", token);
			
			// Post인 경우 데이터를 OutputStream으로 넘겨 주겠다는 설정
			conn.setDoOutput(true);

			// Request body message에 전송
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(reqParams.toString());
			os.flush();

			// 응답
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			JSONObject jsonObj = (JSONObject) JSONValue.parse(in.readLine());

			in.close();
			conn.disconnect();

			result_txt = "response :: " + jsonObj.get("response")
						+ " code :: " + jsonObj.get("code")
						+ " messege :: " + jsonObj.get("message");
			System.out.println(result_txt);
			
			//mMapper.updateSub((String)param.get("id")); // 결제일, 다음결제일 수정
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_txt;
	}

	@Override
	public int insertPayment(OrderVO odVo) throws Exception {
		log.debug("* [SERVICE] Input  ◀ (Controller) : " + odVo.toString());
		int result = orderDAO.insertPayment(odVo);
		log.debug("* [SERVICE] Output ◀ (vo) : " + result);
		return result;
	}
	
}
