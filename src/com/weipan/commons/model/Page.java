package com.weipan.commons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page {
	private int  pageNow=1;
	private int pageSize=2;
	private int offset;//limit中第一个偏移量
	private int totalCount;
	private int totalPages;
	private List<?> datas;
	private Map<String,String> query;
	
	public Page() {
		query=new HashMap<String, String>();
	}
	public int getOffset() {
		return (pageNow-1)*pageSize;
	}
	public int getTotalPages() {
		boolean flag=totalCount%pageSize==0;
		int num=totalCount/pageSize;
		return flag?num:num+1;
	}
	public Map<String, String> getQuery() {
		return query;
	}

	public void setQuery(Map<String, String> query) {
		this.query = query;
	}

	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public List<?> getDatas() {
		return datas;
	}
	public void setDatas(List<?> datas) {
		this.datas = datas;
	}
}
