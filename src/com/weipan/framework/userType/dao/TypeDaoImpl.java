package com.weipan.framework.userType.dao;

import java.util.List;

import com.weipan.commons.util.DBUtils;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.vo.UserType;

public class TypeDaoImpl implements TypeDao {
	private DBUtils db=new DBUtils();

	@Override
	public List<UserType> list() {
		String sql="SELECT * FROM user_type";
		return db.queryForList(UserType.class, sql);
	}

	@Override
	public void add(UserType type) {
		String sql="INSERT INTO user_type (type_name,file_size,max_size,money) VALUES (?,?,?,?)";
		db.update(sql,type.getType_name(),type.getFile_size(),type.getMax_size(),type.getMoney());
	}

	@Override
	public void update(UserType type) {
		String sql="UPDATE SET user_type type_name=?,file_size=?,max_size=?,money=? WHERE type_id=?";
		db.update(sql, type.getType_name(),type.getFile_size(),type.getMax_size(),type.getMoney(),type.getType_id());
	}

	@Override
	public int getTypeNameCount(String type_name) {
		String sql="SELECT COUNT(*) FROM user_type WHERE type_name=?";
		return db.queryForInteger(sql, type_name);
	}

	@Override
	public void delete(String type_id) {
		String s1="DELETE ut,ubt FROM user_type ut LEFT JOIN user_buy_type ubt ON ubt.type_id=ut.type_id WHERE ut.type_id="+type_id;
		String s2="UPDATE userinfo SET vip_type=-999 WHERE vip_type="+type_id;
		db.updateBatch(s1,s2);
	}

	@Override
	public UserType load(String type_id) {
		String sql="SELECT * FROM user_type WHERE type_id=?";
		return db.queryForObject(UserType.class, sql,type_id);
	}

	@Override
	public List<UserType> listNotnprmal() {
		String sql="SELECT * FROM user_type WHERE type_id>0";
		return db.queryForList(UserType.class, sql);
	}

}
