package com.itkey.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.vo.PaymentVO;

@Repository("paymentDAO")
public class PaymentDAOImpl implements paymentDAO {
	private static final Logger logger = LoggerFactory.getLogger(PaymentDAOImpl.class);
		
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPayment(PaymentVO pVo) throws Exception {
		logger.debug("* [SERVICE] Input  ◀ (Controller) : " + pVo.toString());
		int result = sqlSession.update("insertPayment",pVo);
		logger.debug("* [SERVICE] Output ◀ (vo) : " + result);
	return result;
	}
	
	
}
