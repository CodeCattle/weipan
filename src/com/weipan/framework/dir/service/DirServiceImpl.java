package com.weipan.framework.dir.service;

import java.util.List;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.dir.dao.DirDao;
import com.weipan.framework.dir.dao.DirDaoImpl;
import com.weipan.framework.dir.vo.Dir;

public class DirServiceImpl implements DirService {
	private DirDao dirDao=new DirDaoImpl();
	@Override
	public List<Dir> list(Integer userId) {
		return this.dirDao.list(userId);
	}

	@Override
	public void add(Dir dir) {
		try {
			this.dirDao.add(dir);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("添加文件夹失败");
		}
	}

	@Override
	public int getDirNameCount(Integer userId, String dirName) {
		return this.dirDao.getDirNameCount(userId, dirName);
	}

	@Override
	public void update(Dir dir) {
		try {
			this.dirDao.update(dir);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("更新文件夹失败");
		}
	}
	@Override
	public void delete(Integer dirId) {
		try {
			this.dirDao.delete(dirId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("删除文件夹失败");
		}
	}

	@Override
	public Dir load(Integer dirId) {
		return this.dirDao.load(dirId);
	}

	@Override
	public int getDirFileNumber(Integer dirId) {
		return this.dirDao.getDirFileNumber(dirId);
	}

}
