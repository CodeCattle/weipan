package com.weipan.framework.share.dao;

import java.util.List;

import com.weipan.commons.model.Page;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.share.vo.shareFile;
import com.weipan.framework.userInfo.vo.UserInfo;

public interface ShareDao {
	void add(shareFile sharefile);
	
	void delete(String id);
	
	List<AttrFile> list(Page page);
	int getTotalCount(Page page);

}
