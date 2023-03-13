package com.itkey.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itkey.service.QuestionService;

@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;

	//문의하기 리스트 
	@RequestMapping("/question")
	public String ask(Model model) {
		return "question";
	}
	
	//문의하기 글쓰기
	@RequestMapping("/doAsk" )
	public String doAsk(Model model) {
		return "doAsk";
	}
}
