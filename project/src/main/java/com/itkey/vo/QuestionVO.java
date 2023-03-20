package com.itkey.vo;



import java.util.Date;


import lombok.Data;


@Data
public class QuestionVO {
	public QuestionVO() {}
	// 1:1문의
	private int askno;           // 문의번호 
	private String phone;         // 회원id
	private String asktitle;     // 문의제목
	private String askcategory;  // 문의카테고리
	private String askcontent;   // 문의내용
	private String anscontent;   // 문의답변내용
	private String askdate;      // 문의작성일자
	private String replyyn;      // 문의답변여부
	
}
