<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>
<!DOCTYPE html >
<html>
<head>
</head>


<body>

<%
String username=request.getParameter("username");
String pass=request.getParameter("pass");
PreparedStatement ps=con.prepareStatement("select cpass from customer where cid=?");
ps.setString(1,username);
String x=null;
String y=null;
ResultSet rs=ps.executeQuery();
while(rs.next())
{	
x=rs.getString("cpass");

}
if(pass.equals(x))
{
	session.setAttribute("username",username);
	response.sendRedirect("customer.jsp");
}
else
{
	response.sendRedirect("custlogin.jsp");
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