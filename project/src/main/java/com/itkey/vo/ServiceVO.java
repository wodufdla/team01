package com.itkey.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ServiceVO {

	// 서비스
	private int Service_no;
//	private int price;
	private String title;
	private String content;
	
}
