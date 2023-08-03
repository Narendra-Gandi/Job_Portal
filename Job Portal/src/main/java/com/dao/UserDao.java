package com.dao;
import java.sql.*;

import com.entity.*;
public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/*
	 ============================
	  Registration Method Starts
	 ============================
	 */
	
	public boolean addUser(User u) {
		boolean f = false;
		try {
			String sql = "insert into users(name,email,password,qualification,role) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			ps.setString(5, u.getRole());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	/*
	 ==========================
	 Registration method ends
	 ========================== 
	 */
	
	
	/*
	 ==========================
	 	user Login Method
	 ========================== 
	 */
	
	public User login(String email,String password) {
		User u = null;
		try {
			String sql = "select *from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return u;
	}
	
	/*
	 ====================
	  user login end
	 ====================
	 */
}
