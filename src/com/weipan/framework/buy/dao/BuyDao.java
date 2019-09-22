package com.weipan.framework.buy.dao;

import java.util.List;

import com.weipan.framework.buy.vo.BuyType;

public interface BuyDao {
	List<BuyType> list(Integer userId);
	void add(BuyType bt);
	
	int isVip(Integer userId);
}
