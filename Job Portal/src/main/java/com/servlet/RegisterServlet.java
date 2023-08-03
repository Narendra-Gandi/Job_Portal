package com.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		try {
		//Get the values from registration page
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String qualification = request.getParameter("qualification");
		
//		User u = new User(name,email,password,qualification,"user");
		
		User u = new User(name,email,password,qualification,"user");
		UserDao dao = new UserDao(DBConnect.getConn());
		
		boolean f = dao.addUser(u);
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("succMsg", "RegisteredSuccessfully");
			response.sendRedirect("registration.jsp");
		}else {
			session.setAttribute("succMsg", "something went wrong");
			response.sendRedirect("registration.jsp");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
