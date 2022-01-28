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
	window.opener.location ="cusedit.jsp";
	window.close();
}

</script>
</head>

<body>

<%
try
{

int cid=Integer.parseInt(request.getParameter("cid"));
String ph=request.getParameter("phone");
String address=request.getParameter("address");
String mail=request.getParameter("mail");
String pass=request.getParameter("pass");
String sql1="update customer set cph=?,caddress=?,cmail=?,cpass=? where cid=?";
PreparedStatement ps=con.prepareStatement(sql1);
ps.setString(1,ph);
ps.setString(2,address);
ps.setString(3,mail);
ps.setString(4,pass);
ps.setInt(5,cid);
if(ps.executeUpdate()>0)
{  
	%>
	<script type="text/javascript">
	alert("Customer Details Changed");
	Upclose();
	</script>
	<%
}
else
{
	
	%>
	<script type="text/javascript">
	alert("Sorry Customer Details Not Changed");
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