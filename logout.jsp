<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<body>
<% 
	session.invalidate();
	response.sendRedirect("home.jsp?&frm=logout&msg=Logged Out Succeessfully");
	
%>
</body>
</html>