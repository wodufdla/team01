package com.itkey.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.QuestionDAO;
import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	private static final Logger log = LoggerFactory.getLogger(QuestionServiceImpl.class);

	@Autowired
	private QuestionDAO questionDAO;

	// 문의하기 본인글 조회
	@Override
	public List<QuestionVO> selectAsk(PageCriteria criteria) {
		List<QuestionVO> result = questionDAO.selectAsk(criteria);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result.toString());
		return result;
	}
	
	@Override
	public int selectAsktotalCount(PageCriteria criteria) {
		log.info("totalCounts() 호출");
		return questionDAO.selectAsktotalCount(criteria);
	}
	@Override
	public int askTodayCount() {
		log.info("totalCounts() 호출");
		return questionDAO.askTodayCount();
	}

	// 문의하기 등록 insert
	@Override
	public int insertAsk(QuestionVO ask) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask.toString());
		int result = questionDAO.insertAsk(ask);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}

	/* 문의사항 삭제하기 */
	@Override
	public int deleteAsk(int ask_No) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask_No);
		int result = questionDAO.deleteAsk(ask_No);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;

	}

	/* 문의사항 수정하기 */
	@Override
	public int updateAsk(int ask_No) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask_No);
		int result = questionDAO.updateAsk(ask_No);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}

	/* 문의사항 - 관리자 조회 목록 */
	// 문의하기 목록 전체 조회
	@Override
	public List<QuestionVO> selectAskList(PageCriteria criteria) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskList(criteria);
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}

	@Override
	public int selectAskListtotalCount(PageCriteria criteria) {
		log.info("totalCounts() 호출");
		return questionDAO.selectAskListtotalCount(criteria);
	}
	
	@Override
	public List<QuestionVO> selectAskY(PageCriteria criteria) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskY(criteria);
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}
	@Override
	public int selectAskYtotalCount(PageCriteria criteria) {
		log.info("totalCounts() 호출");
		return questionDAO.selectAskYtotalCount(criteria);
	}

	@Override
	public List<QuestionVO> selectAskN(PageCriteria criteria) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskN(criteria);
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}
	@Override
	public int selectAskNtotalCount(PageCriteria criteria) {
		log.info("totalCounts() 호출");
		return questionDAO.selectAskNtotalCount(criteria);
	}

	@Override
	public List<QuestionVO> selectAsk2(int ask_No) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAsk2(ask_No);
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}
	
	@Override
	public List<QuestionVO> ansUpdateSelect(int ask_No) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.ansUpdateSelect(ask_No);
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}

	/* 문의사항 답변하기 */
	@Override
	public int insertAns(AnswerVo ans) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ans.toString());
		int result = questionDAO.insertAns(ans);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	/* 문의사항 답변수정 */
	@Override
	public int ansUpdate(AnswerVo ans) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ans.toString());
		int result = questionDAO.ansUpdate(ans);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}


	@Override
	public int deleteAns(int askNo) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + askNo);
		int result = questionDAO.deleteAns(askNo);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}



}
