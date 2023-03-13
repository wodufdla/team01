package com.itkey.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.ServiceDAO;

@Service
public class ServiceServiceImpl implements ServiceService {
	private static final Logger log = LoggerFactory.getLogger(ServiceServiceImpl.class);
	
	@Autowired
	private ServiceDAO serviceDAO;
	
	
}
