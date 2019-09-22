package com.weipan.framework.tip.service;

import java.util.HashMap;
import java.util.Map;

import com.weipan.framework.tip.dao.TipDao;
import com.weipan.framework.tip.dao.TipDaoImpl;
import com.weipan.framework.userInfo.dao.UserDao;
import com.weipan.framework.userInfo.dao.UserDaoImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

public class TipServiceImpl implements TipService {
	private TipDao tipDao=new TipDaoImpl();
	private UserDao userDao=new UserDaoImpl(); 

	@Override
	public Map<String, Object> tip(Integer userId) {
		Map<String, Object> map=new HashMap<String, Object>();
		int count=tipDao.getTipCount(userId);
		if(count<0) {
			this.tipDao.updateUserType(userId, -999);
		}else {
			int hour=count/(60*60);
			if(hour<=60) {
				if(tipDao.getTipCount(userId)==0) {
					UserInfo ui=userDao.load(String.valueOf(userId));
					String content =ui.getAccount()+",您还有不到一个小时会员就到期啦,请及时续费";
					this.tipDao.add(userId, content);
					map.put("flag",true);
					map.put("message", content);
					
				}
			}
		}
		return map;
	}
}
