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

		int update1 = (Integer)sqlSession.update("modifyAll", uv);

		return update1;
	}
	
	//회원가입 번호 체크 황선필
	@Override
	public UserVO regphonecheck(UserVO uv) {
		// TODO Auto-generated method stub
		UserVO uvreg=sqlSession.selectOne("regphonecheck", uv);
		return uvreg;
	}
	
	//회원가입 모두 등록 황선필
	@Override
	public int regAll(UserVO uv) {
		// TODO Auto-generated method stub
		int regnum = sqlSession.insert("regAll", uv);
		return regnum;
	}

	@Override
	public UserVO find_password(String phone, String email) {
		log.info("find_password() 호출");
		Map<String, String> args = new HashMap<String, String>();
		args.put("phone", phone);
		args.put("email", email);
		return sqlSession.selectOne(NAMESPACE + ".find_password", args);
	}

	@Override
	public List<UserVO> select_list(PageCriteria criteria) {
		log.info("select_list() 호출");
		log.info("start = " + criteria.getStart() + ", end = " + criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".paging", criteria);
	}

	@Override
	public int totalCounts(PageCriteria criteria) {
		log.info("totalcounts() 호출");
		return sqlSession.selectOne(NAMESPACE + ".total_count", criteria);
	}
	
	@Override
	public int  adminMemberCount() {
		log.info("adminMemberCount() 호출");
		return sqlSession.selectOne(NAMESPACE + ".adminMemberCount");
	}
}
