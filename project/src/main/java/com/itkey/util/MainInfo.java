package com.itkey.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MainInfo {
	
	public String curDate() {

		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now();
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		return date;
	}
	
	public String curMonth() {

		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now();
		String month = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
		return month;
	}

}
