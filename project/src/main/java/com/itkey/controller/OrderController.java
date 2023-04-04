package com.itkey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.pageutil.PageCriteria;
import com.itkey.pageutil.PageMaker;
import com.itkey.service.OrderService;

import com.itkey.util.MainInfo;
import com.itkey.vo.OrderVO;


@EnableScheduling
@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
/*	@Setter(onMethod_ = @Autowired)
	private ImportPay pay;*/
	
	@Autowired
	private OrderService orderService;

	
	  
	@RequestMapping(value="/paymentOk", method=RequestMethod.POST)
	@ResponseBody
	public String paymentOk(@RequestBody HashMap<String, Object> param) throws Exception {
		
		
		log.info("paymentOk data : " + param);
		
		OrderVO odVo = new OrderVO();
		String amount = param.get("amount").toString();
		String merchantUid = param.get("customer_uid").toString();
		String buyerName = param.get("buyerName").toString();
		odVo.setAmount(amount);
		odVo.setMerchantUid(merchantUid);
		odVo.setBuyerName(buyerName);
		// db에 저장
		
		log.info("* [CONTROLLER] Input �뼳 (Service) : " + odVo.toString());
		int result = orderService.insertPayment(odVo);
		log.debug("* [CONTROLLER] output �뼳 (Service) : " + result);
		
		/*
		 * PaymentVO pmVO = new PaymentVO();
		String amount = param.get("amount").toString();
		String merchantUid = param.get("customer_uid").toString();
		String buyerName = param.get("buyerName").toString();
		
		pmVO.setAmount(amount);
		pmVO.setMerchantUid(merchantUid);
		pmVO.setBuyerName(buyerName);
		
		// db에 저장
		int result = paymentService.insertPayment(odVo);*/
		
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
	
	//관리자_매출관리 페이지 화면 
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
	
    
	//
	@ResponseBody
	@PostMapping(value="/order", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> orderInsert(@RequestBody Map<String, Object> map) throws Exception{
		
		log.info("orderInsert data : " + map);
		OrderVO odVo = new OrderVO();
		
		String phone = map.get("phone").toString();
		String amount = map.get("amount").toString();
		String merchantUid = map.get("merchantUid").toString();
		String billingKey = map.get("customer_uid").toString();
		String buyerName = map.get("buyerName").toString();
		
		odVo.setPhone(phone);
		odVo.setAmount(amount);
		odVo.setMerchantUid(merchantUid);
		odVo.setBillingKey(billingKey);
		odVo.setBuyerName(buyerName);
		odVo.setPrice(amount);
		
		
		// db에 저장
		
		log.info("* [CONTROLLER] Input �뼳 (Service) : " + odVo.toString());
		int result = orderService.insertPayment(odVo);
		log.info("* [CONTROLLER] output �뼳 (Service) : " + result);
		
		
	/*	PaymentVO pmVO = new PaymentVO();
		String amount = map.get("amount").toString();
		String billing_key = map.get("merchantUid").toString();
		String buyerName = map.get("buyerName").toString();
		pmVO.setAmount(amount);
		pmVO.setMerchantUid(billing_key);
		pmVO.setBuyerName(buyerName);
		
		System.out.println("amount :" + amount);
		System.out.println("merchantUid :" + billing_key);
		System.out.println("buyerName :" + buyerName);
		
		// db에 저장
		int result = paymentService.insertPayment(pmVO);*/
		
		System.out.println("DB저장결과 : " + result);
		String result2 = String.valueOf(result);
		
//		 	System.out.println("/order : "  + map);
//		 	
//				Map<String, Object> param = new HashMap<String, Object>();
//				String id = (String)map.get("id");
//				String cuid = "c_" + id;
//				param.put("id", id);
//				param.put("cuid", cuid);
//		
		 String token =  orderService.getToken();
		 System.out.println("/token : "  + token);
		 return new ResponseEntity<String>(token, HttpStatus.OK);
	}
	

	
	
//	@Scheduled(cron="10 * * * * *")
//	public void test() {
//		System.out.println("스케줄러");
//		List<Map<String,Object>> map = new ArrayList<Map<String, Object>>();
//		
//		//결제 대상과 그 대상의 customer_uid 값 db에서 불러오기
//		
//		
//		//주문 번호 새로 생성
//		int random = (int) (Math.floor(Math.random() * 10000) + 1);
//        String merchantUid = "mUID" + new Date().getTime() + random;
//        
//        // 실질적으로 customer_uid 값을 보내 카드 정보를 가져오는 곳
//        orderService.regularPay(merchantUid);
//	}
	
	// 매일 오전 10시 체크 @Scheduled(cron = "10 * * * * *") 매분 10초마다
		//@Scheduled(cron = "0 0 10 * * *") // 매일 오전 10시
//	@Scheduled(cron = "10 * * * * *") 
		public void run() throws Exception {
			
			String token =  orderService.getToken();
			String id = "ffs_test";
			String cUid = "c_2ffs_test"; // db가져오고 customeruid
			String phone = "01092726751";
			
			Map<String, Object> param = new HashMap<>();
			
				 param.put("token", token);
				 param.put("id", id);	
				 param.put("phone", phone);	
				 param.put("cuid", cUid);	
				 
				 orderService.bilingCredit(param);

			 
		}
}
