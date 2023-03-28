package com.itkey.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.service.OrderService;
import com.itkey.service.PaymentService;
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
}
