package com.weipan.framework.userType.service;

import java.util.List;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userType.dao.TypeDao;
import com.weipan.framework.userType.dao.TypeDaoImpl;
import com.weipan.framework.userType.vo.UserType;

public class TypeServiceImpl implements TypeService {
	private TypeDao typeDao=new TypeDaoImpl();

	@Override
	public List<UserType> list() {
		return this.typeDao.list();
	}

	@Override
	public void add(UserType type) {
		try {
			this.typeDao.add(type);
		} catch (Exception e) {
			e.printStackTrace();
		    throw new ServiceException("新增类型失败");
		}
		
	}

	@Override
	public void update(UserType type) {
		try {
			this.typeDao.update(type);;
		} catch (Exception e) {
			e.printStackTrace();
		    throw new ServiceException("修改类型失败");
		}
	}
	
	@Override
	public UserType load(String type_id) {
		return typeDao.load(type_id);
	}

	@Override
	public boolean validTypeName(String type_name) {
		if(typeDao.getTypeNameCount(type_name)>0) {
			return false;
		}
		return true;
	}

	@Override
	public void delete(String type_id) {
		try {
			this.typeDao.delete(type_id);;;
		} catch (Exception e) {
			e.printStackTrace();
		    throw new ServiceException("删除失败");
		}
	}

	@Override
	public List<UserType> listNotnprmal() {
		return this.typeDao.listNotnprmal();
	}
}
