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
import com.entity.Student;

@WebServlet("/update")
public class updateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		int id = Integer.parseInt(req.getParameter("id"));

		Student student = new Student(id, name, dob, address, qualification, email);

		StudentDAO dao = new StudentDAO(DBconnect.getConn());
		HttpSession session = req.getSession();

		boolean f = dao.updateStudent(student);

		if (f) {
			session.setAttribute("succMsg", "Student Details Update Successfully");
			resp.sendRedirect("index.jsp");
			// System.out.println("Student Details Submit Successfully");
		} else {
			session.setAttribute("errorMsg", "Something Wrong on Server");
			resp.sendRedirect("index.jsp");
			// System.out.println("Something Wrong on Server");
		}
	}

}
