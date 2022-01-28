<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp" %>
<%@ page isErrorPage="true" %>
<%
try{
	if((session.getAttribute("username")).equals(null)){
		request.getRequestDispatcher("LoginError.jsp").forward(request, response);
		}
}catch(NullPointerException npe){
	npe.printStackTrace();
	%>
	<jsp:forward page="LoginError.jsp"/>
	<%
	 
}
%> 

<!DOCTYPE html >
<html>
<body>
<%
try
{

	    
		String prodid=request.getParameter("refid");
		String sql1="delete from cart where refid=? ";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setString(1,prodid);
		if(ps.executeUpdate()>0)
		{
			response.sendRedirect("cart.jsp?msg=Selected Product Deleted");
		}
		else
		{
			response.sendRedirect("cart.jsp?msg=Product Not Deleted");
		}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>

</body>
</html>