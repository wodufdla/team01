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

	//문의하기 목록 전체 조회 
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
	//문의하기 본인글 조회 
	@Override
	public List<QuestionVO> selectAsk(String phone) {
		List<QuestionVO> result = questionDAO.selectAsk(phone);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result.toString());
		return result;
	}
	
	/* 문의사항 삭제하기 */
	@Override
	public int deleteAsk(int ask_no) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask_no);
		int result= questionDAO.deleteAsk(ask_no);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
		
	}
	/* 문의사항  수정하기 */
	@Override
	public int updateAsk(int ask_no) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + ask_no);
		int result= questionDAO.updateAsk(ask_no);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}
	/* 문의사항 - 관리자 조회 목록*/
	@Override
	public List<QuestionVO> selectAskY() {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskY();
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}
	
	@Override
	public List<QuestionVO> selectAskN() {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAskN();
		log.info("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	}
	@Override
	public List<QuestionVO> selectAsk2(int ask_no) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + toString());
		List<QuestionVO> returnList = questionDAO.selectAsk2(ask_no);
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

	@Override
	public int deleteAns(int askno) {
		log.info("* [SERVICE] Input  ◀ (Controller) : " + askno);
		int result= questionDAO.deleteAns(askno);
		log.info("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	}

	
	
}
