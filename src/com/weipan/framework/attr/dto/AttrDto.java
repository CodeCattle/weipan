package com.weipan.framework.attr.dto;

import java.util.ArrayList;
import java.util.List;

import com.weipan.framework.attr.vo.AttrFile;

public class AttrDto {
	private Integer dir_id;
	private Integer user_id;
	private List<AttrFile> list;
	
	public AttrDto() {
		list=new ArrayList<AttrFile>();
	}
	public Integer getDir_id() {
		return dir_id;
	}
	public void setDir_id(Integer dir_id) {
		this.dir_id = dir_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public List<AttrFile> getList() {
		return list;
	}
	public void setList(List<AttrFile> list) {
		this.list = list;
	}
	
}
