package com.weipan.framework.data.dao;

import java.util.List;
import java.util.Map;

import com.weipan.commons.util.DBUtils;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.share.vo.shareFile;

public class DataDaoImpl implements DataDao {
	private DBUtils db=new DBUtils();
	@Override
	public List<Map<String, Object>>  list() {
		String sql="SELECT d.dir_name name,COUNT(a.id) value FROM dir d LEFT JOIN attr a ON d.id=a.dir_id GROUP BY d.id";
		return db.queryForList(sql);
	}

	@Override
	public List<Map<String, Object>> show() {
		String sql="SELECT u.account name,COUNT(*) num FROM `share` s,userinfo u WHERE s.user_id=u.user_id GROUP BY u.user_id";
		return db.queryForList(sql);
	}

	@Override
	public List<Object> fileList(String dirName) {
		String sql="SELECT a.file_name,a.file_size,a.upload_date,a.download_count FROM dir d ,attr a WHERE d.id=a.dir_id AND d.dir_name=?";
		return db.queryForSignalList(sql, dirName);
	}
	
}
