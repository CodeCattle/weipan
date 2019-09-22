package com.weipan.framework.buy.service;

import java.util.List;

import com.weipan.framework.buy.vo.BuyType;

public interface Buyservice {
	List<BuyType> list(Integer userId);
	void add(BuyType bt);
	boolean isVip(Integer userId);
}
