package com.itkey.dao;

import java.util.List;

import com.itkey.vo.UserVO;

public interface UserDAO {
	List<UserVO> selectAll();
	int insert(UserVO vo);
	int update(UserVO vo);
	int delete(UserVO vo);
	UserVO select_login(String phone);
}
