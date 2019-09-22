package com.weipan.framework.tip.dao;


public interface TipDao {
	void isOverdue(Integer userId);
	
	void updateUserType(Integer userId,Integer  type);
	
	void add(Integer userId ,String content);
	
	int getTipCount(Integer userId);
}
