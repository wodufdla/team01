package com.itkey.controller;



import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.itkey.service.QuestionService;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;


@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "/question", produces = "text/plain; charset=UTF-8")
	public String selectQuestion(Model model
			, @RequestParam Map<String, Object> reqMap
			, HttpSession session
			, QuestionVO ask
			) {
		log.info("question List Page Response_GET() 호출");// Logger
		log.info("1대1문의 페이지  data : " + reqMap);
	
		String phone = (String) session.getAttribute("phone");
		// 회원 로그Phone인 상태 확인
		ask.setPhone(phone);
		
		log.info("* [CONTROLLER] Input �뼳 (Service) : " + ask);
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("criteria", criteria);*/
		
		List<QuestionVO> oList = questionService.selectAsk(phone);// 유저 문의글 조회
		
		model.addAttribute("ask", oList);
		return "question";// jsp 화면이름
	}

	// 문의하기 글쓰기 페이지 이동
	@RequestMapping(value = "/doAskView", method = RequestMethod.GET)
	public ModelAndView pageDoAsk(ModelAndView mv, HttpSession session) {
		log.info("doAsk Page_GET() 호출");
		// 로그인 여부
		mv.setViewName("doAsk");// jsp 화면이름
		return mv;
	}

	// 문의하기 글쓰기 insert
	@ResponseBody
	@RequestMapping(value = "/doAsk", produces = "text/plain; charset=UTF-8")
	public String insertDoAsk(@RequestParam Map<String, Object> reqMap, QuestionVO ask) {
		log.info("문의하기  ajax data : " + reqMap);

		ask.setAsktitle((String) reqMap.get("asktitle"));
		ask.setAskcontent((String) reqMap.get("askcontent"));
		ask.setAskcategory((String) reqMap.get("askcategory"));
		ask.setPhone((String) reqMap.get("phone"));

		log.info("* insertAsk [CONTROLLER] input �뼳 (Service) : ");
		int result = questionService.insertAsk(ask);
		log.info("* insertAsk [CONTROLLER] out �뼳 (Service) : " + result);

		if (result == 1) {
			return "success";
		} else {
			return "FAIL";
		}
	}

	// 문의하기 삭제 하기
	@PostMapping("/deleteAsk")
	public ModelAndView deleteAsk(ModelAndView mv, HttpSession session, int askno, RedirectAttributes rttr) {

		mv.addObject("deleteAsk", questionService.deleteAsk(askno));
		mv.addObject("deleteAsk", questionService.deleteAns(askno));

		mv.setViewName("redirect:/question");
		return mv;
	}
	
	//관리자 리스트 목록 
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public ModelAndView selectAsk(ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			
			) {
	
		
		mv.addObject("ask_Y", questionService.selectAskY());
		mv.addObject("ask_N", questionService.selectAskN());
		mv.setViewName("askManagement"); 
		
		return mv;
	}
   
	@GetMapping("/answer/{askno}")
	public ModelAndView selectAsk2(ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			,@PathVariable("askno") int askno
			) {

		log.info("/answer/{askno}: " + askno);
		
		mv.addObject("ask", questionService.selectAsk2(askno));
		mv.setViewName("answer");
		return mv;
	}

	//답변 하기
	@PostMapping("/answer")
	public ModelAndView insertAns(ModelAndView mv
			, HttpSession session
			, HttpServletRequest req
			, AnswerVo ans
			, @RequestParam(name ="askno", defaultValue = "0") int askno
			,RedirectAttributes rttr
			) {
		log.info("##########################");
		log.info("@RequestParam DATA: " + askno);
		log.info("ans DATA: " + ans);

        mv.addObject("insertAns", questionService.insertAns(ans));
		mv.addObject("updateAsk", questionService.updateAsk(askno));
		mv.setViewName("redirect:/ask");
		return mv;
	}
	
}
