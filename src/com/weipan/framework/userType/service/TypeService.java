package com.weipan.framework.userType.service;

import java.util.List;

import com.weipan.framework.userType.vo.UserType;

public interface TypeService {
List<UserType> list();
	
	void add(UserType type);
	void update(UserType type);
	UserType load(String type_id);
	boolean validTypeName(String type_name);
	
	void delete(String type_id);
	
	List<UserType> listNotnprmal();
}
