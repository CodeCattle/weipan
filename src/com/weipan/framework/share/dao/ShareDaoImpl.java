package com.weipan.framework.share.dao;

import java.util.List;

import com.weipan.commons.model.Page;
import com.weipan.commons.util.DBUtils;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.share.vo.shareFile;

public class ShareDaoImpl implements ShareDao {
	private DBUtils db=new DBUtils();

	@Override
	public void add(shareFile sharefile) {
		String sql="INSERT INTO share (title,path,user_id) VALUES (?,?,?)";
		db.update(sql, sharefile.getTitle(),sharefile.getPath(),sharefile.getUser_id());
		
	}

	@Override
	public void delete(String id) {
		String sql="DELETE FROM share WHERE path LIKE CONCAT ('%',?)";
		db.update(sql, id);
	}

	@Override
	public List<AttrFile> list(Page page) {
		String sql="SELECT s.title,s.path,u.user_name,u.photo FROM share s,userinfo u WHERE s.user_id=u.user_id";
		String keyword=page.getQuery().get("keyword");
		if(keyword!=null) {
			sql+=" AND ( u.user_name LIKE '%"+keyword+"%' OR s.title LIKE '%"+keyword+"%')";
		}
		sql+=" LIMIT ?,? ";
		System.out.println(sql);
		return db.queryForList(shareFile.class, sql,page.getOffset(),page.getPageSize());
	}

	@Override
	public int getTotalCount(Page page) {
		String sql="SELECT COUNT(*) FROM share s,userinfo u WHERE s.user_id=u.user_id";
		String keyword=page.getQuery().get("keyword");
		if(keyword!=null) {
			sql+=" AND ( u.user_name LIKE '%"+keyword+"%' OR s.title LIKE '%"+keyword+"%')";
		}
		return db.queryForInteger(sql);
	}

}
