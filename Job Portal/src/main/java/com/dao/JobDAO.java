package com.dao;
import java.sql.*;
import com.entity.*;

import java.util.ArrayList;
//To view the data
import java.util.List;

public class JobDAO {
	private Connection conn;
	
	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	//ADD JOBS
	public boolean addJobs(Jobs j) {
		boolean f = false;
		try {
			String sql = "insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5,j.getLocation());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//View JOBS
	public List<Jobs> getAllJobs(){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select *from jobs order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTime(7)+"");
				list.add(j);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	//Edit Jobs View
	public Jobs getJobById(int id){
		
		Jobs j = null;
		
		try {
			String sql = "select *from jobs where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTime(7)+" ");
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return j;
	}
	
	//To update job
	
	public boolean updateJob(Jobs j) {
		boolean f = false;
		
		try {
			String sql = "update jobs set title=?,description=?,category=?,status=?,location=? where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			
			ps.setString(5,j.getLocation());
			ps.setInt(6,j.getId());
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//To delete job by id
	public boolean deleteJob(int id) {
		boolean f = false;
		try {
			String sql = "delete from jobs where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//For User View JOBS only active jobs will be displayed
			public List<Jobs> getAllJobsForUser(){
				List<Jobs> list = new ArrayList<Jobs>();
				Jobs j = null;
				
				try {
					String sql = "select *from jobs where status=? order by id desc";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, "active");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						j = new Jobs();
						j.setId(rs.getInt(1));
						j.setTitle(rs.getString(2));
						j.setDescription(rs.getString(3));
						j.setCategory(rs.getString(4));
						j.setStatus(rs.getString(5));
						j.setLocation(rs.getString(6));
						j.setPdate(rs.getTime(7)+"");
						list.add(j);
						
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return list;
			}
	
	//Search for either category or location
	public List<Jobs> getJobsORLocationAndCategory(String category,String location){
		
		List<Jobs> list = new ArrayList<Jobs>();
		
		Jobs j = null;
		
		try {
			String sql = "select *from jobs where category=? or location=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setLocation(rs.getString(5));
				j.setStatus(rs.getString(4));
				j.setPdate(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 
	  	======================================================== 
	  	 searching for jobs by using both category and location
	  	========================================================
	 */
	
	//Search for both category and location
		public List<Jobs> getJobsAndLocationAndCategory(String category,String location){
			
			List<Jobs> list = new ArrayList<Jobs>();
			
			Jobs j = null;
			
			try {
				String sql = "select *from jobs where category=? and location=? order by id desc";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, category);
				ps.setString(2, location);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					j = new Jobs();
					j.setId(rs.getInt(1));
					j.setTitle(rs.getString(2));
					j.setDescription(rs.getString(3));
					j.setCategory(rs.getString(4));
					j.setLocation(rs.getString(5));
					j.setStatus(rs.getString(4));
					j.setPdate(rs.getString(7));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
	
}
