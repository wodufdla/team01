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
	
	
	
}
