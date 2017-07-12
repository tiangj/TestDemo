package com.jfinal.mybatis.bean;

import java.io.Serializable;

public class PaginationBean implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int pageNum = 1;
	private int pageSize = 25;
	private int pages;
	private long total;

	public PaginationBean() {
	}

	public PaginationBean(int pageNum, int pageSize, long total) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.pages = (int) (total/pageSize+(total%pageSize>0 ? 1 : 0));
		this.total = total;
	}

	public PaginationBean(int pageNum, int pageSize, int pages, long total) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.pages = pages;
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
}
