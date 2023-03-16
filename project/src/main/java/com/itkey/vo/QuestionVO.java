package com.itkey.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class QuestionVO {

	// 1:1문의
	
	private int askno;           // 문의번호 
	private String phone;         // 회원id
	private String asktitle;     // 문의제목
	private String askcategory;  // 문의카테고리
	private String askcontent;   // 문의내용
	private String anscontent;   // 문의답변내용
	private String askdate;      // 문의작성일자
	private String replyyn;      // 문의답변여부
	public int getAskno() {
		return askno;
	}
	public void setAskno(int askno) {
		this.askno = askno;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAsktitle() {
		return asktitle;
	}
	public void setAsktitle(String asktitle) {
		this.asktitle = asktitle;
	}
	public String getAskcategory() {
		return askcategory;
	}
	public void setAskcategory(String askcategory) {
		this.askcategory = askcategory;
	}
	public String getAskcontent() {
		return askcontent;
	}
	public void setAskcontent(String askcontent) {
		this.askcontent = askcontent;
	}
	public String getAnscontent() {
		return anscontent;
	}
	public void setAnscontent(String anscontent) {
		this.anscontent = anscontent;
	}
	public String getAskdate() {
		return askdate;
	}
	public void setAskdate(String askdate) {
		this.askdate = askdate;
	}
	public String getReplyyn() {
		return replyyn;
	}
	public void setReplyyn(String replyyn) {
		this.replyyn = replyyn;
	}
	@Override
	public String toString() {
		return "QuestionVO [askno=" + askno + ", phone=" + phone + ", asktitle=" + asktitle + ", askcategory="
				+ askcategory + ", askcontent=" + askcontent + ", anscontent=" + anscontent + ", askdate=" + askdate
				+ ", replyyn=" + replyyn + "]";
	}
	
	
}
