package com.itkey.dao;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;

public interface OrderDAO {

	List<OrderVO> select_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);
	
	// 서비스 유지중
	int select_y();
	
	// 누적 매출액
	int totalSales();
	
	// 월 매출액
	int totalMonths(String thisMonth);
	
	// 오늘자 매출액
	int todaySSales(String today);
}
