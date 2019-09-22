package com.weipan.framework.data.dao;

import java.util.List;
import java.util.Map;

import com.weipan.framework.share.vo.shareFile;

public interface DataDao {
	List<Map<String, Object>>  list();
	List<Object> fileList(String dirName);
	
	List<Map<String, Object>> show();
}
