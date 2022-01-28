<%@ page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
Connection con=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","mysql");
	System.out.println("CONNECTION SUCCESSFULLY");
}catch (Exception e) 
{
	System.out.println("Error in connection "+e);
}
	
%>
</body>
</html>