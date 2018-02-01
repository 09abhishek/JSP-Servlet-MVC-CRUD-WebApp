<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.abhi.web.jdbc.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link type="text/css" rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Tracer App</title>

</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>VMU University</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">

			<!-- put new button: Add Student -->

			<input type="button" value="Add Student"
				onclick="window.location.href='add-student-form.jsp'; return false;"
				class="add-student-button" />

			<!-- <script>
			alert('Hello');
			</script> -->

			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<c:forEach var="tempStudent" items="${STUDENT_LIST}">
				
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>
																		
					<tr>
						<td> ${tempStudent.firstName} </td>
						<td> ${tempStudent.lastName} </td>
						<td> ${tempStudent.email} </td>
						<td> 
							<a href="${tempLink}">Update</a> 
							 | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
							Delete</a>	
						</td>
				</c:forEach>

			</table>

		</div>

	</div>



</body>
</html>