package com.itkey.service;

import java.util.List;

import com.itkey.vo.UserVO;

public interface UserService {
	List<UserVO> readAll();
	int create(UserVO vo);
	int update(UserVO vo);
	int delete(UserVO vo);
	UserVO read_login(String phone);
	//정보수정 황선필
	int modifyAll(UserVO uv);
}
