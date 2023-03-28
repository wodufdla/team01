package com.itkey.dao;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
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
	
	// 비밀번호 찾기
	UserVO find_password(String phone, String email);
	// 페이징 처리
	List<UserVO> select_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);
	
	// 전체 회원 수 count
	int adminMemberCount();
	// 오늘 가입 회원 수
	int selectTodayMemberCount(String today);
	// 서비스 가입 회원 수
	int getserviceStatusY();
	// 탈퇴한 회원 수
	int getwithdrawalMember();
	
	//황선필

	//cashClick
	int cashClickCount();
	//cashclickcount
	int selectBannerClick();
	//배너 통해서 가입한 회원수
	int selectBannerUserCount();
	//회원 탈퇴
	int userwithdrawal(UserVO uv);
	//결제내역
	OrderVO selectOrder(UserVO vo);
	
	
}
