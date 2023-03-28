package com.itkey.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	private static final Logger log = LoggerFactory.getLogger(OrderDAOImpl.class);
	private static final String NAMESPACE = "com.itkey.OrderMapper";
		
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderVO> select_list(PageCriteria criteria) {
		log.info("OrderVO select_list() 호출");
		log.info("start = " + criteria.getStart() + ", end = " + criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".paging", criteria);
	}

	@Override
	public int totalCounts(PageCriteria criteria) {
		log.info("OrderVO totalcounts() 호출");
		return sqlSession.selectOne(NAMESPACE + ".total_count", criteria);
	}

	// 서비스 유지중
	@Override
	public int select_y() {
		log.info("OrderVO select_y() 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_y");
	}

	// 누적 매출액
	@Override
	public int totalSales() {
		log.info("OrderVO totalSales 호출");
		return sqlSession.selectOne(NAMESPACE + ".totalSales");
	}
	
	// 월 매출액
	@Override
	public int totalMonths(String thisMonth) {
		log.info("OrderVO totalMonths 호출");
		return sqlSession.selectOne(NAMESPACE + ".totalMonths", thisMonth);
	}

	// 오늘자 매출액
	@Override
	public int todaySSales(String today) {
		log.info("OrderVO todaySSales 호출");
		return sqlSession.selectOne(NAMESPACE + ".todaySSales", today);
	}
	
}
