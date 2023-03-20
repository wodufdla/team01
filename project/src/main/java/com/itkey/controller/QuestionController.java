package com.itkey.controller;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.itkey.service.QuestionService;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UserVO;

@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	   @ResponseBody
	   @RequestMapping(value="/question" , produces="text/plain; charset=UTF-8")
	    public String selectQuestion(Model model) {
		   log.info("question GET() 호출");
		   log.info("question List Page Response");// Logger
		   
		   log.info("* [CONTROLLER] Input �뼳 (Service) : " );
		   List<QuestionVO> oList = questionService.selectAskList();// 총 글 목록 조회 
			model.addAttribute("ask", oList);
	        return "question";//jsp 화면이름 
	    }
	
	//문의하기  글쓰기 페이지 이동 
	@RequestMapping(value = "/doAskView", method = RequestMethod.GET)
	public ModelAndView pageDoAsk(ModelAndView mv,HttpSession session) {
		 log.info("doAsk Page GET() 호출");
		//로그인 여부 
		 
		mv.setViewName("doAsk");//jsp 화면이름 
		return mv;
	}
	 //문의하기 글쓰기 insert 
	@ResponseBody
	@RequestMapping(value="/doAsk",  produces="text/plain; charset=UTF-8")
	public String insertDoAsk(@RequestParam Map<String,Object> reqMap,QuestionVO ask) {
		log.info("문의하기  ajax data : " + reqMap );
		
		
		ask.setAsktitle((String)reqMap.get("asktitle"));
		ask.setAskcontent((String)reqMap.get("askcontent"));
		ask.setAskcategory((String)reqMap.get("askcategory"));
		ask.setPhone((String)reqMap.get("phone"));
		
		log.info("* insertAsk [CONTROLLER] input �뼳 (Service) : " );
		int result = questionService.insertAsk(ask);
		log.info("* insertAsk [CONTROLLER] out �뼳 (Service) : " + result);
		
		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	
	}

}
