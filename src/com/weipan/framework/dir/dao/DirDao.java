package com.weipan.framework.dir.dao;

import java.util.List;

import com.weipan.framework.dir.vo.Dir;

public interface DirDao {
	List<Dir> list(Integer userId);
	
	void add(Dir dir);
	int getDirNameCount(Integer userId,String dirName);
    
	
	Dir load(Integer dirId);
	void update(Dir dir);
	
	void delete(Integer dirId);
	int getDirFileNumber(Integer dirId);
	
}
