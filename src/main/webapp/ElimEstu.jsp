<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Alumno</title>
</head>
<body>
	<%
	int id=Integer.parseInt(request.getParameter("idAlumno"));
	
	Connection cnx=null;
	ResultSet rs=null;
	Statement sta=null;
	try{
		 Class.forName("com.mysql.jdbc.Driver");
		 cnx = DriverManager.getConnection("jdbc:mysql://192.168.1.11:33060/bd_notas?useSSL=false","root","secret");
		 
		 sta=cnx.createStatement();
		 
		 sta.executeUpdate("delete from alumnos where id_alumno="+id);
		 //request.getRequestDispatcher("listarEstu.jsp").forward(request, response);
		 response.sendRedirect("ListEstu.jsp");
		 sta.close();
		 rs.close();
		 cnx.close();
	}catch(Exception e){}
	
	%>
</body>
</html>