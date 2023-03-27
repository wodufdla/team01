package com.itkey.pageutil;

public class PageCriteria {
	private int page;
	private int numsPerPage;
	private String keyword;
	private String category;
	
	public PageCriteria() {
		this.page = 1;
		this.numsPerPage = 10;
	}
	
	public PageCriteria(int page, int numsPerPage) {
		this.page = page;
		this.numsPerPage = numsPerPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getNumsPerPage() {
		return numsPerPage;
	}

	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}
	
	public int getStart() {
		return (this.page - 1) * this.numsPerPage;
	}
	
	public int getEnd() {
		return this.numsPerPage;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
}
