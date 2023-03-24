package com.itkey.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "event";
	}
		
	@RequestMapping("/order")
	public String order(Model model) {
		return "order";
	}
	
	@RequestMapping("/service")
	public String service(Model model) {
		return "common/service";
	}
	
	@RequestMapping("/privacy")
	public String privacy(Model model) {
		return "common/privacy";
	}
    
    @RequestMapping("/serviceInfo")
    public String serviceInfo(Model model) {
        return "serviceInfo";
    }
    
    @RequestMapping("/faq")
    public String faq(Model model) {
        return "faq";
    }
    
    @RequestMapping("/event")
    public String event(Model model) {
    	return "event";
    }
    
    @RequestMapping("/eventJoin")
    public String eventJoin(Model model) {
    	return "eventJoin";
    }
}
