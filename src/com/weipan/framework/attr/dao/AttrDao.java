package com.weipan.framework.attr.dao;

import java.util.List;

import com.weipan.framework.attr.dto.AttrDto;
import com.weipan.framework.attr.vo.AttrFile;

public interface AttrDao {
	void add(AttrDto attrDto);
	List<AttrFile> list(Integer userId,String dirId);
	void delete(String id);
	AttrFile load(String id);
	void updateFileDir(String dirId,String id);
	void updateDownloadCount(String id);
}
