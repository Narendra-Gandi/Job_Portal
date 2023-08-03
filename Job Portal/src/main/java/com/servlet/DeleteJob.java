package com.servlet;

import com.db.DBConnect;
import com.dao.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteJob extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.deleteJob(id);
			
			HttpSession session = request.getSession();
			if(f) {
				session.setAttribute("succMsg", "Job Deleted");
				response.sendRedirect("view_job.jsp");
			}else {
				session.setAttribute("succMsg","something went wrong");
				response.sendRedirect("view_job.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
