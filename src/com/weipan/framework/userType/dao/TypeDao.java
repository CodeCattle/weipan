package com.weipan.framework.userType.dao;

import java.util.List;

import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.vo.UserType;

public interface TypeDao {
	List<UserType> list();
	
	void add(UserType type);
	void update(UserType type);
	UserType load(String type_id);
	int getTypeNameCount(String type_name);
	
	void delete(String type_id);
	
	List<UserType> listNotnprmal();

}
