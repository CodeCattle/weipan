package com.weipan.framework.userInfo.dao;

import java.util.List;

import com.weipan.commons.model.Page;
import com.weipan.framework.userInfo.vo.UserInfo;

public interface UserDao {
	UserInfo login(String account,String password);
	
	void updateLogin(String ip ,Integer user_id);
	
	String showImage(String user_id);
	
	//显示用户列表
	List<UserInfo> list(Page page);
	int getTotalCount(Page page);
	
	//注册
	void add(UserInfo userinfo);
	int checkAccountCount(String account);
	//更新
	void update(UserInfo userinfo);
	UserInfo load(String userId);
	//更新状态
	void updateStatus(String userid,Integer status);
	//重置密码
	void resetPassword(String userId);
	//修改密码
	void updatepassword(Integer userId,String password);
	int checkPasswordCount(Integer userId,String password);
	
	//修改图片
	String getPhoto(String userId);
	void updatePhoto(Integer userId,String photo);
	
}
