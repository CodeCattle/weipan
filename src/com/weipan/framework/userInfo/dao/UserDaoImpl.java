package com.weipan.framework.userInfo.dao;

import java.util.List;

import com.weipan.commons.model.Page;
import com.weipan.commons.util.DBUtils;
import com.weipan.framework.userInfo.vo.UserInfo;

public class UserDaoImpl implements UserDao {
	private DBUtils db=new DBUtils();
	public UserInfo login(String account, String password) {
		String sql="SELECT user_id,account,status,vip_type FROM userinfo WHERE (account=? OR phone=?) AND password=MD5(?)";
		return db.queryForObject(UserInfo.class, sql, account,account,password);
	}
	@Override
	public void updateLogin(String ip, Integer user_id) {
		String sql="UPDATE userinfo SET ip_address=?,login_date=NOW() WHERE user_id=?";
		db.update(sql, ip,user_id);	
	}
	@Override
	public String showImage(String user_id) {
		String sql="SELECT photo FROM userinfo WHERE user_id=?";
		return db.queryForString(sql, user_id);
	}
	@Override
	public List<UserInfo> list(Page page) {
		String sql="SELECT ui.photo,ui.user_id,ui.user_name,ui.account,ui.reg_date,ui.`status`,ui.phone,ut.type_name FROM userinfo ui LEFT JOIN user_type ut ON ui.vip_type=ut.type_id WHERE 1=1";
		//补查询条件
		String status=page.getQuery().get("status");
		if(status!=null) {
			sql +=" AND status="+status;
		}
		String user_name=page.getQuery().get("user_name");
		if(user_name!=null) {
			sql +=" AND user_name LIKE '%"+user_name+"%'";
		}
		sql+=" LIMIT ?,? ";
		return db.queryForList(UserInfo.class, sql, page.getOffset(),page.getPageSize());
	}
	@Override
	public int getTotalCount(Page page) {
		String sql="SELECT COUNT(*) FROM userinfo ui LEFT JOIN user_type ut ON ui.vip_type=ut.type_id WHERE 1=1";
		
		String status=page.getQuery().get("status");
		if(status!=null) {
			sql +=" AND status="+status;
		}
		String user_name=page.getQuery().get("user_name");
		if(user_name!=null) {
			sql +=" AND user_name LIKE '%"+user_name+"%'";
		}
		
		return db.queryForInteger(sql);
	}
	@Override
	public void add(UserInfo userinfo) {
		String sql="INSERT INTO userinfo (account,password,phone) VALUES(?,MD5(?),?)";
		System.out.println(sql);
		db.update(sql, userinfo.getAccount(),userinfo.getPassword(),userinfo.getPhone());
	}
	@Override
	public int checkAccountCount(String account) {
		String sql="SELECT COUNT(*) num FROM userinfo WHERE account=? OR phone=?";
		return db.queryForInteger(sql,account,account);
	}
	@Override
	public void update(UserInfo userinfo) {
		String sql="UPDATE userinfo SET phone=?,user_name=? WHERE user_id=? ";
		db.update(sql, userinfo.getPhone(),userinfo.getUser_name(),userinfo.getUser_id());
	}
	@Override
	public UserInfo load(String userId) {
		String sql="SELECT ui.user_id,ui.account,ui.`password`,ui.phone,ui.user_name,ui.reg_date,ut.type_name,ui.vip_type  FROM userinfo ui,user_type ut WHERE ui.vip_type=ut.type_id AND ui.user_id=?";
		return db.queryForObject(UserInfo.class, sql, userId);
	}
	@Override
	public void updateStatus(String userid, Integer status) {
		String sql="UPDATE userinfo SET status=? WHERE user_id=?";
		db.update(sql, status,userid);
	}
	@Override
	public void resetPassword(String userId) {
		String sql="UPDATE userinfo SET password=MD5('11111') WHERE user_id=?";
		db.update(sql, userId);
	}
	@Override
	public void updatepassword(Integer userId, String password) {
		String sql="UPDATE userinfo SET password=MD5(?) WHERE user_id=? ";
		db.update(sql, password,userId);
	}
	@Override
	public int checkPasswordCount(Integer userId, String password) {
		String sql="SELECT COUNT(*) num FROM userinfo WHERE user_id=? AND password=MD5(?)";
		return db.queryForInteger(sql,userId,password);
	}
	@Override
	public void updatePhoto(Integer userId, String photo) {
		String sql="UPDATE userinfo SET photo=? WHERE user_id=? ";
		db.update(sql, photo,userId);
	}
	@Override
	public String getPhoto(String userId) {
	    String sql="SELECT photo FROM userinfo WHERE user_id=?";
		return db.queryForString(sql, userId);
	}

}
