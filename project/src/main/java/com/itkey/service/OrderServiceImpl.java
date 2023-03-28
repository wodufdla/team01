package com.itkey.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.OrderDAO;
import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
import com.itkey.vo.UserVO;

@Service
public class OrderServiceImpl implements OrderService {
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<OrderVO> read_list(PageCriteria criteria) {
		log.info("OrderVO read() 호출 : start = " + criteria.getStart());
		log.info("OrderVO read() 호출 : end = " + criteria.getEnd());
		return orderDAO.select_list(criteria);
	}

	@Override
	public int totalCounts(PageCriteria criteria) {
		log.info("OrderVO totalCounts() 호출");
		return orderDAO.totalCounts(criteria);
	}

	// 서비스 유지중
	@Override
	public int select_y() {
		log.info("OrderVO select_y() 호출");
		return orderDAO.select_y();
	}
	// 누적 매출액
	@Override
	public int totalSales() {
		log.info("OrderVO totalSales() 호출");
		return orderDAO.totalSales();
	}
	
	// 월 매출액
	@Override
	public int totalMonths(String thisMonth) {
		log.info("OrderVO totalMonths() 호출");
		return orderDAO.totalMonths(thisMonth);
	}
	
	// 오늘자 매출액
	@Override
	public int todaySSales(String today) {
		log.info("OrderVO todaySSales() 호출");
		return orderDAO.todaySSales(today);
	}
	
}
