package com.itkey.controller;

import java.util.HashMap;
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

//import com.google.gson.Gson;
import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.QuestionService;
import com.itkey.vo.AnswerVo;
import com.itkey.vo.QuestionVO;

@Controller
public class QuestionController {
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "/question", produces = "text/plain; charset=UTF-8")
	public String selectQuestion(Model model, HttpSession session, Integer page, Integer numsPerPage) {
		log.info("question List Page Response_GET() 호출");// Logger
		log.info("1대1문의 페이지  data : ");

		String phone = (String) session.getAttribute("phone");
		// 회원 로그Phone인 상태 확인
		PageCriteria criteria = new PageCriteria();
		criteria.setKeyword(phone); // 회원id criteria 객체 set

		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		List<QuestionVO> oList = questionService.selectAsk(criteria);// 유저 문의글 조회

		model.addAttribute("ask", oList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(questionService.selectAsktotalCount(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);

		return "question";
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
	public String insertDoAsk(@RequestParam Map<String, Object> reqMap) {
		log.info("문의하기  ajax data : " + reqMap);

		QuestionVO ask = new QuestionVO();

		ask.setAskTitle((String) reqMap.get("askTitle"));
		ask.setAskContent((String) reqMap.get("askContent"));
		ask.setAskCategory((String) reqMap.get("askCategory"));
		ask.setPhone((String) reqMap.get("phone"));

		log.info("문의하기  ask data : " + ask);

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
	public ModelAndView deleteAsk(ModelAndView mv, HttpSession session, int askNo, RedirectAttributes rttr) {

		mv.addObject("deleteAsk", questionService.deleteAsk(askNo));
		mv.addObject("deleteAsk", questionService.deleteAns(askNo));

		mv.setViewName("redirect:/question");
		return mv;
	}

	// 관리자 _문의하기 전체
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public ModelAndView selectAsk(ModelAndView mv, HttpSession session, RedirectAttributes rttr, String keyword,
			String category, Integer page, Integer numsPerPage

	) {
		log.info("ask GET() 호출");
		log.info("" + page);
		log.info("" + numsPerPage);
		log.info(category);
		log.info(keyword);
		PageCriteria criteria = new PageCriteria();
		if (keyword != null) {
			criteria.setKeyword(keyword);
			criteria.setCategory(category);
		}
		if (page != null) {
			criteria.setPage(page);
		}

		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		List<QuestionVO> List = questionService.selectAskList(criteria);
		mv.addObject("ask", List);

		int askTotalCount = questionService.selectAskListtotalCount(criteria);
		int askYTotalCount = questionService.selectAskYtotalCount(criteria);
		int askNTotalCount = questionService.selectAskNtotalCount(criteria);
		int askTodayCount = questionService.askTodayCount();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(questionService.selectAskListtotalCount(criteria));
		pageMaker.setPageData();
		mv.addObject("pageMaker", pageMaker);

		mv.addObject("askTotalCount", askTotalCount);
		mv.addObject("askYTotalCount", askYTotalCount);
		mv.addObject("askNTotalCount", askNTotalCount);
		mv.addObject("askTodayCount", askTodayCount);
		mv.setViewName("askManagement");

		return mv;
	}

	@RequestMapping(value = "/askY", method = RequestMethod.GET)
	public ModelAndView selectAskY(ModelAndView mv, HttpSession session, RedirectAttributes rttr, String keyword,
			String category, Integer page, Integer numsPerPage

	) {
		log.info("ask GET() 호출");
		log.info("" + page);
		log.info("" + numsPerPage);
		log.info(category);
		log.info(keyword);
		PageCriteria criteria = new PageCriteria();
		if (keyword != null) {
			criteria.setKeyword(keyword);
			criteria.setCategory(category);
		}
		if (page != null) {
			criteria.setPage(page);
		}

		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		List<QuestionVO> List = questionService.selectAskY(criteria);// 유저 문의글 조회
		mv.addObject("ask_Y", List);

		int askTotalCount = questionService.selectAskListtotalCount(criteria);
		int askYTotalCount = questionService.selectAskYtotalCount(criteria);
		int askNTotalCount = questionService.selectAskNtotalCount(criteria);
		int askTodayCount = questionService.askTodayCount();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(questionService.selectAskYtotalCount(criteria));
		pageMaker.setPageData();
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("askY");

		mv.addObject("askTotalCount", askTotalCount);
		mv.addObject("askYTotalCount", askYTotalCount);
		mv.addObject("askNTotalCount", askNTotalCount);
		mv.addObject("askTodayCount", askTodayCount);
		return mv;
	}

	// 관리자 _문의하기 미응답 목록
	@RequestMapping(value = "/askN", method = RequestMethod.GET)
	public ModelAndView selectAskN(ModelAndView mv, HttpSession session, RedirectAttributes rttr, String keyword,
			String category, Integer page, Integer numsPerPage

	) {
		log.info("ask GET() 호출");
		log.info("" + page);
		log.info("" + numsPerPage);
		log.info(category);
		log.info(keyword);
		PageCriteria criteria = new PageCriteria();
		if (keyword != null) {
			criteria.setKeyword(keyword);
			criteria.setCategory(category);
		}
		if (page != null) {
			criteria.setPage(page);
		}

		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		List<QuestionVO> List = questionService.selectAskN(criteria);
		mv.addObject("ask_N", List);

		int askTotalCount = questionService.selectAskListtotalCount(criteria);
		int askYTotalCount = questionService.selectAskYtotalCount(criteria);
		int askNTotalCount = questionService.selectAskNtotalCount(criteria);
		int askTodayCount = questionService.askTodayCount();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(questionService.selectAskNtotalCount(criteria));
		pageMaker.setPageData();
		mv.addObject("pageMaker", pageMaker);

		mv.addObject("askTotalCount", askTotalCount);
		mv.addObject("askYTotalCount", askYTotalCount);
		mv.addObject("askNTotalCount", askNTotalCount);
		mv.addObject("askTodayCount", askTodayCount);
		mv.setViewName("askN");

		return mv;
	}
     //답변하기 화면 
	@GetMapping("/answer/{askNo}")
	public ModelAndView selectAsk2(ModelAndView mv, HttpSession session, RedirectAttributes rttr,
			@PathVariable("askNo") int askNo) {

		log.info("/answer/{askNo}: " + askNo);

		mv.addObject("ask", questionService.selectAsk2(askNo));
		mv.setViewName("answer");
		return mv;
	}
     // 답변수정화면 
	@GetMapping("/ansUpdateView/{askNo}")
	public ModelAndView ansUpdateSelect(ModelAndView mv
			, HttpSession session
			, RedirectAttributes rttr
			,@PathVariable("askNo") int askNo
			) {
	
		log.info("/answer/{askNo}: " + askNo);
		
		
		
		mv.addObject("ask", questionService.ansUpdateSelect(askNo));
		mv.setViewName("ansUpdate");
		return mv;
	}

	// 답변 하기
	@PostMapping("/answer")
	public ModelAndView insertAns(ModelAndView mv, HttpSession session, HttpServletRequest req
			,@RequestParam Map<String, Object> reqMap, RedirectAttributes rttr) {
		log.info("##########################");
		log.info("@RequestParam DATA: " + reqMap);

	
		AnswerVo ans = new AnswerVo();
		
		String content = (String) reqMap.get("ansContent");
		ans.setAnsContent(content);
		ans.setAskNo(Integer.parseInt((String)reqMap.get("askNo")));
		Integer askNo = Integer.parseInt((String)reqMap.get("askNo"));
		
		log.info(" AnswerVo ans: " + ans);
		
		mv.addObject("insertAns", questionService.insertAns(ans));
		mv.addObject("updateAsk", questionService.updateAsk(askNo));
		mv.setViewName("redirect:/ask");
		return mv;
	}

	// 답변수정
	@PostMapping("/ansUpdate")
	public ModelAndView ansUpdate(ModelAndView mv, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, Object> reqMap, RedirectAttributes rttr) {
		log.info("##########################");
		log.info("@RequestParam DATA: " + reqMap);

		AnswerVo ans = new AnswerVo();
		
		String content = (String) reqMap.get("ansContent");
		ans.setAnsContent(content);
		ans.setAskNo(Integer.parseInt((String)reqMap.get("askNo")));


		
		mv.addObject("ansUpdate", questionService.ansUpdate(ans));
		// mv.addObject("updateAsk", questionService.updateAsk(askNo));
		mv.setViewName("redirect:/ask");
		return mv;
	}

	// 결제 화면
	@RequestMapping(value = "/sunPay", method = RequestMethod.GET)
	public ModelAndView sunPay(ModelAndView mv, HttpSession session) {
		log.info("sunPay Page_GET() 호출");
		// 로그인 여부
		mv.setViewName("sunPay");// jsp 화면이름
		return mv;
	}

	// 결제 콜백
	// @RequestMapping(value="/paidOk", method=RequestMethod.POST)
	// @ResponseBody
	// public String paidOk(ModelAndView mv
	// , HttpSession session
	// , @RequestParam Map<String, Object> map
	// , RedirectAttributes rttr) {
	//
	// log.info("requestData : " + map.get("json"));
	//
	//
	// Gson gson = new Gson();
	// Map<String,Object> gsonMap = new HashMap<String,Object>();
	// gsonMap = (Map<String,Object>) gson.fromJson(map.get("json").toString(),
	// map.getClass());
	// //gsonMap : {success=true, imp_uid=imp_212505519038, pay_method=card,
	// merchant_uid=57008833-33009, name=당근 10kg, paid_amount=1.0, currency=KRW,
	// pg_provider=kicc, pg_type=payment, pg_tid=23032619114510254706,
	// apply_num=00122877, buyer_name=포트원 기술지원팀, buyer_email=Iamport@chai.finance,
	// buyer_tel=010-1234-5678, buyer_addr=서울특별시 강남구 삼성동, buyer_postcode=123-456,
	// custom_data=null, status=paid, paid_at=1.679825535E9,
	// receipt_url=http://testoffice.easypay.co.kr/receipt/ReceiptBranch.jsp?controlNo=23032619114510254706&payment=01,
	// card_name=해외마스터카드, bank_name=null, card_quota=0.0,
	// card_number=4033020051344407}
	// //gsonMap 테이블에 넣어주면 된다.
	//
	// log.info("gsonMap : " + gsonMap.toString());
	// //log.info("reqMap : " + reqMap.get("success"));
	// // 데이터 테이블에 insert >> 주문내역 페이지로 이동
	//
	// return "1";
	// }

}
