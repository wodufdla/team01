package com.itkey.service;



import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;



public interface QuestionService {

	
	/* 문의사항 - 관리자 조회 목록*/
	
	public List<QuestionVO> selectAskY(PageCriteria criteria);
	int selectAskYtotalCount(PageCriteria criteria);
	
	int askTodayCount();
	
	public List<QuestionVO> selectAskN(PageCriteria criteria);
	int selectAskNtotalCount(PageCriteria criteria);
	
	public List<QuestionVO> selectAsk2(int askno);
	
	/* 문의사항 관리자   전체조회  */
	public List<QuestionVO> selectAskList(PageCriteria criteria);
	int selectAskListtotalCount(PageCriteria criteria);
	
	/* 문의사항  본인글 불러오기 */
	public List<QuestionVO> selectAsk(PageCriteria criteria);
	int selectAsktotalCount(PageCriteria criteria);
	

	
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
