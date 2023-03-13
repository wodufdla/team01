package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class QuestionVO {

	// 1:1문의
	private String phone;
	private String question;
	private Date question_time;
	private boolean answer_yn;
	private Date answer_time;
	
}
