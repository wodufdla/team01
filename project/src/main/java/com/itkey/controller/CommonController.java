package com.itkey.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itkey.service.KakaoAPI;
import com.itkey.service.UserService;
import com.itkey.vo.KakaoVO;
import com.itkey.vo.UserVO;

@Controller
public class CommonController{

//2022.08.05 추가 : 만들어둔 서비스를 객체 주입 받아 와야 한다.
//(2)번 게시물에서는 썼는데 여기는 빠졌었다! 
 @Autowired 
 KakaoAPI kakaoService;
 
 @Autowired
 UserService userService;

  //경로 대소문자 실수하지 말기!
  @RequestMapping(value = "/kakaoLogin")
    public String login(@RequestParam("code") String code,  HttpSession session,  HttpServletRequest request) throws IOException {
         //System.out.println("code!:"+code);
	   String apikey1=(String) session.getAttribute("apikey");
	   String banner=(String) session.getAttribute("banner");
	   System.out.println("apikey1:"+apikey1);
	  
        //토큰 발급 받기
		String access_Token = kakaoService.getAccessToken(code,apikey1);
       
        //사용자 정보 가지고 오기 
		KakaoVO userInfo = kakaoService.userInfo(access_Token);
		
		//세션 형성 + request 내장 객체 가지고 오기
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		System.out.println("nickname: "+ userInfo.getNickname());
		System.out.println("email: "+ userInfo.getAccount_email());
		System.out.println("gender: "+ userInfo.getGender());
		
		
		//세션에 담기
		if (userInfo.getNickname() != null) {
			
			session.setAttribute("session_birthday", userInfo.getBirthday());
			session.setAttribute("session_email", userInfo.getAccount_email());
		     session.setAttribute("session_nickname", userInfo.getNickname());
		     session.setAttribute("access_Token", access_Token);
		     session.setAttribute("phone", userInfo.getKakaoId());
		     String phone1 = String.valueOf(userInfo.getKakaoId());
		     
		     UserVO uv = new UserVO();
		     uv.setBanner(banner);
		     uv.setPhone(phone1);
		     uv.setNickname(userInfo.getNickname());
		     uv.setEmail(userInfo.getAccount_email());
		     
				//회원가입 카카오통해서
		     
				int regnum=userService.regAll2(uv);
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
					
					
					
					return "/kakaoclose";
				}else {
					
					return "redirect:/kakao";
				}
		     
		   }
            
        return "redirect:/kakao";
    }

  @RequestMapping("/kakao")
  public String kakao(Model model) {
  	return "kakao";
  }
  @RequestMapping("/kakaoclose")
  public String kakaoclose(Model model) {
	  return "kakaoclose";
  }
  @ResponseBody
  @RequestMapping("/kakaoapikey")
  public String kakaoapikey(@RequestParam("apikey") String apikey, @RequestParam("banner") String banner,
		  HttpSession session,  HttpServletRequest request) {
	  
	  System.out.println("apikeycontroller:"+apikey);
	  session = request.getSession();
	  session.setAttribute("apikey", apikey);
	  session.setAttribute("banner", banner);
	  if(apikey!=null) {
		  
		  return "1";
	  }else {
		  return "0";
	  }
	  
  }
  
  

}

