package com.jfinal.mybatis.bean;

import java.io.Serializable;
import java.util.List;

/**
 * 分页数据对象
 * @author mengxin 2015/07/14
 *
 */
public class PagerData<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5543990619678663131L;

	private PaginationBean pager;
	
	private List<T> pageList;
	
	public PagerData() {
	}
	
	public PagerData(PaginationBean pager, List<T> pageList) {
		this.pager = pager;
		this.pageList = pageList;
	}

	public PaginationBean getPager() {
		return pager;
	}

	public void setPager(PaginationBean pager) {
		this.pager = pager;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}
	
}
