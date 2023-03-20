package com.itkey.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.vo.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	private static final Logger log = LoggerFactory.getLogger(QuestionDAOImpl.class);
		
	@Autowired
	private SqlSession sqlSession;
	
	private static final String ASK = "com.itkey.QuestionMapper";
	
	//문의하기 목록 조회 selectList
	@Override
	public List<QuestionVO> selectAskList() {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> out = sqlSession.selectList(ASK + ".selectAskList");
		log.info("* [DAO] Output ◀ (Mybatis) : " + out.toString());
		return out;
	}
	
	//문의하기 등록 insert
	@Override
	public int insertAsk(QuestionVO ask) {
		log.info("* [DAO] Input  ◀ (Service) : " + ask.toString());
		int result =  sqlSession.insert(ASK +".insertAsk",ask);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
		
	}
}
