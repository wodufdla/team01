package com.itkey.dao;

import java.util.List;

import com.itkey.vo.UserVO;

public interface UserDAO {
	List<UserVO> selectAll();
	int insert(UserVO vo);
	int update(UserVO vo);
	int delete(UserVO vo);
	UserVO select_login(String phone);
	//정보수정 황선필
	int modifyAll(UserVO uv);
	//회원가입 번호 체크
	UserVO regphonecheck(UserVO uv);
	//회원가입 모두 등록
	int regAll(UserVO uv);
}
