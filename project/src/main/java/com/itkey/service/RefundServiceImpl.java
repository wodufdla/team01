package com.itkey.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.RefundDAO;

@Service
public class RefundServiceImpl implements RefundService {
	private static final Logger log = LoggerFactory.getLogger(RefundServiceImpl.class);
	
	@Autowired
	private RefundDAO refundDAO;
	
	
}
