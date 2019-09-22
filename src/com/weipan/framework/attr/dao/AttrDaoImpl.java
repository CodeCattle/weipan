package com.weipan.framework.attr.dao;

import java.util.List;

import com.weipan.commons.util.DBUtils;
import com.weipan.framework.attr.dto.AttrDto;
import com.weipan.framework.attr.vo.AttrFile;

public  class AttrDaoImpl implements AttrDao {
	private DBUtils db=new DBUtils();

	@Override
	public void add(AttrDto attrDto) {
		StringBuilder builder= new StringBuilder("INSERT INTO attr (id,dir_id,user_id,file_name,server_name,file_type,file_size) VALUES ");
		List<AttrFile> list=attrDto.getList();
		for (AttrFile attrFile : list) {
			builder.append("(");
			builder.append("UUID(),");
			builder.append(attrDto.getDir_id());
			builder.append(",");
			builder.append(attrDto.getUser_id());
			builder.append(",'");
			builder.append(attrFile.getFile_name());
			builder.append("','");
			builder.append(attrFile.getServer_name());
			builder.append("','");
			builder.append(attrFile.getFile_type());
			builder.append("',");
			builder.append(attrFile.getFile_size());
			builder.append(")");
			builder.append(",");
		}
		builder.deleteCharAt(builder.length()-1);
		
		db.update(builder.toString());
	}

	@Override
	public List<AttrFile> list(Integer userId,String dirId) {
	    String sql="SELECT a.*,d.dir_name,(SELECT COUNT(*) FROM `share` WHERE path LIKE CONCAT('%',a.id,'%')) share_count FROM attr a,dir d WHERE a.dir_id=d.id AND d.user_id=?" ;
	    if(dirId!=null) {
	    	sql+=" AND d.id="+dirId;
	    }
		return db.queryForList(AttrFile.class, sql,userId);
	}

	@Override
	public void delete(String id) {
		String sql="DELETE FROM attr WHERE id=?";
		db.update(sql, id);;
	}

	@Override
	public AttrFile load(String id) {
		String sql="SELECT * FROM attr WHERE id=?";
		return db.queryForObject(AttrFile.class, sql,id );
	}

	@Override
	public void updateDownloadCount(String id) {
		String sql="UPDATE attr SET download_count=download_count+1 WHERE id=? ";
		db.update(sql, id);
	}

	@Override
	public void updateFileDir(String dirId,String id) {
		String sql="UPDATE attr SET dir_id=? WHERE id=?";
		db.update(sql,dirId,id);
	}

	
}
