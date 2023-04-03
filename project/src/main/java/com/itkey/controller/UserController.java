package com.itkey.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.OrderService;
import com.itkey.service.QuestionService;
import com.itkey.service.UserService;
import com.itkey.util.MainInfo;
import com.itkey.vo.OrderVO;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UserVO;

@Controller
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private QuestionService questionService;

	
	@GetMapping("/login")
	public void loginGET() {
		log.info("loginGET() 호출");
	}
	//login2 추가
	@GetMapping("/login2")
	public String login2() {
		return "/login2";
	}
	
	@PostMapping("/login")
	public String loginPOST(String phone, String password, HttpServletRequest request, RedirectAttributes reAttr) {
		log.info("loginPOST() 호출");
		if(phone.equals("admin") && password.equals("1234")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", phone);
			reAttr.addFlashAttribute("admin_result", "success");
			return "redirect:/login";
		} else {
			UserVO vo = userService.read_login(phone);
			
			if (vo == null) {
				reAttr.addFlashAttribute("login_result", "fail");
				return "redirect:/login";
			} else {
				String userPhone = vo.getPhone();
				String userPassword = vo.getPassword();
				String serviceYN = vo.getServiceyn();
				//탈퇴여부
				String wd = vo.getWithdrawal();
				if(wd.equals("Y")) {
					//System.out.println("탈퇴함:"+wd);
					reAttr.addFlashAttribute("login_result", "wdstatus");
					return "redirect:/login";
					
				}else {
					//System.out.println("탈퇴안함:"+wd);
					
				}
				
				if(userPhone.equals(phone) && userPassword.equals(password)) {
					log.info("로그인성공");
					HttpSession session = request.getSession();
					
					OrderVO ov = userService.selectOrder(vo);
					
					if(ov!=null) {
						session.setAttribute("session_orderno", ov.getOrderNo());
						session.setAttribute("session_ordercont", ov.getOrderCont());
						session.setAttribute("session_price", ov.getPrice());
						session.setAttribute("session_status", ov.getStatus());
						session.setAttribute("session_rqsttime", ov.getRqstTime());
						session.setAttribute("session_success", ov.getSuccessTime());
						session.setAttribute("session_nextorderdate", ov.getNextOrderDate());
						session.setAttribute("session_autoorderdate", ov.getAutoOrderDate());
					}
					
					session.setAttribute("phone", phone);
					session.setAttribute("serviceYN", serviceYN);
					//닉네임 세션에 추가 황선필
					session.setAttribute("session_nickname", vo.getNickname());
					//banner 세션에 추가 황선필
					session.setAttribute("session_banner", vo.getBanner());
					
					
					//session.setAttribute("session_password", uv.getPassword());
					session.setAttribute("session_email", vo.getEmail());
					session.setAttribute("session_join_date", vo.getJoinDate());
					//session.setAttribute("session_withdrawal", uv.getWithdrawal());
					
					
					reAttr.addFlashAttribute("login_result", "successLogin");
					return "redirect:/login";
				} else {
					reAttr.addFlashAttribute("login_result", "failLogin");
					return "redirect:/login";
				}
			}
		}
	}
	
	@PostMapping("/login2")
	public String loginPOST2(String phone, String password, HttpServletRequest request, RedirectAttributes reAttr) {
		log.info("loginPOST2() 호출");
		if(phone.equals("admin") && password.equals("1234")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", phone);
			reAttr.addFlashAttribute("admin_result", "success2");
			return "redirect:/login2";
		} else {
			UserVO vo = userService.read_login(phone);
			
			if (vo == null) {
				reAttr.addFlashAttribute("login_result", "fail2");
				return "redirect:/login2";
			} else {
				String userPhone = vo.getPhone();
				String userPassword = vo.getPassword();
				String serviceYN = vo.getServiceyn();

				//탈퇴여부
				String wd = vo.getWithdrawal();
				if(wd.equals("Y")) {
					//System.out.println("탈퇴함:"+wd);
					reAttr.addFlashAttribute("login_result", "wdstatus");
					return "redirect:/login2";
					
				}else {
					//System.out.println("탈퇴안함:"+wd);
					
				}
				
				
				if(userPhone.equals(phone) && userPassword.equals(password)) {
					log.info("로그인성공");
					HttpSession session = request.getSession();
					
					OrderVO ov = userService.selectOrder(vo);
					
					if(ov!=null) {
						session.setAttribute("session_orderno", ov.getOrderNo());
						session.setAttribute("session_ordercont", ov.getOrderCont());
						session.setAttribute("session_price", ov.getPrice());
						session.setAttribute("session_status", ov.getStatus());
						session.setAttribute("session_rqsttime", ov.getRqstTime());
						session.setAttribute("session_success", ov.getSuccessTime());
						session.setAttribute("session_nextorderdate", ov.getNextOrderDate());
						session.setAttribute("session_autoorderdate", ov.getAutoOrderDate());
					}
					
					session.setAttribute("phone", phone);
					session.setAttribute("serviceYN", serviceYN);
					//닉네임 세션에 추가 황선필
					session.setAttribute("session_nickname", vo.getNickname());
					//banner 세션에 추가 황선필
					session.setAttribute("session_banner", vo.getBanner());
					
					
					//session.setAttribute("session_password", uv.getPassword());
					session.setAttribute("session_email", vo.getEmail());
					session.setAttribute("session_join_date", vo.getJoinDate());
					//session.setAttribute("session_withdrawal", uv.getWithdrawal());
					
					reAttr.addFlashAttribute("login_result", "successLogin2");
					return "redirect:/login2";
				} else {
					reAttr.addFlashAttribute("login_result", "failLogin2");
					return "redirect:/login2";
				}
			}
		}
	}
	
    //로그out 화면 접속 황선필
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/crime";
    }
    
    //정보수정 화면 접속 황선필
    @RequestMapping("/modify")
    public String modify() {
    	
    	return "modify";
    }
    //정보수정2 화면 접속 황선필
    @RequestMapping("/modify2")
    public String modify2() {
    	
    	return "modify2";
    }
	
	//실질 정보수정 황선필
	@ResponseBody
	@PostMapping("/modifydo")
	public String modifyAll(UserVO uv ,HttpServletRequest request) {
		
		//정보 수정
		int MMI=userService.modifyAll(uv);
		
		//결과 스트링화
		String result=String.valueOf(MMI);
		
		HttpSession session = request.getSession();
		//수정 성공시에만 세션 등록
		if(MMI==1) {
			
			UserVO vo = userService.read_login(uv.getPhone());
			
			session.setAttribute("phone", vo.getPhone());
			//session.setAttribute("session_password", uv.getPassword());
			session.setAttribute("session_email", vo.getEmail());
			session.setAttribute("session_join_date", vo.getJoinDate());
			//session.setAttribute("session_withdrawal", uv.getWithdrawal());
			session.setAttribute("session_nickname", vo.getNickname());
			session.setAttribute("session_banner", vo.getBanner());
			session.setAttribute("serviceYN", vo.getServiceyn());
			
		}
		
		return result;
	}
	
    //회원가입 화면 접속 황선필
    @RequestMapping("/register")
    public String register() {
    	
    	return "register";
    }
    
	//회원가입 번호 중복체크 창 황선필
	@ResponseBody
	@PostMapping("/regphonecheck")
	public String regphonecheck(UserVO uv) {
		//번호 체크
		UserVO uvreg=userService.regphonecheck(uv);
		//찾은 결과 체크 여부
		if(uvreg!=null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	//회원가입 모두 등록 황선필
	@ResponseBody
	@PostMapping("/regAll")
	public String regAll(UserVO uv,HttpServletRequest request) {
		
		//회원가입
		int regnum=userService.regAll(uv);
		
		//세션에 다 등록
		HttpSession session = request.getSession();
		//등록 성공시에만 세션 등록
		if(regnum==1) {
			
			UserVO vo = userService.read_login(uv.getPhone());
			
			session.setAttribute("phone", vo.getPhone());
			//session.setAttribute("session_password", uv.getPassword());
			session.setAttribute("session_email", vo.getEmail());
			session.setAttribute("session_join_date", vo.getJoinDate());
			//session.setAttribute("session_withdrawal", uv.getWithdrawal());
			session.setAttribute("session_nickname", vo.getNickname());
			session.setAttribute("session_banner", vo.getBanner());
			session.setAttribute("serviceYN", vo.getServiceyn());
			
		}
		//결과 값 스트링화
		String sregnum=String.valueOf(regnum);
		
		return sregnum;
	}
	
	// 비밀번호찾기 김진수
	@GetMapping("/find")
	public void findGET() {
		log.info("findGET() 호출");
	}
	
	@PostMapping("/find")
	public String findPOST(String phone, String email, HttpServletRequest request, RedirectAttributes reAttr) {
		log.info("findPOST() 호출");
		
		email = email.replaceFirst("[^\\w+]", "@");
		log.info(email);
		UserVO vo = userService.find_password(phone, email);
		if (vo == null) {
			reAttr.addFlashAttribute("find_result", "failFind");
			return "redirect:/find";
		} else {
			String userPassword = vo.getPassword();
			reAttr.addFlashAttribute("find_result", userPassword);
			return "redirect:/find";
		}
	}
	
	@GetMapping("/customer")
	public void customerGET(Model model, String keyword, String category, Integer page, Integer numsPerPage, HttpSession session) throws Exception {
		log.info("customerGET() 호출");
		//log.info(""+page);
		//log.info(""+numsPerPage);
		//log.info(category);
		//log.info(keyword);
		
		MainInfo mInfo = new MainInfo();
		String today = mInfo.curDate();
		
		PageCriteria criteria = new PageCriteria();
		if (keyword != null) {
			criteria.setKeyword(keyword);
			criteria.setCategory(category);
		}
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		List<UserVO> list = userService.read_list(criteria);
		model.addAttribute("list", list);
		
		// 전체 가입 회원 수 count
		int mCount = userService.adminMemberCount();
		model.addAttribute("mCount", mCount);
		
		// 오늘 가입 회원 수 count
		int mTodayCount = userService.getTodayMemberCount(today);
		model.addAttribute("mTodayCount", mTodayCount);
		
		// 서비스 가입 회원 수
		int serviceStatusY = userService.getserviceStatusY();
		model.addAttribute("serviceStatusY", serviceStatusY);
		
		// 탈퇴한 회원 수
		int withdrawal = userService.getwithdrawalMember();
		model.addAttribute("withdrawal", withdrawal);
		
		

		//황선필 배너 클릭수, 배너통한 회원가입수
		int bClick = userService.selectBannerClick();
		//System.out.println("bclick:"+bClick);
		int bUserCount = userService.selectBannerUserCount();
		//System.out.println("bUserCount:"+bUserCount);
		model.addAttribute("bClickCount", bClick);
		model.addAttribute("bUserCount", bUserCount);
		
		// 1:1문의->탈퇴 요청 회원
		List<QuestionVO> reqWithdrawal = questionService.getReqWithdrawal();
		int  reqWithdrawalCount = reqWithdrawal.size();
		model.addAttribute("reqWithdrawalCount", reqWithdrawalCount);
		model.addAttribute("reqWithdrawal", reqWithdrawal);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(userService.totalCounts(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@GetMapping("/withdrawalProcessing")
	public void withdrawalProcessing(Model model, String keyword, String category, Integer page, Integer numsPerPage, HttpSession session) throws Exception {
		log.info("withdrawalProcessing() 호출");
		
		MainInfo mInfo = new MainInfo();
		String today = mInfo.curDate();
		
		PageCriteria criteria = new PageCriteria();
/*		if (keyword != null) {
			criteria.setKeyword(keyword);
			criteria.setCategory(category);
		}
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}*/

		// 전체 가입 회원 수 count
		int mCount = userService.adminMemberCount();
		model.addAttribute("mCount", mCount);
		
		// 오늘 가입 회원 수 count
		int mTodayCount = userService.getTodayMemberCount(today);
		model.addAttribute("mTodayCount", mTodayCount);
		
		// 서비스 가입 회원 수
		int serviceStatusY = userService.getserviceStatusY();
		model.addAttribute("serviceStatusY", serviceStatusY);
		
		// 탈퇴한 회원 수
		int withdrawal = userService.getwithdrawalMember();
		model.addAttribute("withdrawal", withdrawal);

		//황선필 배너 클릭수, 배너통한 회원가입수
		int bClick = userService.selectBannerClick();
		//System.out.println("bclick:"+bClick);
		int bUserCount = userService.selectBannerUserCount();
		//System.out.println("bUserCount:"+bUserCount);
		model.addAttribute("bClickCount", bClick);
		model.addAttribute("bUserCount", bUserCount);
		
		// 1:1문의->탈퇴 요청 회원
		List<QuestionVO> reqWithdrawal = questionService.getReqWithdrawal();
		int  reqWithdrawalCount = reqWithdrawal.size();
		model.addAttribute("reqWithdrawalCount", reqWithdrawalCount);
		model.addAttribute("reqWithdrawal", reqWithdrawal);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(reqWithdrawalCount);
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//cashClick 황선필
	@ResponseBody
	@RequestMapping("/cashClick")
	public String cashClick(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//System.out.println("sesiion:"+session.getAttribute("phone"));
		//System.out.println("sesiion:"+session.getAttribute("admin"));
		if(session.getAttribute("phone")==null && session.getAttribute("admin")==null) {
			
			int result = userService.cashClickCount();
			String result2=String.valueOf(result);
			return result2;
		}else {
			return "0";
		}
		
		//결과 스트링화
		
		//System.out.println("result2:"+result2);
		
	}
	
	//mypage 추가 황선필
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage";
	}
	//myinfo 추가 황선필
	@RequestMapping("/myinfo")
	public String myinfo() {
		return "/myinfo";
	}
	//paymentHistory 추가 황선필
	@RequestMapping("/paymentHistory")
	public String paymentHistory() {
		
		
		return "/paymentHistory";
	}
	
	//paymentHistory 추가 황선필
	@RequestMapping("/withdrawal")
	public String withdrawal(UserVO uv,HttpServletRequest request) {
		System.out.println("phone:"+uv.getPhone());
        HttpSession session = request.getSession();
        session.invalidate();
        int result=userService.userwithdrawal(uv);
        //System.out.println("resultwith:"+result);
        
		return "redirect:/crime";
	}


	
	
	
	
	
	
	
	
	
}
