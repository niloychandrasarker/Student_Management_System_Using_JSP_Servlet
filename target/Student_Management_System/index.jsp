<%@page import="com.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDAO"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-light">

	<%@include file="navbar.jsp"%>

	<%
	Connection conn = DBconnect.getConn();
	%>
	<div class="container p-5">
		<div class="card">
			<div class="card-body">


				<p class="text-center fs-3">All Students Details</p>

				<c:if test="${not empty succMsg}">
					<p class="text-center test-success">${succMsg }</p>
					<c:remove var="succMsg" />
				</c:if>

				<c:if test="${not empty errorMsg}">
					<p class="tect-center test-success">${errorMsg }</p>
					<c:remove var="errorMsg" />
				</c:if>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Date of Birth</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

						<%
						StudentDAO dao = new StudentDAO(DBconnect.getConn());
						List<Student> list = dao.getAllStudent();

						for (Student s : list) {
						%>

						<tr>
							<th scope="row"><%=s.getFullname()%></th>
							<td><%=s.getDob()%></td>
							<td><%=s.getAddress()%></td>
							<td><%=s.getQualification()%></td>
							<td><%=s.getEmail()%></td>
							<td><a href="edit_students.jsp?id=<%=s.getId()%>"
								class="btn btn-sm btn-primary">Edit</a> <a href="delete?id=<%=s.getId() %>"
								class="btn btn-sm btn-danger">Delete</a></td>
						</tr>
						<%
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>