<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>
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
<html lang="en-US" >
<head>
<link rel="stylesheet" href="css/viewitems.css" type="text/css" media="all" />




</head>
<body >
<form name="f1" action="cartaction.jsp">

<%
	
 int user=Integer.parseInt(session.getAttribute("username").toString());  
%>

<p class="p1" align="center">Order Summary</p>

<%			int oid=Integer.parseInt(request.getParameter("orderid"));
			String sql2="select amt from orders where orderid=?";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setInt(1,oid);
			ResultSet rs1=ps2.executeQuery();
			if(rs1.next())
			{
				String sql="select a.pid,a.pname,a.pdesc,a.pprice,b.qty,b.amt from product a,cart b where b.pid=a.pid and b.orderid=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1,oid);
				ResultSet rs=ps.executeQuery();
				%>
				<table  align="center" class="tbl" border=2>
				<tr ><td colspan=10 align="center" class="ois">Order Id  <input type="text" Name="orderid" readonly="readonly" value="<%=oid%>"></td></tr>
				<tr>
				  <th>Product ID </th>
				  <th>Name</th>
				  <th>Description</th>
				  <th>Unit Price</th>
				  <th>Quantity</th>
				  <th>Total Price</th>
				</tr>
				<tr >
				<%
				
				while(rs.next()){
				%>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td ><%=rs.getFloat(4) %></td>
				
				<td><%=rs.getFloat(5) %></td>
				
				<td><%=rs.getFloat(6) %></td>
				</tr>
				<% 
				}
				}
				%>
<tr class="hh1">
   <td colspan=4></td><td>NET AMOUNT</td>
   <td colspan=2><%=rs1.getFloat(1) %></td>
   </tr>
</table>
<br>
<table align="center"  cellspacing=15 >
<tr>
       	<td ><input type="submit" value="Back To Orders" onclick="call()"></td>
</tr>
</table>
	
	
</form>

</body>
<script type="text/javascript">
function call()
{
document.f1.action="customerorders.jsp";
}

</script>
</html>