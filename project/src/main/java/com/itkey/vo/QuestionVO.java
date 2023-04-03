package com.itkey.vo;



import java.util.Date;


import lombok.Data;


@Data
public class QuestionVO {
	// 1:1문의
	private int rowNum;           //번호
	private int askNo;           // 문의번호 
	private String phone;        // 회원id
	private String askTitle;     // 문의제목
	private String askCategory;  // 문의카테고리
	private String askContent;   // 문의내용
	private String ansContent;   // 문의답변내용
	private String askDate;      // 문의작성일자
	private String replyYn;      // 문의답변여부
	private String withdrawal;   // 탈퇴여부
	
}
