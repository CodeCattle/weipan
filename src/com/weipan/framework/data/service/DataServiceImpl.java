package com.weipan.framework.data.service;

import java.util.List;
import java.util.Map;

import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.data.dao.DataDao;
import com.weipan.framework.data.dao.DataDaoImpl;

public class DataServiceImpl implements DataService {
	private DataDao dataDao=new DataDaoImpl();
	@Override
	public List<Map<String, Object>> list() {
		return this.dataDao.list();
	}
	@Override
	public List<Object> fileList(String dirName) {
		return this.dataDao.fileList(dirName);
	}
	@Override
	public List<Map<String, Object>> show() {
		return this.dataDao.show();
	}

}
