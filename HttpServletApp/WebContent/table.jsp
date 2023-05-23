<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.nlt.controller.ParentInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.6.4.min.js"></script>
<style>
.row {
	padding: 10px;
}

.tr {
	background: blue;
}
</style>
<body>
	<form action="./nlt" method="post">
		<input type="hidden" name="page" value="TablePage" />

		<div class="container bg-">
			<div class="row bg-warning text-dark">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<th>ACTION</th>
							<th>NAME</th>
							<th>AGE</th>
							<th>EMAIL</th>
							<th>PASSWORD</th>
							<th>PHONE</th>
							<th>GENDER</th>
						</tr>


						<%
							Connection con = ParentInterface.con;
							Statement smt = con.createStatement();
							ResultSet rs = smt.executeQuery("select * from students where status=1");
							while (rs.next()) {
						%>
						<tr>
							<td><a
								href="update.jsp?id=<%=rs.getInt("id")%>&name=<%=rs.getString("name")%>&age=<%=rs.getInt("age")%>&email=<%=rs.getString("email")%>&password=<%=rs.getString("password")%>&phone=<%=rs.getString("phone")%>&gender=<%=rs.getString("gender")%>&dob=<%=rs.getString("dob")%>">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
									<path
										d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z" />
									</svg>
							</a> <a
								href="delete.jsp?id=<%=rs.getInt("id")%>&name=<%=rs.getString("name")%>&age=<%=rs.getInt("age")%>&email=<%=rs.getString("email")%>&password=<%=rs.getString("password")%>&phone=<%=rs.getString("phone")%>&gender=<%=rs.getString("gender")%>&dob=<%=rs.getString("dob")%>">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-trash3-fill"
										viewBox="0 0 16 16"> <path
										d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
									</svg>
							</a></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getInt("age")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("password")%></td>
							
							<td><%=rs.getString("phone")%></td>
							<td><%=rs.getString("gender")%></td>
						</tr>
						<%
							}
							rs.close();
							smt.close();
						%>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

