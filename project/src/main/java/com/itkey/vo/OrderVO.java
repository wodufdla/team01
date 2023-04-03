package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class OrderVO {

	//매출관리
	private String orderNo;     // 결제일자+핸드폰번호 뒤4자리 : 주문번호 
	private String phone;       // 회원id
	private String orderCont;   // 가입한 서비스의 번호 1번 7일체험, 2번 월 정기결제
	private String billingKey;  // 빌링키
	private String price;       // 가격
	private String status;      // 가입상태
	private Date rqstTime;       // rqstTime 승인 시간
	private Date successTime;    // successTime 승인 성공 시간
	private Date nextOrderDate;  //  다음결제일 
	private Date autoOrderDate;  //
	
	private String amount;       //결제금액
	private String merchantUid;  //merchantUid
	private String buyerName;    //닉네임
	

}
