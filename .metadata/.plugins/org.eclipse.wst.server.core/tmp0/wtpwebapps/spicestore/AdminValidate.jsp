<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>

<html>
<head>
<title>Admin Login</title>
</head>


<body>
<%	String x=null;
	String y=null;
	String un=request.getParameter("username");
	String pass=request.getParameter("pass");
%>



<%
PreparedStatement ps=con.prepareStatement("select epass,etype from employee where eid=?");
ps.setString(1,un);

ResultSet rs=ps.executeQuery();
while(rs.next())
{	
x=rs.getString("epass");
y=rs.getString("etype");
}
if(pass.equals(x))
{
	session.setAttribute("username",un);
	if(y.equals("admin"))
	{	
	response.sendRedirect("admin.jsp");
	}
	else 
	{
		if(y.equals("office"))
		{
			response.sendRedirect("officestaff.jsp");
		}
		
	}	


}
else
{
	response.sendRedirect("adminlogin.jsp?msg=Invalid User name or password");
}
%>
</body>
</html>
<%
try{
if(ps!=null){
ps.close();
}
if(rs!=null){
rs.close();
}
if(con!=null){
con.close();
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>