package com.itkey.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	private static final Logger log = LoggerFactory.getLogger(QuestionServiceImpl.class);
	
	@Autowired
	private QuestionDAO questionDAO;
	
	
}
