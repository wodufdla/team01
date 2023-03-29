package com.itkey.service;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;

public interface OrderService {

	List<OrderVO> read_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);

	// 서비스 유지중
	Integer select_y();
	
	// 누적 매출액
	Integer totalSales();
	
	// 월 매출액
	Integer totalMonths(String thisMonth);
	
	// 오늘자 매출액
	Integer todaySSales(String today);
}
