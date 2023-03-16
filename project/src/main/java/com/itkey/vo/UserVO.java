package com.itkey.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	// 회원관리
	private String password;
	private String email;
	private String phone;
	private Date joinDate;
	private String withdrawal;
	private String nickname;
	
}
