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

	
	//문의하기 목록 조회 selectList
	@Override
	public List<QuestionVO> selectAsk() {
		List<QuestionVO> list = sqlSession.selectList("Question.selectAsk");
		System.out.println( "QuestionDAOImpl list "+   list);
		
		return list;
	}
	
	//문의하기 등록 insert
	@Override
	public int insertAsk(QuestionVO ask) {
	int inask = sqlSession.insert("Question.insertAsk",ask);
	System.out.println( "QuestionDAOImpl ina "+   inask);
		return  inask;
	}
}
