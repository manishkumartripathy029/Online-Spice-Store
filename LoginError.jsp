<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<body>
<% 
	response.sendRedirect("home.jsp?&frm=loginerr&msg=Please Login To Continue");
			
%>
</body>
</html>