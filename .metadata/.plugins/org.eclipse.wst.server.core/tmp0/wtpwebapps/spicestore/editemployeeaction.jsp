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
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function Upclose()
{
	window.opener.location ="Empedit.jsp";
	window.close();
}

</script>
</head>

<body>

<%
try
{

int eid=Integer.parseInt(request.getParameter("eid"));
String ph=request.getParameter("phone");
String address=request.getParameter("address");
String mail=request.getParameter("mail");
String pass=request.getParameter("pass");
String sql1="update employee set eph=?,eaddress=?,email=?,epass=? where eid=?";
PreparedStatement ps=con.prepareStatement(sql1);
ps.setString(1,ph);
ps.setString(2,address);
ps.setString(3,mail);
ps.setString(4,pass);
ps.setInt(5,eid);
if(ps.executeUpdate()>0)
{  
	%>
	<script type="text/javascript">
	alert("Employee Details Changed");
	Upclose();
	</script>
	<%
}
else
{
	
	%>
	<script type="text/javascript">
	alert("Sorry Employee Details Not Changed");
	Upclose();
	</script>
	<%
}
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
</body>
</html>