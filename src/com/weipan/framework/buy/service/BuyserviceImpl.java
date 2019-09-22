package com.weipan.framework.buy.service;

import java.util.List;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.buy.dao.BuyDao;
import com.weipan.framework.buy.dao.BuyDaoImpl;
import com.weipan.framework.buy.vo.BuyType;

public class BuyserviceImpl implements Buyservice{
	private BuyDao buyDao=new BuyDaoImpl();
	@Override
	public List<BuyType> list(Integer userId) {
		return this.buyDao.list(userId);
	}

	@Override
	public void add(BuyType bt) {
		try {
			this.buyDao.add(bt);;
		} catch (Exception e) {
			e.printStackTrace();
		    throw new ServiceException("购买失败");
		}
	}

	@Override
	public boolean isVip(Integer userId) {
		if(buyDao.isVip(userId)>0) {
			return false;
		}
		return true;
	}

}
