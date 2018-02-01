package com.abhi.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;



@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// set up printWriter
		PrintWriter out =response.getWriter();
		response.setContentType("text/plain");

		// get a sql connection 

		Connection myConn = null;
		Statement  myStmt = null;
		ResultSet myRs =null;

		try{
			//create a SQL statement

			myConn = dataSource.getConnection();

			String sql = "select * from student";

			myStmt = myConn.createStatement();

			// Execute SQL query

			myRs = myStmt.executeQuery(sql);

			// process the result set
			while(myRs.next()){
				out.println(myRs.getString("email"));;
			}



		}catch(SQLException e)
		{
			e.printStackTrace();
		}

	}
}
