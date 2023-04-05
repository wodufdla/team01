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
import com.itkey.dao.UidDAO;
import com.itkey.dao.UserDAO;
import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UidVO;
import com.itkey.vo.UserVO;

@Service
public class UidServiceImpl implements UidService {
	private static final Logger log = LoggerFactory.getLogger(UidServiceImpl.class);
	
	@Autowired
	private UidDAO uidDAO;

	@Override
	public List<UidVO> getUid() {
		log.debug("* [SERVICE] Input  ◀ (Controller) : getUid");
		return uidDAO.getUid();
	}
}
