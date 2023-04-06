package com.itkey.service;

import java.util.List;
import java.util.Map;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
import com.itkey.vo.PaymentVO;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UidVO;

public interface OrderService {

	List<OrderVO> read_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);

	// 서비스 유지중
	int select_y();
	
	// 누적 매출액
	int totalSales();
	
	// 월 매출액
	int totalMonths(String thisMonth);
	
	// 오늘자 매출액
	int todaySSales(String today);
	
	public void regularPay(String merchantUid);
	
	// 토큰
	public String getToken() throws Exception;
	public String bilingCredit(Map<String,Object> param) throws Exception;
	
	
	//주문 insert paymentOk 
	
	public int insertPayment(OrderVO odVo) throws Exception;
	
	// 정기결제 대상 건 추출
	List<UidVO> getUid();

	
}
