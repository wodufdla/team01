package com.itkey.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itkey.service.QuestionService;
import com.itkey.vo.QuestionVO;
import com.itkey.vo.UserVO;

@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;

	//문의하기 목록  
	
	
	@RequestMapping("/question")
	public ModelAndView selectAsk(ModelAndView mv
			, HttpSession session
			//, QuestionVO ask
			, RedirectAttributes rttr
			//, @RequestParam(value="phone", required = false) String phone
			) {
		
		// 회원 로그인 여부 
//		Member member = (Member) session.getAttribute("loginInfo");
//		if (member == null) {
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}
		
		
		//QuestionVO.setphone(UserVO.getphone());  // 문의하기 
		//phone = QuestionVO.getphone();
		log.debug( "들어온다 ");
		
		mv.addObject("ask", questionService.selectAsk());
		//log.debug("나온다. "+ ask.toString());
		
		mv.setViewName("question");
		
		return mv;
	}
	
	//문의하기  글쓰기 페이지 이동 
	@RequestMapping(value = "/doAsk", method = RequestMethod.GET)
	public ModelAndView pageDoAsk(ModelAndView mv,HttpSession session) {
		
		//로그인 여부 
//		Member member = (Member) session.getAttribute("loginInfo");
//		if (member != null) {
//			String email = member.getEmail();
//			mv.addObject("alarm",alarmservice.countAlarm(email));
//			}
		
		mv.setViewName("doAsk");
		return mv;
	}
	
	@PostMapping("/doAsk")
	public ModelAndView insertDoAsk(
			ModelAndView mv
			, HttpSession session
			, HttpServletRequest req
//			,HttpServletResponse response
			, QuestionVO ask,
			RedirectAttributes rttr
			) throws UnsupportedEncodingException {

//		Member member = (Member) session.getAttribute("loginInfo");
//
//		if (member == null) {
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}
//		response.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=UTF-8");

//		req.setCharacterEncoding("UTF-8");
		ask.setPhone("01014141411"); //  임시 아이디 
		
		System.out.println( "QuestionController ask "+   ask);
		int result = questionService.insertAsk(ask);

		if (result == 0) {
			rttr.addFlashAttribute("msg", "글 등록에 실패하였습니다.");
			mv.setViewName("/question");
			return mv;
		} 

			mv.setViewName("redirect:/question");
			return mv;
	}
//	
//	@PostMapping("/deleteAsk.do")
//	public ModelAndView deleteAsk(ModelAndView mv, HttpSession session, int ask_no,
//			RedirectAttributes rttr) {
//
//		Member member = (Member) session.getAttribute("loginInfo");
//
//		if (member == null) {
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}
//
//		mv.addObject("deleteAsk",service.deleteAsk(ask_no));
//		mv.addObject("deleteAsk",ansservice.deleteAns(ask_no));
//
//		mv.setViewName("redirect:/customerCenter/ask");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/road", method = RequestMethod.GET)
//	public ModelAndView pageRoad(ModelAndView mv, HttpSession session) {
//		Member member = (Member) session.getAttribute("loginInfo");
//		if (member != null) {
//		String email = member.getEmail();
//		mv.addObject("alarm",alarmservice.countAlarm(email));
//		}
//		mv.setViewName("customerCenter/road");
//		return mv;		
//	}
	
}
