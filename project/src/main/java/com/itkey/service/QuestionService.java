package com.itkey.service;



import java.util.List;

import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;



public interface QuestionService {

	
	/* 문의사항 - 관리자 조회 목록*/
	public List<QuestionVO> selectAskY();
	public List<QuestionVO> selectAskN();
	public List<QuestionVO> selectAsk2(int askno);
	
	/* 문의사항 전체  불러오기 */
	public List<QuestionVO> selectAskList();
	
	/* 문의사항  본인글 불러오기 */
	public List<QuestionVO> selectAsk(String phone);
	

	
	/* 문의사항 작성하기 */
	public int insertAsk(QuestionVO ask);
	/* 문의사항 삭제하기 */
	public int deleteAsk(int askno); 
	/* 문의사항  수정하기 */
	public int updateAsk(int askno); 
	
	
	
	/* 문의사항 답변하기 */
	public int insertAns(AnswerVo ans); 
	public int deleteAns(int askno); 
	
	
}
