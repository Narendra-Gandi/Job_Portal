package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.entity.*;
import com.dao.*;
import com.db.*;

@WebServlet("/add_job")
public class AddJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String description = request.getParameter("description");
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setDescription(description);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			
			HttpSession session = request.getSession();
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f) {
				session.setAttribute("succMsg", "job posted successfull");
				response.sendRedirect("add_job.jsp");
			}else {
				session.setAttribute("succMsg", "something went wrong");
				response.sendRedirect("add_job.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
