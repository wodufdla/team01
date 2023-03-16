package com.itkey.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.UserDAO;
import com.itkey.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDAO userDAO;
		
	
	@Override
	public List<UserVO> readAll() {
		log.info("read() 호출");
		return userDAO.selectAll();
	}

	@Override
	public int create(UserVO vo) {
		log.info("create() 호출 : vo = " + vo.toString());
		return userDAO.insert(vo);
	}

	@Override
	public int update(UserVO vo) {
		log.info("update() 호출 : vo = " + vo.toString());
		return userDAO.update(vo);
	}

	@Override
	public int delete(UserVO vo) {
		log.info("delete() 호출 : vo = " + vo.toString());
		return userDAO.delete(vo);
	}

	@Override
	public UserVO read_login(String phone) {
		log.info("read_login() 호출 : phone = " + phone);
		return userDAO.select_login(phone);
	}
	
	//정보수정 황선필
	@Override
	public int modifyAll(UserVO uv) {
		// TODO Auto-generated method stub
		int MMI = userDAO.modifyAll(uv);
		return MMI;
	}
	
	//회원가입 번호 체크 황선필
	@Override
	public UserVO regphonecheck(UserVO uv) {
		// TODO Auto-generated method stub
		UserVO uvreg=userDAO.regphonecheck(uv);
		return uvreg;
	}
	
	//회원가입 모두 등록 황선필
	@Override
	public int regAll(UserVO uv) {
		// TODO Auto-generated method stub
		int regnum = userDAO.regAll(uv);
		return regnum;
	}

	@Override
	public UserVO find_password(String phone, String email) {
		log.info("find_password() 호출 : phone = " + phone + " email = " + email);
		return userDAO.find_password(phone, email);
	}
	
}
