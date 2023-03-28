package com.itkey.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	private static final Logger log = LoggerFactory.getLogger(QuestionDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String ASK = "com.itkey.QuestionMapper";
	private static final String ANS = "com.itkey.AnswerMapper";

	// 문의하기 본인글 조회
	@Override
	public List<QuestionVO> selectAsk(PageCriteria criteria) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAsk", criteria);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	@Override
	public int selectAsktotalCount(PageCriteria criteria) {
		log.info("totalcounts() 호출");
		return sqlSession.selectOne(ASK + ".selectAsktotalCount", criteria);
	}
	@Override
	public int askTodayCount() {
		log.info("totalcounts() 호출");
		return sqlSession.selectOne(ASK + ".askTodayCount");
	}

	/* 문의사항 작성하기 */
	@Override
	public int insertAsk(QuestionVO ask) {
		log.info("* [DAO] Input  ◀ (Service) : " + ask.toString());
		int result = sqlSession.insert(ASK + ".insertAsk", ask);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	/* 문의사항 - 관리자 조회 목록 */

	// 문의하기 목록 조회 selectList
	@Override
	public List<QuestionVO> selectAskList(PageCriteria criteria) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> out = sqlSession.selectList(ASK + ".selectAskList",criteria);
		log.info("* [DAO] Output ◀ (Mybatis) : " + out.toString());
		return out;
	}
	
	@Override
	public int selectAskListtotalCount(PageCriteria criteria) {
		log.info(" List totalcounts() 호출");
		return sqlSession.selectOne(ASK + ".selectAskListtotalCount", criteria);
	}

	@Override
	public List<QuestionVO> selectAskY(PageCriteria criteria) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAskY",criteria);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	@Override
	public int selectAskYtotalCount(PageCriteria criteria) {
		log.info("AskY totalcounts() 호출");
		return sqlSession.selectOne(ASK + ".selectAskYtotalCount", criteria);
	}

	@Override
	public List<QuestionVO> selectAskN(PageCriteria criteria) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAskN",criteria);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	@Override
	public int selectAskNtotalCount(PageCriteria criteria) {
		log.info("AskN  totalcounts() 호출");
		return sqlSession.selectOne(ASK + ".selectAskNtotalCount", criteria);
	}

	@Override
	public List<QuestionVO> selectAsk2(int askNo) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> result = sqlSession.selectList(ASK + ".selectAsk2", askNo);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}
	
	@Override
	public List<QuestionVO> ansUpdateSelect(int askNo) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		List<QuestionVO> result = sqlSession.selectList(ASK + ".ansUpdateSelect", askNo);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result.toString());
		return result;
	}

	/* 문의사항 삭제하기 */
	@Override
	public int deleteAsk(int daskNo) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		int result = sqlSession.delete(ASK + ".deleteAsk", daskNo);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	/* 문의사항 수정하기 */
	@Override
	public int updateAsk(int ask_No) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		int result = sqlSession.update(ASK + ".updateAsk", ask_No);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	/* 답변 작성하기 */
	@Override
	public int insertAns(AnswerVo ans) {
		log.info("* [DAO] Input  ◀ (Service) : " + ans.toString());
		int result = sqlSession.insert(ANS + ".insertAns", ans);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	/* 답변 수정하기 */
	@Override
	public int ansUpdate(AnswerVo ans) {
		log.info("* [DAO] Input  ◀ (Service) : " + ans.toString());
		int result = sqlSession.insert(ANS + ".ansUpdate", ans);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

	/* 답변 삭제하기 */
	@Override
	public int deleteAns(int askNo) {
		log.info("* [DAO] Input  ◀ (Service) : ");
		int result = sqlSession.delete(ANS + ".deleteAns", askNo);
		log.info("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}

}
