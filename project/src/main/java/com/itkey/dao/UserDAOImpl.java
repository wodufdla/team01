package com.itkey.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
		
	@Autowired
	private SqlSession sqlSession;
	
}
