package com.itkey.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.QuestionDAO;
import com.itkey.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	private static final Logger log = LoggerFactory.getLogger(QuestionServiceImpl.class);
	
	@Autowired
	private QuestionDAO questionDAO;

	//문의하기 목록 조회 
	@Override
	public List<QuestionVO> selectAskList() {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskList();
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}

	//문의하기 등록 insert
	@Override
	public int insertAsk(QuestionVO ask) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask.toString());
		int result = questionDAO.insertAsk(ask);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	
	
}
