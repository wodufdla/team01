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
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
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
import com.itkey.service.UserService;
import com.itkey.util.MainInfo;
import com.itkey.vo.OrderVO;
import com.itkey.vo.UserVO;

@EnableScheduling
@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	/*
	 * @Setter(onMethod_ = @Autowired) private ImportPay pay;
	 */

	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;

	// 정기결제
	@ResponseBody
	@PostMapping(value = "/order", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> orderInsert(@RequestBody Map<String, Object> map) throws Exception {

		log.info("orderInsert data : " + map);
		OrderVO odVo = new OrderVO();

		if (ObjectUtils.isEmpty(map)) {
			String token = orderService.getToken();
			return new ResponseEntity<String>(token, HttpStatus.BAD_REQUEST);
		}
		String phone = map.get("phone").toString(); // 회원id
		String amount = map.get("amount").toString(); // 결제 금액
		String merchantUid = map.get("merchantUid").toString(); // 주문번호
		String billingKey = map.get("customer_uid").toString(); // billingKey 결제건마다 고유번호
		String buyerName = map.get("buyerName").toString(); // 닉네임
		int rqstPeriod = (int) Double.parseDouble(map.get("rqstPeriod").toString()) + 0; // 실수로 변환 후, 정수로 캐스팅, 그리고 1을
																							// 더하기

		odVo.setPhone(phone);
		odVo.setAmount(amount);
		odVo.setMerchantUid(merchantUid);
		odVo.setBillingKey(billingKey);
		odVo.setBuyerName(buyerName);
		odVo.setPrice(amount);
		odVo.setRqstPeriod(rqstPeriod);
		// db에 저장

		// 정기결제 부분 성공 후 테이블 저장
		log.info("* [CONTROLLER] Input �뼳 (Service) : " + odVo.toString());
		int result = orderService.insertPayment(odVo);
		log.info("* [CONTROLLER] output �뼳 (Service) : " + result);

		// 유저 회원 서비스 가입 YN 처리
		UserVO uv = new UserVO();
		uv.setPhone(phone);
		log.info("* [CONTROLLER] Input (Service) : " + uv.toString());
		int userServiceynY = userService.userServiceynY(uv);
		log.debug("* [CONTROLLER] output  (Service) : " + userServiceynY);

		System.out.println("DB저장결과 : " + result);
		String result2 = String.valueOf(result);

		String token = orderService.getToken();
		System.out.println("/token : " + token);
		return new ResponseEntity<String>(token, HttpStatus.OK);
	}

	// payment insert ( payment 테이블 삭제됨)
	@RequestMapping(value = "/paymentOk", method = RequestMethod.POST)
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

		System.out.println("DB저장결과 : " + result);
		String result2 = String.valueOf(result);

		return result2;
	}

	@RequestMapping(value = "/payRegister", method = RequestMethod.POST)
	@ResponseBody
	public String payRegister(@RequestParam("amount") String amount, @RequestParam("membershipKey") String merchantUid,
			@RequestParam("buyerName") String buyerName) {

		// 실질적인 결제 및 정액제 유료회원 처리

		int result = 1;

		System.out.println("실질적인 결제 및 정액제 유료회원 처리 : " + result);

		String result2 = String.valueOf(result);

		return result2;
	}

	@RequestMapping(value = "/payRegisterOk", method = RequestMethod.GET)
	public ModelAndView payRegisterOk(ModelAndView mv) {

		mv.setViewName("payRegisterOk");

		return mv;
	}

	// 관리자_매출관리 페이지 화면
	@GetMapping("/product")
	public void productGET(Model model, HttpSession session) {
		// 매출관리
		log.info("productGET() 호출");
		MainInfo mInfo = new MainInfo();
		String today = mInfo.curDate();
		String thisMonth = mInfo.curMonth();

		PageCriteria criteria = new PageCriteria();
		/*
		 * if (keyword != null) { criteria.setKeyword(keyword);
		 * criteria.setCategory(category); } if(page != null) { criteria.setPage(page);
		 * }
		 * 
		 * if(numsPerPage != null) { criteria.setNumsPerPage(numsPerPage); }
		 */

		List<OrderVO> list = orderService.read_list(criteria);
		model.addAttribute("list", list);

		// 서비스 유지중
		Integer statusY = orderService.select_y();
		if (statusY == null) {
			statusY = 0;
		}
		model.addAttribute("statusY", statusY);

		// 누적 매출액
		Integer total = orderService.totalSales();
		if (total == null) {
			total = 0;
		}
		model.addAttribute("totalSales", total);

		// 월 매출액
		Integer totalMonths = orderService.totalMonths(thisMonth);
		if (totalMonths == null) {
			totalMonths = 0;
		}
		model.addAttribute("totalMonths", totalMonths);

		// 오늘자 매출액
		Integer totalToday = orderService.todaySSales(today);
		if (totalToday == null) {
			totalToday = 0;
		}
		model.addAttribute("totalToday", totalToday);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(orderService.totalCounts(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}

	// @Scheduled(cron="10 * * * * *")
	// public void test() {
	// System.out.println("스케줄러");
	// List<Map<String,Object>> map = new ArrayList<Map<String, Object>>();
	//
	// //결제 대상과 그 대상의 customer_uid 값 db에서 불러오기
	//
	//
	// //주문 번호 새로 생성
	// int random = (int) (Math.floor(Math.random() * 10000) + 1);
	// String merchantUid = "mUID" + new Date().getTime() + random;
	//
	// // 실질적으로 customer_uid 값을 보내 카드 정보를 가져오는 곳
	// orderService.regularPay(merchantUid);
	// }

	// 매일 오전 10시 체크 @Scheduled(cron = "10 * * * * *") 매분 10초마다
	// @Scheduled(cron = "0 0 10 * * *") // 매일 오전 10시
	// @Scheduled(cron = "10 * * * * *")
	public void run() throws Exception {

		String token = orderService.getToken();
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
