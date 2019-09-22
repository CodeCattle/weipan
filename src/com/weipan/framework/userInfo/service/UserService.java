package com.weipan.framework.userInfo.service;

import com.weipan.commons.model.Page;
import com.weipan.framework.userInfo.vo.UserInfo;

public interface UserService {
	UserInfo login(String account,String password);
	
	void updateLogin(String ip ,Integer user_id);
	
	String showImage(String user_id);
	
	Page find(Page page);
	
	void add(UserInfo userinfo);
	
	boolean checkPasswordCount(Integer userId, String password);
	
	void updatepassword(Integer userId,String password);
	
	void resetPassword(String userId);
	
	void updateStatus(String userid,Integer status);
	
	void update(UserInfo userinfo);
	
	boolean checkAccountCount(String account);
	
	UserInfo load(String userId);
	
	String getPhoto(String userId);
	
	void updatePhoto(Integer userId,String photo);
	
	
	
}
