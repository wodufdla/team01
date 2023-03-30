package com.itkey.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KakaoVO {

	private Long kakaoId;
	private String nickname;
	private String account_email;
	private String gender;
	private String age_range;
	private String birthday;
	
}
