package com.itkey.dao;

import java.util.List;

import com.itkey.vo.QuestionVO;

public interface QuestionDAO {
	
	/* 문의사항 불러오기 */
	public List<QuestionVO> selectAsk();
	
	/* 문의사항 작성하기 */
	public int insertAsk(QuestionVO ask);
}
