package com.itkey.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDAO orderDAO;
	
	
}
