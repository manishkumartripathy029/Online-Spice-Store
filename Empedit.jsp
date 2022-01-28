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
	<title>View Employees </title>
	<link rel="stylesheet" href="css/empedit.css" type="text/css" media="all" />
<script type="text/javascript">

function popup(mylink, windowname)
{
var href;
if (typeof(mylink) == 'string')
href=mylink;
else
href=mylink.href;
edwindow=window.open(href, windowname, 'width=720,height=1000,scrollbars=no,resizable=no,left=400,top=50,addressbar=no,menubar=0, toolbar=no');
edwindow.top;
edwindow.focus();
return false;
}
function call()
{
document.f1.action="admin.jsp";

}
</script>
</head>
<body>
<form name="f1">
	<p align="center" class="p1">View Employees </p>
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
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Employee ID</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Phone Number</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Address</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Mail</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Password</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Edit</th>
	<th style="color:white;font-size:25px;font-family:Times New Roman;font-style:italic;">Delete</th>
	</tr>
		<tr class="alt">	

<%
String sql="select eid, eph, eaddress, email, epass from employee ";
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
<td align="center" style="font-size:16px;"><%=rs.getString(3) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(4) %></td>
<td align="center" style="font-size:16px;"><%=rs.getString(5) %></td>
<td align="center" style="font-size:16px;">
<a href="empdet.jsp?eid=<%=rs.getInt(1) %>&phone=<%=rs.getString(2) %>&address=<%=rs.getString(3) %>&email=<%=rs.getString(4) %>&pass=<%=rs.getString(5) %>" onClick="return popup(this, 'notes')" >Edit</a>
</td>
<td align="center" style="font-size:16px;"><a href="AdminDeleteAction.jsp?eid=<%=rs.getInt(1)%>&frm=employeeform">Delete</a></td>
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

	<!-- End Content -->
                  </div>
	<!-- End Shell -->
	</div>
	<!-- End Main -->
	<div id="footer-push" class="cl">&nbsp;</div>

	<!-- End Wrapper -->
	
	

</form>
</body>
</html>