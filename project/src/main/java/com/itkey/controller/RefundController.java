package com.itkey.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itkey.service.RefundService;

@Controller
public class RefundController {
	private static final Logger log = LoggerFactory.getLogger(RefundController.class);

	@Autowired
	private RefundService refundService;

}
