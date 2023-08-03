package com.servlet;

import java.io.IOException;

import com.dao.JobDAO;
import com.db.DBConnect;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateJob extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String description = request.getParameter("description");
			
			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			
			HttpSession session = request.getSession();
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJob(j);
			if(f) {
				session.setAttribute("succMsg", "job updated successfull");
				response.sendRedirect("view_job.jsp");
			}else {
				session.setAttribute("succMsg", "something went wrong");
				response.sendRedirect("view_job.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
