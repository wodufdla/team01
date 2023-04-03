package com.itkey.dao;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
import com.itkey.vo.PaymentVO;
import com.itkey.vo.QuestionVO;

public interface OrderDAO {

	List<OrderVO> select_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);
	
	// 서비스 유지중
	Integer select_y();
	
	// 누적 매출액
	Integer totalSales();
	
	// 월 매출액
	Integer totalMonths(String thisMonth);
	
	// 오늘자 매출액
	Integer todaySSales(String today);
	
	//주문 insert paymentOk 
	public int insertPayment(OrderVO odVo) throws Exception;
}
