package com.weipan.framework.dir.service;

import java.util.List;

import com.weipan.framework.dir.vo.Dir;

public interface DirService {
	
	List<Dir> list(Integer userId);
	
	void add(Dir dir);
	int getDirNameCount(Integer userId,String dirName);
	void update(Dir dir);
	Dir load(Integer dirId);
	void delete(Integer dirId);
	int getDirFileNumber(Integer dirId);
}
