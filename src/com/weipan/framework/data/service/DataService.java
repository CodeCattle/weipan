package com.weipan.framework.data.service;

import java.util.List;
import java.util.Map;

import com.weipan.framework.attr.vo.AttrFile;

public interface DataService {
	List<Map<String, Object>> list();
	List<Object> fileList(String dirName);
	
	List<Map<String, Object>> show();

}
