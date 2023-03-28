package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class OrderVO {

	//주문관리
	private String orderNo; // 결제일자+핸드폰번호 뒤4자리
	private String phone;
	private String orderCont; // 가입한 서비스의 no
	private String billingKey;
	private String price;
	private String status; 
	private String rqstTime;
	private String successTime; 
	private Date nextOrderDate; 
	private Date autoOrderDate;
	
	
}
