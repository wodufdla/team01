package com.itkey.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.UidVO;

@Repository
public class UidDAOImpl implements UidDAO {
	private static final Logger log = LoggerFactory.getLogger(UidDAOImpl.class);

	private static final String NAMESPACE = "com.itkey.UidMapper";
	

	@Autowired
	private SqlSession sqlSession;
	
	public List<UidVO> getUid() {
		log.info("getUid() 호출");
		return sqlSession.selectList(NAMESPACE + ".getUid");
	}
}
