package com.itkey.service;



import java.util.List;

import com.itkey.vo.QuestionVO;

public interface QuestionService {

	/* 문의사항 불러오기 */
	public List<QuestionVO> selectAskList();
	
	/* 문의사항 작성하기 */
	public int insertAsk(QuestionVO ask);
	
}
