package com.itkey.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@PostMapping("/login")
	public String loginPOST(String phone, String password, HttpServletRequest request, RedirectAttributes reAttr) {
		log.info("loginPOST() 호출");
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
				reAttr.addFlashAttribute("login_result", "successLogin");
				return "redirect:/login";
			} else {
				reAttr.addFlashAttribute("login_result", "failLogin");
				return "redirect:/login";
			}
		}
	}
	
    //로그out 화면 접속 황선필
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
    
    //정보수정 화면 접속 황선필
    @RequestMapping("/modify")
    public String modify() {
    	
    	return "modify";
    }
	
	//정보수정 황선필
	@ResponseBody
	@PostMapping("/modifydo")
	public String modifyAll(UserVO uv ,HttpServletRequest request) {
		
/*		MemberDTO regIdCheck2=memberService.regIdCheck(memberDTO);
		if(regIdCheck2!=null) {
			return 1;
		}else {
			return 0;
		}*/
//		System.out.println("수정phone:"+uv.getPhone());
//		System.out.println("수정pw:"+uv.getPassword());
//		System.out.println("수정email:"+uv.getEmail());
		/*System.out.println("file1:"+multi);*/
		//이미지 빼고 수정
		int MMI=userService.modifyAll(uv);
		//System.out.println("수정여부"+MMI);
		
		//결과 스트링화
		String result=String.valueOf(MMI);
		
		//세션에 다 등록
		HttpSession session = request.getSession();
		//수정 성공시에만 세션 등록
		if(MMI==1) {
			
			session.setAttribute("phone", uv.getPhone());
			session.setAttribute("session_password", uv.getPassword());
			session.setAttribute("session_email", uv.getEmail());
			//session.setAttribute("session_join_date", uv.getJoinDate());
			session.setAttribute("session_withdrawal", uv.isWithdrawal());
			
		}
		
		return result;
		
	}
	
    //회원가입 화면 접속 황선필
    @RequestMapping("/register")
    public String register() {
    	
    	return "register";
    }
    
	//회원가입 창
	//회원가입 번호 중복체크 창
	@ResponseBody
	@PostMapping("/regphonecheck")
	public String regphonecheck(UserVO uv) {
		UserVO uvreg=userService.regphonecheck(uv);
		if(uvreg!=null) {
			return "1";
		}else {
			return "0";
		}
		
	}
	
	//회원가입 모두 등록
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
			//session.setAttribute("session_join_date", uv.getJoinDate());
			session.setAttribute("session_withdrawal", uv.isWithdrawal());
			
		}
		//스트링화
		String sregnum=String.valueOf(regnum);
		
		return sregnum;
		
	}
	
	
}
