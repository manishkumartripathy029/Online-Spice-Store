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
	<title>View Pending Orders </title>
	<link rel="stylesheet" href="css/viewpendingorder.css" type="text/css" />

</head>
<body>
	<p align="center" class="p1">View Pending Orders </p>
<div id="wrapper">
<div id="top">
<div class="shell">

<div class="cl">&nbsp;</div>

</div></div>
<div class="shell">

<section class="container">
<div class="login">
<%if(request.getParameter("msg") != null){
	out.println("<h4 align='center' style='color:black'> " + request.getParameter("msg"));		

} %>
<table id="table" border=3 cellspacing=5 align="center">
	<tr>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Order ID</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Order Date</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Customer Id </th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Customer Name</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Contact No</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Total</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Update Status</th>
	</tr>
		<tr class="alt">	

<%
String sql="select a.orderid,a.odate,a.cid,b.cname,b.cph,a.amt from orders a,customer b where a.status='orderconfirmed' and a.cid=b.cid;";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
if(rs.next())
{
	rs.previous();

while(rs.next())
{
	
%>
<td align="center" style="font-size:16px;"><%=rs.getInt(1) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(2) %></td>
<td align="center" style="font-size:16px;"><%=rs.getInt(3) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(4) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(5) %></td>
<td align="center" style="font-size:16px;"><%=rs.getFloat(6) %></td>
<td align="center" style="font-size:16px;">
<a href="AdminDeleteAction.jsp?&oid=<%=rs.getInt(1)%>&frm=upddelivery" style="text-decoration:none;">Update Delivery</a>
</td>
</tr>
<%}
}
else
{
	out.println("<h1 align='center' style='color:black'>No Orders to display");
	%>
	<!-- script>alert("No Data To Display")</script -->
	<% 
}

%>
<tr><th colspan=9 align="center"><input type="button" value="Back To Home" onclick="window.history.back()"></th></tr>
</table>




</div>
</section>

	<!-- End Content -->
                  </div>
	<!-- End Shell -->
	</div>
	<!-- End Main -->
	<div id="footer-push" class="cl">&nbsp;</div>

	<!-- End Wrapper -->
	
	


</body>
</html>