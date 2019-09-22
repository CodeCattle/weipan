package com.weipan.framework.share.service;

import com.weipan.commons.exception.ServiceException;
import com.weipan.commons.model.Page;
import com.weipan.framework.share.dao.ShareDao;
import com.weipan.framework.share.dao.ShareDaoImpl;
import com.weipan.framework.share.vo.shareFile;

public class ShareServiceImpl implements ShareService {
	private ShareDao sharedao=new ShareDaoImpl();

	@Override
	public void add(shareFile sharefile) {
		try {
			this.sharedao.add(sharefile);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("分享文件失败");
		}
		
	}

	@Override
	public void delete(String id) {
		try {
			this.sharedao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServiceException("取消分享失败");
		}
	}

	@Override
	public Page find(Page page) {
		page.setTotalCount(sharedao.getTotalCount(page));
		page.setDatas(sharedao.list(page));
		return page;
	}

}
