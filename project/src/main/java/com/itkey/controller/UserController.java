package com.itkey.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.UserService;
import com.itkey.vo.UserVO;

@Controller
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	
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
				if(userPhone.equals(phone) && userPassword.equals(password)) {
					log.info("로그인성공");
					HttpSession session = request.getSession();
					session.setAttribute("phone", phone);
					//닉네임 세션에 추가 황선필
					session.setAttribute("session_nickname", vo.getNickname());
					//banner 세션에 추가 황선필
					session.setAttribute("session_banner", vo.getBanner());
					
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
				if(userPhone.equals(phone) && userPassword.equals(password)) {
					log.info("로그인성공");
					HttpSession session = request.getSession();
					session.setAttribute("phone", phone);
					//닉네임 세션에 추가 황선필
					session.setAttribute("session_nickname", vo.getNickname());
					//banner 세션에 추가 황선필
					session.setAttribute("session_banner", vo.getBanner());
					
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
			
			session.setAttribute("phone", uv.getPhone());
			session.setAttribute("session_password", uv.getPassword());
			session.setAttribute("session_email", uv.getEmail());
			//session.setAttribute("session_join_date", uv.getJoinDate());
			session.setAttribute("session_withdrawal", uv.getWithdrawal());
			session.setAttribute("session_nickname", uv.getNickname());
			
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
			
			session.setAttribute("phone", uv.getPhone());
			session.setAttribute("session_password", uv.getPassword());
			session.setAttribute("session_email", uv.getEmail());
			session.setAttribute("session_nickname", uv.getNickname());
			session.setAttribute("session_banner", uv.getBanner());
			//session.setAttribute("session_join_date", uv.getJoinDate());
			//session.setAttribute("session_withdrawal", uv.isWithdrawal());
			
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
	public void customerGET(Model model, String keyword, String category, Integer page, Integer numsPerPage, HttpSession session) {
		log.info("customerGET() 호출");
		log.info(""+page);
		log.info(""+numsPerPage);
		log.info(category);
		log.info(keyword);
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
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(userService.totalCounts(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@GetMapping("/product")
	public void productGET() {
		log.info("productGET() 호출");
	}
}
