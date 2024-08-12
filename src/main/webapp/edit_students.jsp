<%@page import="com.entity.Student"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-light">
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Students</p>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						StudentDAO dao = new StudentDAO(DBconnect.getConn());
						Student s = dao.getStudentById(id);
						%>
						<form action="update" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" value="<%=s.getFullname() %>" name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input value="<%=s.getDob() %>"
									type="date" name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Address</label> <input type="text" value="<%=s.getAddress() %>"
									name="address" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input value="<%=s.getQualification() %>"
									type="text" name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email" value="<%=s.getEmail() %>"
									type="email" class="form-control">

							</div>
							
							<input type="hidden" name="id" value="<%=s.getId() %>">
 

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>