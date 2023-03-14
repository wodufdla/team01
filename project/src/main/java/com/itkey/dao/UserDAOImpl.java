package com.itkey.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
		
	private static final String NAMESPACE = "com.itkey.UserMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserVO> selectAll() {
		log.info("selectAll() 호츌");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}

	@Override
	public int insert(UserVO vo) {
		log.info("insert() 호출");
		return sqlSession.insert(NAMESPACE + ".insert" , vo);
	}

	@Override
	public int update(UserVO vo) {
		log.info("update() 호출");
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public int delete(UserVO vo) {
		log.info("delete() 호출");
		return sqlSession.update(NAMESPACE + ".delete", vo);
	}

	@Override
	public UserVO select_login(String phone) {
		log.info("select_login() 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_login", phone);
	}
	
	//정보수정 황선필
	@Override
	public int modifyAll(UserVO uv) {
		
//		System.out.println("수정phone:"+uv.getPhone());
//		System.out.println("수정pw:"+uv.getPassword());
//		System.out.println("수정email:"+uv.getEmail());

		int update1 = (Integer)sqlSession.update("modifyAll", uv);

		return update1;
	}
}
