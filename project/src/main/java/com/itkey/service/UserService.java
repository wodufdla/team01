package com.itkey.service;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.UserVO;

public interface UserService {
	List<UserVO> readAll();
	int create(UserVO vo);
	int update(UserVO vo);
	int delete(UserVO vo);
	UserVO read_login(String phone);
	
	//정보수정 황선필
	int modifyAll(UserVO uv);
	//회원가입 번호 체크 황선필
	UserVO regphonecheck(UserVO uv);
	//회원가입 모두 등록 황선필
	int regAll(UserVO uv);
	
	// 비밀번호 찾기
	UserVO find_password(String phone, String email);
	List<UserVO> read_list(PageCriteria criteria);
	int totalCounts();
}
