package com.itkey.dao;

import com.itkey.vo.PaymentVO;

public interface paymentDAO {
	
	public int insertPayment(PaymentVO pVo) throws Exception;
}
