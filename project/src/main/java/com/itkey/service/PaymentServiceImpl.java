package com.itkey.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.paymentDAO;
import com.itkey.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	// Logback logger (package : org.slf4j.Logger & org.slf4j.LoggerFactory)
	private static final Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	
	@Autowired
	private paymentDAO paymentDAO;
		
	@Override
	public int insertPayment(PaymentVO pVo) throws Exception {
		logger.debug("* [SERVICE] Input  ◀ (Controller) : " + pVo.toString());
		int result = paymentDAO.insertPayment(pVo);
		logger.debug("* [SERVICE] Output ◀ (vo) : " + result);
		return result;
	};
}
