package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class UserVO {

	// 회원관리
	private String password;
	private String email;
	private String phone;
	private Date joinDate;
	private boolean withdrawal;
		
	
}
