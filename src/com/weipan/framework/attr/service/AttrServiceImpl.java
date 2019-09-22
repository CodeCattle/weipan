package com.weipan.framework.attr.service;

import java.util.List;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.attr.dao.AttrDao;
import com.weipan.framework.attr.dao.AttrDaoImpl;
import com.weipan.framework.attr.dto.AttrDto;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.share.dao.ShareDao;
import com.weipan.framework.share.dao.ShareDaoImpl;

public class AttrServiceImpl implements AttrService {
	private AttrDao attrdao=new AttrDaoImpl();
	private ShareDao shareDao=new ShareDaoImpl();

	@Override
	public void add(AttrDto attrDto) {
		try {
			this.attrdao.add(attrDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("上传文件失败");
		}
	}

	@Override
	public List<AttrFile> list(Integer userId,String dirId) {
		return this.attrdao.list(userId, dirId);
	}

	@Override
	public void delete(String id) {
		try {
			this.attrdao.delete(id);
			this.shareDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("删除文件失败");
		}
	}

	@Override
	public AttrFile load(String id) {
		return this.attrdao.load(id);
	}

	@Override
	public void updateDownloadCount(String id) {
		try {
			this.attrdao.updateDownloadCount(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("下载文件失败");
		}
	}

	@Override
	public void updateFileDir(String dirId, String id) {
		try {
			this.attrdao.updateFileDir(dirId, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("移动文件夹失败");
		}
	}
}
