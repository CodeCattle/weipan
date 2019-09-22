package com.weipan.framework.attr.service;

import java.util.List;

import com.weipan.framework.attr.dto.AttrDto;
import com.weipan.framework.attr.vo.AttrFile;

public interface AttrService {
	void add(AttrDto attrDto);
	
	List<AttrFile> list(Integer  userId,String dirId);
	void delete(String id);
	
	AttrFile load(String id);
	
	void updateDownloadCount(String id);
	void updateFileDir(String dirId,String id);
}
