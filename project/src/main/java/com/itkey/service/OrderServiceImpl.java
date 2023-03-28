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
	
}
