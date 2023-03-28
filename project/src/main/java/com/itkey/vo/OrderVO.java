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
public class OrderVO {

	//주문관리
	private int order_no;  
	private String phone;
	private String order_cont;
	private String billing_key;
	private String price;
	private boolean status; 
	private Date rqst_time;
	private Date success_time; 
	private Date next_order_date; 
	private Date auto_order_date;
	
	
}
