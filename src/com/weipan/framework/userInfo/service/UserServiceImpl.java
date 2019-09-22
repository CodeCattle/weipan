package com.weipan.framework.userInfo.service;



import com.weipan.commons.exception.AccountException;
import com.weipan.commons.exception.ServiceException;
import com.weipan.commons.model.Page;
import com.weipan.framework.userInfo.dao.UserDao;
import com.weipan.framework.userInfo.dao.UserDaoImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

public class UserServiceImpl implements UserService {
	private UserDao userDao=new UserDaoImpl();
	@Override
	public UserInfo login(String account, String password) {
		UserInfo user=userDao.login(account, password);
		if(user==null) {
			throw new AccountException("账号密码不一致，请重新输入");
		}else {
			if(user.getStatus()==2) {
				throw new ServiceException("该账号已经被注销，请激活");
			}
			return user;
		}
	}
	@Override
	public void updateLogin(String ip, Integer user_id) {
		try {
			userDao.updateLogin(ip, user_id);
		} catch (Exception e) {
			throw new ServiceException("更新用户信息失败！！");
		}
		
		
	}
	@Override
	public String showImage(String user_id) {
		return userDao.showImage(user_id);
	}
	@Override
	public Page find(Page page) {
		page.setTotalCount(userDao.getTotalCount(page));
		page.setDatas(userDao.list(page));
		return page;
	}
	@Override
	public void add(UserInfo userinfo) {
		int count =userDao.checkAccountCount(userinfo.getAccount());
		if(count>0) {
			throw new ServiceException("该账号已经被注册");
		}
		try {
			userDao.add(userinfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户注册失败！！");
		}
	}
	@Override
	public boolean checkPasswordCount(Integer userId, String password) {
		if(this.userDao.checkPasswordCount(userId, password)>0) {
			return true;//存在
		}
		return false;
	}
	@Override
	public void updatepassword(Integer userId, String password) {
		int count =userDao.checkPasswordCount(userId, password);
		if(count<0) {
			throw new ServiceException("没有设置密码，无法修改");
		}
		try {
			userDao.updatepassword(userId, password);;
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户修改密码失败！！");
		}
	}
	@Override
	public void resetPassword(String userId) {
		try {
			userDao.resetPassword(userId);;
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户重置密码失败！！");
		}
	}
	@Override
	public void updateStatus(String userid, Integer status) {
		try {
			userDao.updateStatus(userid, status);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户改变状态失败！！");
		}
	}
	@Override
	public boolean checkAccountCount(String account) {
		if(this.userDao.checkAccountCount(account)>0) {
			return false;//存在
		}
		return true;
	}	
	@Override
	public void update(UserInfo userinfo) {
		try {
			userDao.update(userinfo);;
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户改变信息失败！！");
		}
	}
	@Override
	public UserInfo load(String userId) {
		return userDao.load(userId);
	}
	@Override
	public void updatePhoto(Integer userId, String photo) {
		try {
			userDao.updatePhoto(userId, photo);;
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("用户改变头像失败！！");
		}
	}
	@Override
	public String getPhoto(String userId) {
		return userDao.getPhoto(userId);
	}
	
	
}
