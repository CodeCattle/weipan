package com.weipan.framework.dir.dao;

import java.util.List;

import com.weipan.commons.util.DBUtils;
import com.weipan.framework.dir.vo.Dir;

public class DirDaoImpl implements DirDao {
	private DBUtils db=new DBUtils();
	public List<Dir> list(Integer userId) {
		String sql="SELECT d.*,da.fileNum,u.account FROM dir d,(SELECT d.id,COUNT(a.id) fileNum FROM dir d LEFT JOIN attr a ON d.id=a.dir_id GROUP BY d.id) da,userinfo u WHERE d.id=da.id AND u.user_id=d.user_id  AND d.user_id=?";
		return db.queryForList(Dir.class, sql, userId);
	}
	public void add(Dir dir) {
		String sql="INSERT INTO dir (user_id,dir_name,remark) VALUES (?,?,?)";
		db.update(sql, dir.getUser_id(),dir.getDir_name(),dir.getRemark());
		
	}

	public int getDirNameCount(Integer userId, String dirName) {
		String sql="SELECT COUNT(*) FROM dir WHERE user_id=? AND dir_name=? ";
		return db.queryForInteger(sql, userId,dirName);
	}

	public void update(Dir dir) {
		 String sql="UPDATE dir SET dir_name=?,remark=? WHERE id=?";
		 db.update(sql, dir.getDir_name(),dir.getRemark(),dir.getId());
	}

	public void delete(Integer dirId) {
		String sql="DELETE FROM dir WHERE id=?";
		db.update(sql,dirId);
				
	}
	public int getDirFileNumber(Integer dirId) {
		String sql="SELECT COUNT(a.id) FROM dir d LEFT JOIN attr a ON d.id=a.dir_id  WHERE d.id=? GROUP BY d.id";
		return db.queryForInteger(sql, dirId);
	}
	@Override
	public Dir load(Integer dirId) {
		String sql="SELECT * FROM dir WHERE id=?";
		return db.queryForObject(Dir.class, sql,dirId);
	}
	

}
