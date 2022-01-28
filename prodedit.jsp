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
	<title>View Products </title>
	<link rel="stylesheet" href="css/prodedit.css" type="text/css" />
<script type="text/javascript">

function popup(mylink, windowname)
{
var href;
if (typeof(mylink) == 'string')
href=mylink;
else
href=mylink.href;
edwindow=window.open(href, windowname, 'width=720,height=1000,scrollbars=yes,resizable=yes,left=400,top=50,addressbar=no,menubar=0, toolbar=no');
edwindow.top;
edwindow.focus();
return false;
}
</script>
</head>
<body>
	<p align="center" class="p1">View Products </p>

<%if(request.getParameter("msg") != null){
	out.println("<h4 align='center' style='color:#0093ff'> " + request.getParameter("msg"));		

} %>
<table id="table" border=3 cellspacing=5 align="center">
	<tr>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Product ID</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Name</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">MRP</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Price</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Description</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Stock</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Edit</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Delete</th>
	</tr>
		<tr class="alt">	

<%
String sql="select pid, pname, pmrp, pprice, pdesc, pstock from product ";
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
<td align="center" style="font-size:16px;"><%=rs.getFloat(3) %></td>
<td align="center" style="font-size:16px;"><%=rs.getFloat(4) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(5) %></td>
<td align="center" style="font-size:16px;"><%=rs.getInt(6) %></td>
<td align="center" style="font-size:16px;">
<a href="proddet.jsp?pid=<%=rs.getInt(1) %>&pname=<%=rs.getString(2) %>&pmrp=<%=rs.getFloat(3) %>&pprice=<%=rs.getFloat(4) %>&pdesc=<%=rs.getString(5) %>&pstock=<%=rs.getInt(6) %>" onClick="return popup(this, 'notes')" style="text-decoration:none; color:rgb(255, 255, 255);">Edit</a>
</td>
<td align="center" style="font-size:16px;"><a href="AdminDeleteAction.jsp?pid=<%=rs.getInt(1)%>&frm=productform" style="text-decoration:none; color:rgb(56, 245, 30);">Delete</a></td>
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
<tr><th colspan=8 align="center"><input type="button" value="Back To Home" onclick="window.history.back()"></th></tr>
</table>


</body>
</html>