package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

public class PaymentVO {

	private String amount;
	private String merchantUid;
	private String buyerName;

	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}
	
	
}
