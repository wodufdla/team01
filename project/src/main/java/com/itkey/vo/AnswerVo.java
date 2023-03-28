package com.itkey.vo;



import java.util.Date;
import lombok.Data;

@Data
public class AnswerVo {
	// 1:1문의 답변 
	private int ansno;          // 답변번호 
	private int askNo;          // 문의번호
	private String ansContent;  // 답변내용
	private String ansdate;     // 답변일자
	
}
