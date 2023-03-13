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
		
}
