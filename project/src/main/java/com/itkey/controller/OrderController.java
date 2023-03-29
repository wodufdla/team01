package com.itkey.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.OrderService;
import com.itkey.service.PaymentService;
import com.itkey.util.MainInfo;
import com.itkey.vo.OrderVO;
import com.itkey.vo.PaymentVO;


@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
/*	@Setter(onMethod_ = @Autowired)
	private ImportPay pay;*/
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/paymentOk", method=RequestMethod.POST)
	@ResponseBody
	public String paymentOk(
			@RequestParam("amount") String amount
			, @RequestParam("membershipKey") String merchantUid
			, @RequestParam("buyerName") String buyerName
			) throws Exception {
		PaymentVO pmVO = new PaymentVO();
		pmVO.setAmount(amount);
		pmVO.setMerchantUid(merchantUid);
		pmVO.setBuyerName(buyerName);
		
		System.out.println("amount :" + amount);
		System.out.println("merchantUid :" + merchantUid);
		System.out.println("buyerName :" + buyerName);
		
		// db에 저장
		int result = paymentService.insertPayment(pmVO);
		
		System.out.println("DB저장결과 : " + result);
		String result2=String.valueOf(result);
		
		return result2;
	}
	
	@RequestMapping(value="/payRegister", method=RequestMethod.POST)
	@ResponseBody
	public String payRegister(@RequestParam("amount") String amount
			, @RequestParam("membershipKey") String merchantUid
			, @RequestParam("buyerName") String buyerName) {
		
		// 실질적인 결제 및 정액제 유료회원 처리
		
		int result = 1;
		
		System.out.println("실질적인 결제 및 정액제 유료회원 처리 : " + result);
		
		String result2=String.valueOf(result);
		
		return result2;
	}
	
	@RequestMapping(value="/payRegisterOk", method=RequestMethod.GET)
	public ModelAndView payRegisterOk(ModelAndView mv) {
		
		mv.setViewName("payRegisterOk");
		
		return mv;
	}
	
	@GetMapping("/product")
	public void productGET(Model model, HttpSession session) {
		// 매출관리
		log.info("productGET() 호출");
		MainInfo mInfo = new MainInfo();
		String today = mInfo.curDate();
		String thisMonth = mInfo.curMonth();
		
		PageCriteria criteria = new PageCriteria();
		/*
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
		*/
		
		List<OrderVO> list = orderService.read_list(criteria);
		model.addAttribute("list", list);
		
		// 서비스 유지중
		Integer statusY = orderService.select_y();
		if (statusY==null) {
			statusY=0;
		}
		model.addAttribute("statusY", statusY);
		
		// 누적 매출액
		Integer total = orderService.totalSales();
		if (total==null) {
			total=0;
		}
		model.addAttribute("totalSales", total);
		
		// 월 매출액
		Integer totalMonths = orderService.totalMonths(thisMonth);
		if (totalMonths==null) {
			totalMonths=0;
		}
		model.addAttribute("totalMonths", totalMonths);
		
		// 오늘자 매출액
		Integer totalToday = orderService.todaySSales(today);
		if (totalToday==null) {
			totalToday=0;
		}
		model.addAttribute("totalToday", totalToday);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(orderService.totalCounts(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
}
