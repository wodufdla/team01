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



@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "/question", produces = "text/plain; charset=UTF-8")
	public String selectQuestion(Model model
			, @RequestParam Map<String, Object> reqMap
			, HttpSession session
			, QuestionVO ask
			) {
		log.info("question List Page Response_GET() 호출");// Logger
		log.info("1대1문의 페이지  data : " + reqMap);
		
		String Phone = (String) session.getAttribute("phone");
		// 회원 로그Phone인 상태 확인
		ask.setPhone(Phone);
		
		log.info("* [CONTROLLER] Input �뼳 (Service) : " + ask);
		
		List<QuestionVO> oList = questionService.selectAsk(Phone);// 유저 문의글 조회
		// List<QuestionVO> allList = questionService.selectAskList();// 총 글 목록 조회

		model.addAttribute("ask", oList); // 화면에 데이터 보내기
		return "question";// jsp 화면이름
	}

	// 문의하기 글쓰기 페이지 이동
	@RequestMapping(value = "/doAskView", method = RequestMethod.GET)
	public ModelAndView pageDoAsk(ModelAndView mv, HttpSession session) {
		log.info("doAsk Page_GET() 호출");
		// 로그인 여부
		mv.setViewName("doAsk");// jsp 화면이름
		return mv;
	}

	// 문의하기 글쓰기 insert
	@ResponseBody
	@RequestMapping(value = "/doAsk", produces = "text/plain; charset=UTF-8")
	public String insertDoAsk(@RequestParam Map<String, Object> reqMap, QuestionVO ask) {
		log.info("문의하기  ajax data : " + reqMap);

		ask.setAsktitle((String) reqMap.get("asktitle"));
		ask.setAskcontent((String) reqMap.get("askcontent"));
		ask.setAskcategory((String) reqMap.get("askcategory"));
		ask.setPhone((String) reqMap.get("phone"));

		log.info("* insertAsk [CONTROLLER] input �뼳 (Service) : ");
		int result = questionService.insertAsk(ask);
		log.info("* insertAsk [CONTROLLER] out �뼳 (Service) : " + result);

		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	}

	// 삭제 하기
	@PostMapping("/deleteAsk.do")
	public ModelAndView deleteAsk(ModelAndView mv, HttpSession session, int askno, RedirectAttributes rttr) {

		mv.addObject("deleteAsk", questionService.deleteAsk(askno));
		mv.addObject("deleteAsk", questionService.deleteAns(askno));

		mv.setViewName("redirect:/question");
		return mv;
	}

}
