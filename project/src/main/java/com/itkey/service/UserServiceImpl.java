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
	
}
