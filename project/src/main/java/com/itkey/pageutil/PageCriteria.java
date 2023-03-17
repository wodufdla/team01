package com.itkey.pageutil;

public class PageCriteria {
	private int page;
	private int numsPerPage;
	
	public PageCriteria() {
		this.page = 1;
		this.numsPerPage = 3;
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
	
	
}
