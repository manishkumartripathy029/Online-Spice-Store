<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>
<%@ page isErrorPage="true" %>
 

<!DOCTYPE html >
<html >
<head>
	<title>Product </title>
	<link rel="stylesheet" href="css/Orderdrop.css" type="text/css" media="all" />
<script>
function call()
{
document.f1.action="admin.jsp";

}
</script>	
</head>
<body>
<form name="f1" >
<p align="center" class="para">View Orders</p>
			<%
			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			%>
			<table align="center" border=1 cellspacing=10 cellpadding=8>
					<tr><%
			String sql="select a.orderid,a.odate,b.cname,a.amt from orders a,customer b where a.cid=b.cid and a.status='orderplaced'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
				
			if(rs.next())
			{
				rs.previous();
				int i=0;
				while(rs.next()){
						i++;			
			%>
				<td>
						
						<a style="color: rgb(0,0,0);text-decoration:none " title="Click here to view order details" href="viewitems.jsp?&orderid=<%=rs.getInt(1)%>">
						<span >Order Id :<span class="p1"><%=rs.getInt(1)%></span></span><br></br>
						<span >Order Date :<span class="p1"><%=rs.getString(2)%></span></span><br></br>
			            <span>Customer Name:<span class="p1"><%=rs.getString(3)%></span></span><br></br>
			            <span>Amount :<span class="p1"><%=rs.getFloat(4)%></span></span><br></br>
						</a>
						<a style="color: rgb(0,0,0); " href="AdminDeleteAction.jsp?&orderid=<%=rs.getInt(1)%>&frm=confirm"><span class="p2">Confirm Order</span></a><br>
						<a style="color: rgb(0,0,0); " href="AdminDeleteAction.jsp?&orderid=<%=rs.getInt(1)%>&frm=reject"><span class="p3">Reject Order</span></a>
				<%	if(i==4){%></td></tr><%}
				}
				%>
				
			<%}
			else
			{
				out.println("<h1 align='center style='color:black'> No Orders To Display");
			}
			
			%>
			<tr><th colspan=5 align="center"><input type="submit" value="Back To Home" onclick="call()"></th></tr>
</table>
</form>
</body>
</html>