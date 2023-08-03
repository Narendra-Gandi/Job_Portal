package com.db;
import java.sql.*;
public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {
		if(conn==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","user");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
}
