package com.itkey.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itkey.dao.UserDAO;
import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;
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

	@Override
	public List<UserVO> read_list(PageCriteria criteria) {
		log.info("read() 호출 : start = " + criteria.getStart());
		log.info("read() 호출 : end = " + criteria.getEnd());
		return userDAO.select_list(criteria);
	}

	@Override
	public int totalCounts(PageCriteria criteria) {
		log.info("totalCounts() 호출");
		return userDAO.totalCounts(criteria);
	}
	
	@Override
	public int  adminMemberCount() throws Exception {
		log.info("adminMemberCount() 호출");
		int result = userDAO.adminMemberCount();
		return result;
	}
	
	@Override
	public int getTodayMemberCount(String today) throws Exception {
		log.info("getTodayMemberCount(String today) 호출");
		int result = userDAO.selectTodayMemberCount(today);
		return result;
	}
	
	@Override
	public int getserviceStatusY() {
		log.info("getserviceStatusY() 호출");
		int result = userDAO.getserviceStatusY();
		return result;
	}

	@Override
	public int getwithdrawalMember() {
		log.info("getwithdrawalMember() 호출");
		int result = userDAO.getwithdrawalMember();
		return result;
	}
	
	//황선필
	//cashclick
	@Override
	public int cashClickCount() {
		int result = userDAO.cashClickCount();
		return result;
	}
	//cashclickcount
	@Override
	public int selectBannerClick() {
		int result = userDAO.selectBannerClick();
		return result;
	}
	////배너 통해서 가입한 회원수
	@Override
	public int selectBannerUserCount() {
		int result = userDAO.selectBannerUserCount();
		return result;
	}
	//회원탈퇴
	@Override
	public int userwithdrawal(UserVO uv) {
		int result = userDAO.userwithdrawal(uv);
		return result;
	}
	@Override
	public int userwithdrawal_phone(String boardIdx) {
		int result = userDAO.userwithdrawal_phone(boardIdx);
		return result;
	}

	//결제내역
	@Override
	public OrderVO selectOrder(UserVO vo) {
		// TODO Auto-generated method stub
		OrderVO ov = userDAO.selectOrder(vo);
		return ov;
	}
	//카카오 회원가입
	@Override
	public int regAll2(UserVO uv) {
		// TODO Auto-generated method stub
		int regnum = userDAO.regAll2(uv);
		return regnum;
	}
	
}
