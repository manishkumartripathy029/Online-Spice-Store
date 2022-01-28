<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp" %>
<%@ page import="java.sql.*" %>
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
<html >
<head>
	<title>My Orders </title>
	<link rel="stylesheet" href="css/myorders.css" type="text/css" media="all" />
<script type="text/javascript">

function popup(mylink, windowname)
{
	
var href;
if (typeof(mylink) == 'string')
href=mylink;
else
href=mylink.href;
edwindow=window.open(href, windowname, 'width=600,height=350,scrollbars=no,resizable=no,left=400,top=50,addressbar=no,menubar=0, toolbar=no');
edwindow.top;
edwindow.focus();
return false;
	
}
function call()
{
document.f1.action="customer.jsp";

}
</script>
</head>
<body>
<form name="f1" >
	<% int uname=Integer.parseInt(session.getAttribute("username").toString());%>
	<p align="center" class="p1">My Orders </p>

<section class="container">
<div class="login">
<%if(request.getParameter("msg") != null){
	out.println("<h4 align='center' style='color:black'> " + request.getParameter("msg"));		

} %>
<table id="table" border=3 cellspacing=5 align="center">
	<tr>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Order ID</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Order Date</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Total Price</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Status</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Last Updated</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Cancellation</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">View Details</th>
	</tr>
		<tr class="alt">	

<%
String sql="select * from orders where cid=? ";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,uname);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	rs.previous();

while(rs.next())
{
	
%>
<td align="center" style="font-size:16px;"><%=rs.getInt(1) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(2) %></td>
<td align="center" style="font-size:16px;"><%=rs.getFloat(5) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(4) %><input type="hidden" value="<%=rs.getString(4) %>" name="status"></td>
<td align="center" style="font-size:16px;"><%=rs.getDate(7) %></td>
<td align="center" style="font-size:16px;">
<a href="reason.jsp?orderid=<%=rs.getInt(1)%>&status=<%=rs.getString(4)%>" style="color:red;" onClick="return popup(this, 'notes')" >Cancel Order</a>
</td>
<td>
<a style="color: rgb(255,255,255);text-decoration:none " title="Click here to view order details" href="cviewitems.jsp?&orderid=<%=rs.getInt(1)%>">View</a>
</td>
</tr>
<%}
}
else
{
	out.println("<h1 align='center' style='color:black'>No Product to display");
	%>
	<!-- script>alert("No Data To Display")</script -->
	<% 
}

%>
<tr><th colspan=7 align="center"><input type="submit" value="Back To Home" onclick="call()"></th></tr>
</table>




</div>
</section>

	
</form>
</body>
</html>