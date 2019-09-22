package com.weipan.commons.util;

import java.sql.*;

public class CreateVO {

	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");//执行了静态代码块
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/qh03_weipan?serverTimezone=Hongkong", "root", "root");
		String sql = "SELECT * FROM tip";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		
		StringBuilder builder = new StringBuilder();
		builder.append("public class UserBuyType{\r\n");
		for (int i = 1; i <=columnCount; i++) {
			String columnName = rsmd.getColumnLabel(i);
			builder.append("    private ");
			String typeName = javaType(rsmd.getColumnTypeName(i));
			builder.append(typeName);
			builder.append(" ");
			builder.append(columnName);
			builder.append(";\r\n");
		}
		builder.append("\r\n");
		for (int i = 1; i <=columnCount; i++) {
			String columnName = rsmd.getColumnLabel(i);
			String typeName = javaType(rsmd.getColumnTypeName(i));

			builder.append("    public ");
			builder.append(typeName);
			builder.append(" get");
			String getName = columnName.substring(0, 1).toUpperCase()+columnName.substring(1);
			builder.append(getName);
			builder.append("(){\r\n");
			builder.append("        ");
			builder.append("return this.");
			builder.append(columnName);
			builder.append(";\r\n");
			builder.append("    }\r\n");
			
			builder.append("    public void set");
			builder.append(getName);
			builder.append("(");
			builder.append(typeName);
			builder.append(" ");
			builder.append(columnName);
			builder.append("){\r\n");
			builder.append("        ");
			builder.append("this.");
			builder.append(columnName);
			builder.append("=");
			builder.append(columnName);
			builder.append(";\r\n");
			builder.append("    }\r\n");
		}
		
		builder.append("}");
		
		System.out.println(builder);
		
	}
	public static String javaType(String columnType) {
		String type = "Object";
		if("INT".equals(columnType)||"TINYINT".equals(columnType)) {
			type = "Integer";
		}
		if("VARCHAR".equals(columnType)||"CHAR".equals(columnType)||"TEXT".equals(columnType)) {
			type = "String";
		}
		if("DATETIME".equals(columnType)) {
			type = "Date";
		}
		if("TIMESTAMP".equals(columnType)) {
			type = "Timestamp";
		}
		if("DOUBLE".equals(columnType)) {
			type = "double";
		}
		if("FLOAT".equals(columnType)) {
			type = "float";
		}
		if("DECIMAL".equals(columnType)) {
			type = "BigDecimal";
		}
		
		return type;
		
	}

}
