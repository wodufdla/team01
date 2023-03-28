package com.itkey.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;

public interface QuestionDAO {
	
	
	/* 문의사항  본인글 불러오기 */
	public List<QuestionVO> selectAsk(PageCriteria criteria);
	int selectAsktotalCount(PageCriteria criteria);
	
	/* 문의사항 - 관리자 조회 목록*/
	/* 문의사항 전체  불러오기 */
	public List<QuestionVO> selectAskList(PageCriteria criteria);
	int selectAskListtotalCount(PageCriteria criteria);
	
	public List<QuestionVO> selectAskY(PageCriteria criteria);
	int selectAskYtotalCount(PageCriteria criteria);
	
	public List<QuestionVO> selectAskN(PageCriteria criteria);
	int selectAskNtotalCount(PageCriteria criteria);
	public List<QuestionVO> selectAsk2(int askNo);
	
	int askTodayCount();
	
	/* 문의사항 작성하기 */
	public int insertAsk(QuestionVO ask);
	
	/* 문의사항 삭제하기 */
	public int deleteAsk(int askNo); 
	/* 문의사항  수정하기 */
	public int updateAsk(int askNo);
	
	
	/* 답변 작성하기 */
	public int insertAns(AnswerVo ans);
	
	/* 답변 삭제하기 */
	public int deleteAns(int askNo); 

}
