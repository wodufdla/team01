package com.itkey.controller;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.service.QuestionService;
import com.itkey.service.UserService;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class newController {

	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/abc", produces = "text/plain; charset=UTF-8")
	public String abc(@RequestParam Map<String, Object> reqMap, HttpServletRequest request) {
		log.info("회원탈퇴 Btn  ajax data : " + reqMap);
	
		UserVO uv = new UserVO ();
		uv.setPhone((String) reqMap.get("phone"));
		
		 int result = userService.userwithdrawal_phone(uv);
		
		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	}

}
