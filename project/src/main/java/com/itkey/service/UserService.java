package com.itkey.service;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
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
	int totalCounts(PageCriteria criteria);
	
	// 총 가입 회원 수
	int adminMemberCount() throws Exception;
	// 오늘 가입 회원 수
	int getTodayMemberCount(String today) throws Exception;
	// 서비스 가입 회원 수
	int getserviceStatusY();
	// 탈퇴한 회원 수
	int getwithdrawalMember();
	
	//황선필
	//cashclick
	int cashClickCount();
	//cashclickcount
	int selectBannerClick();
	//배너 통해서 가입한 회원수
	int selectBannerUserCount();
	//회원탈퇴
	int userwithdrawal(UserVO uv);
	//결제내역
	OrderVO selectOrder(UserVO vo);
	int userwithdrawal_phone(String boardIdx);
	
	int regAll2(UserVO uv);
	
	
}
