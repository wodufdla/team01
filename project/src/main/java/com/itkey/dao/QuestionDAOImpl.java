package com.itkey.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	private static final Logger log = LoggerFactory.getLogger(QuestionDAOImpl.class);
		
	@Autowired
	private SqlSession sqlSession;
	
	private static final String ASK = "com.itkey.QuestionMapper";
	private static final String ANS = "com.itkey.AnswerMapper";
	//문의하기 본인글 조회
	@Override
	public List<QuestionVO> selectAsk(String phone) {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> result =sqlSession.selectList(ASK + ".selectAsk", phone);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	//문의하기 목록 조회 selectList
	@Override
	public List<QuestionVO> selectAskList() {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> out = sqlSession.selectList(ASK + ".selectAskList");
		log.info("* [DAO] Output ◀ (Mybatis) : " + out.toString());
		return out;
	}
	
	/* 문의사항 작성하기 */
	@Override
	public int insertAsk(QuestionVO ask) {
		log.info("* [DAO] Input  ◀ (Service) : " + ask.toString());
		int result =  sqlSession.insert(ASK +".insertAsk",ask);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	


	/* 문의사항 - 관리자 조회 목록*/
	@Override
	public List<QuestionVO> selectAskY() {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAskY");
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	@Override
	public List<QuestionVO> selectAskN() {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAskN");
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	@Override
	public List<QuestionVO> selectAsk2(int askno) {
		log.info("* [DAO] Input  ◀ (Service) : " );
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAsk2",askno);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	
	/* 문의사항 삭제하기 */
	@Override
	public int deleteAsk(int daskno) {
		log.info("* [DAO] Input  ◀ (Service) : " );
		int result = sqlSession.delete(ASK + ".deleteAsk", daskno);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	/* 문의사항  수정하기 */
	@Override
	public int updateAsk(int ask_no) {
		log.info("* [DAO] Input  ◀ (Service) : " );
		int result = sqlSession.update(ASK + ".updateAsk", ask_no);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	/* 답변 작성하기 */
	@Override
	public int insertAns(AnswerVo ans) {
		log.info("* [DAO] Input  ◀ (Service) : " + ans.toString());
		int result =  sqlSession.insert(ANS +".insertAns",ans);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	/* 답변 삭제하기 */
	@Override
	public int deleteAns(int askno) {
		log.info("* [DAO] Input  ◀ (Service) : " );
		int result = sqlSession.delete(ANS + ".deleteAns", askno);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	
}
