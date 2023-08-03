package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.db.DBConnect;
import com.entity.User;

import com.dao.*;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			User u = new User();
			HttpSession session = request.getSession();
			if("admin@gmail.com".equals(email)&&"admin".equals(password)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				response.sendRedirect("admin.jsp");
			}else {
				//user credentials
				UserDao dao = new UserDao(DBConnect.getConn());
				User user = dao.login(email, password);
				
				if(user!=null) {
					session.setAttribute("userobj", user);
					response.sendRedirect("home.jsp");
				}else {
					session.setAttribute("succMsg", "invalid email & password");
					response.sendRedirect("login.jsp");
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
