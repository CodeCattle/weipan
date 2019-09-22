package com.weipan.commons.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class DBUtils {
	
	private final static String DIRVER_CLASS;
	private final static String URL;
	private final static String USER_NAME;
	private final static String PWD;
	//加载的数据连接的信息
	static {//随着类的加载而记载,只能使用静态方法和静态变量,代码块中定义的变量是局部变量
		
		Properties props = new Properties();
		InputStream is = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			props.load(is);
			DIRVER_CLASS = props.getProperty("driverClassName");
			URL = props.getProperty("url");
			USER_NAME = props.getProperty("username");
			PWD = props.getProperty("password");
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("没有加载成功jdbc.properties文件");
		}	
	}
	//加载驱动类
	static {
		try {
			Class.forName(DIRVER_CLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("加载"+DIRVER_CLASS+"类失败:没有找到");
		}
	}
	/**
	 * 获取数据库连接
	 */
	public Connection getConnection() {
		try {
			return DriverManager.getConnection(URL, USER_NAME, PWD);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("建立数据库连接失败");
		}
	}
	/**
	 * 执行INSERt/UPDATE/DELETE变更语句
	 * @param sql
	 * @param params
	 */
	public void update(String sql,Object...params) {
		Connection conn = null;
		PreparedStatement ps=null;
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++) {
				ps.setObject(i+1, params[i]);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("执行变更SQL语句失败");
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**
	 * 获取一行记录将其二次转换为Map
	 * @param sql
	 * @param params
	 * @return
	 */
	public Map<String,Object> queryForMap(String sql,Object...params){
		Map<String,Object> map = null;
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++) {
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			if(rs.next()) {
				map = new HashMap<String, Object>();
				for (int i = 1; i <=columnCount; i++) {
					String columnName = rsmd.getColumnLabel(i);
					//Object columnValue = rs.getObject(columnName);
					Object columnValue = rs.getObject(i);
					map.put(columnName, columnValue);
				}
			}
			
			return map;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("执行queryForMap方法的SQL语句失败");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public Integer queryForInteger(String sql,Object...params){
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++) {
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return null;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("执行queryForInteger方法的SQL语句失败");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public String queryForString(String sql,Object...params){
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++) {
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
			return null;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("执行queryForString方法的SQL语句失败");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public List<Map<String,Object>> queryForList(String sql,Object...params){
		List<Map<String,Object>> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = this.getConnection();//实例方法调用本类的实例方法
			ps = conn.prepareStatement(sql);
			//给占位符赋值
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();//JDBC获取虚拟表的结构+数据
			ResultSetMetaData rsmd = rs.getMetaData();//获取了结构
			int columnCount = rsmd.getColumnCount();//获取查询列数
			if(rs.next()) {
				list = new ArrayList<Map<String,Object>>();
				do {
					Map<String,Object> map = new HashMap<>();
					for(int i=1;i<=columnCount;i++) {
						String columnName = rsmd.getColumnLabel(i);//虚拟表中字段名称
						Object columnValue = rs.getObject(i);
						map.put(columnName, columnValue);
					}
					list.add(map);
				} while (rs.next());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();//开发人眼使用
			throw new RuntimeException("执行queryForList方法的SQL语句失败");
		}
		
		return list;
	}
	/**
	 * Class<?> clazz : ?是通配符,根据你实参传递的类型而变化
	 * @param clazz
	 * @param sql
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> T queryForObject(Class<?> clazz , String sql , Object...params) {
		Map<String,Object> map = this.queryForMap(sql, params);
		T t = null;
		if(map!=null) {
			try {
				t = (T)clazz.newInstance();//实例化T类型的对象
				Set<String> keySet = map.keySet();
				for (String key : keySet) {
					Field field = this.getField(key, clazz);//通过key判断该字段是否存在T类型中的属性
					if(field!=null) {
						Object value = map.get(key);//获取Map的KEY对应的值
						if(value!=null) {
							field.setAccessible(true); //破坏访问性
							field.set(t, value);//赋值
						}
					}
				}
			} catch (InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return t;
	}
	@SuppressWarnings("unchecked")
	public <T> List<T> queryForList(Class<?> clazz,String sql , Object...params){
		List<Map<String,Object>> mapList = this.queryForList(sql, params);
		List<T> list = null;
		if(mapList!=null) {
			list = new ArrayList<>();
			for (Map<String,Object> map : mapList) {
				try {
					T t = (T)clazz.newInstance();//创建新对象存储数据
					Set<String> keySet = map.keySet();
					for (String key : keySet) {
						Field field = this.getField(key, clazz);//通过key判断该字段是否存在T类型中的属性
						if(field!=null) {
							Object value = map.get(key);//获取Map的KEY对应的值
							if(value!=null) {
								field.setAccessible(true); //破坏访问性
								field.set(t, value);//赋值
							}
						}
					}
					//存储对象
					list.add(t);
				} catch (InstantiationException | IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	} 
	
	private Field getField(String fieldName,Class<?> clazz) {
		try {
			return clazz.getDeclaredField(fieldName);
		} catch (NoSuchFieldException | SecurityException e) {
			return null;
		}
	}
	
	public void updateBatch(String...sqls) {
		Connection conn = null;
		Statement st = null;
		
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);//关闭自动提交
			st = conn.createStatement();
			for (String sql : sqls) {
				st.addBatch(sql);
			}
			st.executeBatch();
			conn.commit();//手动提交事务
		} catch (SQLException e) {
	
			e.printStackTrace();
			throw new RuntimeException("执行updateBatch方法的SQL语句失败");
		}finally {
			try {
				if(st!=null) {
					st.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}
	
	public List<Object> queryForSignalList(String sql,Object...params){
		List<Object> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i+1, params[i]);
			}
			rs = ps.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(rs.getObject(1));// 1获取
				} while (rs.next());
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("执行queryForSignalList方法的SQL语句失败");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	
	
	
	
	
	
	

}
