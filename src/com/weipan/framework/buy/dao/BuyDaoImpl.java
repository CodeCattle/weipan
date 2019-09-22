package com.weipan.framework.buy.dao;

import java.util.List;

import com.weipan.commons.util.DBUtils;
import com.weipan.framework.buy.vo.BuyType;

public class BuyDaoImpl implements BuyDao{
	private DBUtils db=new DBUtils();

	@Override
	public List<BuyType> list(Integer userId) {
		String sql="SELECT * FROM user_buy_type ubt LEFT JOIN userinfo u ON u.user_id=ubt.user_id LEFT JOIN user_type ut ON u.vip_type=ut.type_id WHERE u.user_id= ? ORDER BY ubt.start_date DESC";
		return db.queryForList(BuyType.class, sql, userId);
	}

	@Override
	public void add(BuyType bt) {
		String sql="INSERT INTO user_buy_type (user_id,type_id,start_date,end_date) VALUES (?,?,NOW(),DATE_ADD(NOW(),INTERVAL ? MONTH))";
		db.update(sql,bt.getUser_id(),bt.getType_id(),bt.getMouthNumber());
		String sql02="UPDATE userinfo SET vip_type=? WHERE user_id=?";
		db.update(sql02, bt.getType_id(),bt.getUser_id());
	}

	@Override
	public int isVip(Integer userId) {
		String sql="SELECT COUNT(*) FROM user_buy_type WHERE user_id=? AND end_date>start_date";
		return db.queryForInteger(sql, userId);
	}

}
