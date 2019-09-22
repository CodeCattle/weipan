package com.weipan.framework.share.service;

import com.weipan.commons.model.Page;
import com.weipan.framework.share.vo.shareFile;

public interface ShareService {
	void add(shareFile sharefile);
	
	void delete(String id);
	Page find(Page page);
}
