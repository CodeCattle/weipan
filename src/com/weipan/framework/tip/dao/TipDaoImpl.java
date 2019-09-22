package com.weipan.framework.tip.dao;

import com.weipan.commons.util.DBUtils;

public class TipDaoImpl implements TipDao {
	private DBUtils db=new DBUtils();

	@Override
	public void isOverdue(Integer userId) {
		String sql="SELECT TIME_TO_SEC(TIMEDIFF(end_date,NOW())) flag FROM user_buy_type WHERE user_id=?";
		db.queryForInteger(sql, userId);
	}

	@Override
	public void updateUserType(Integer userId, Integer type) {
		String sql="UPDATE userinfo SET vip_type=? WHERE user_id=?";
		db.update(sql, type,userId);
	}

	@Override
	public void add(Integer userId, String content) {
		String sql="INSERT INTO tip (user_id,content,create_date) VALUES (?,?,CURRENT_DATE())";
		db.update(sql, userId,content);
	}

	@Override
	public int getTipCount(Integer userId) {
		String sql="SELECT COUNT(*) FROM tip WHERE user_id=?";
		return db.queryForInteger(sql,userId);
	}
}
