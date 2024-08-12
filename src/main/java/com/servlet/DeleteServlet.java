package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.StudentDAO;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		StudentDAO dao = new StudentDAO(DBconnect.getConn());
		boolean f = dao.deleteStudent(id);
		HttpSession session = req.getSession();

		

		if (f) {
			session.setAttribute("succMsg", "Student Details Delete Successfully");
			resp.sendRedirect("index.jsp");
			// System.out.println("Student Details Submit Successfully");
		} else {
			session.setAttribute("errorMsg", "Something Wrong on Server");
			resp.sendRedirect("index.jsp");
			// System.out.println("Something Wrong on Server");
		}
	}
	

}
