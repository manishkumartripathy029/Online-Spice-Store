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
<link rel="stylesheet" href="css/cart.css" type="text/css" media="all" />




</head>
<body >
<form name="f1" action="cartaction.jsp">

<%
	
 int user=Integer.parseInt(session.getAttribute("username").toString());  
%>

<p class="p1" align="center">Order Summary</p>
<%
			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
			
			
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			
			}
			%>
<%
			String sql2="select orderid,odate from orders where cid=? and status='oncart'";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setInt(1,user);
			ResultSet rs1=ps2.executeQuery();
			if(rs1.next())
			{
				int orderid=rs1.getInt(1);
				String sql="select a.pid,a.pname,a.pdesc,a.pprice,b.refid from product a,cart b where b.pid=a.pid and b.orderid=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1,orderid);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()){
					rs.previous();
				%>
				<table  align="center" class="tbl" border=2>
				<tr ><td colspan=10 align="center" class="ois">Order Id  <input type="text" Name="orderid" readonly="readonly" value="<%=orderid%>"></td></tr>
				<tr>
				  <th>Product ID </th>
				  <th>Name</th>
				  <th>Description</th>
				  <th>Unit Price</th>
				  <th>Quantity</th>
				  <th>Total Price</th>
				  <th>Remove</th>
				</tr>
				<tr >
				<%
				
				while(rs.next()){
%>
<td><%=rs.getInt(1) %><input type="hidden" name="pid" value="<%=rs.getInt(1) %>"></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td ><%=rs.getFloat(4) %><input type="hidden" name="mrp" value="<%=rs.getFloat(4) %>"></td>

<td><input type="text" name="qty" maxlength="2" onchange="myFunction()" > </td>

<td><input type="text" name="subtotal" readonly="readonly" ></td>
<td><a href="deleteproduct.jsp?refid=<%=rs.getInt(5)%>">Remove</a></td>
</tr>

<%}}
			else
			{
				response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Cart is Empty");
			}
			}
			%>
<tr class="hh1">
   <td colspan=4></td><td>NET AMOUNT</td>
   <td colspan=2><input type="text" name="netamt" readonly="readonly" /></td>
   </tr>
</table>
<br>
<table align="center"  cellspacing=15 >
<tr>

        
        <td><input type="submit" value="Place An Order"></td>
       	<td ><input type="submit" value="Back To Shop" onclick="call()"></td>
</tr>
</table>
	
	
</form>

</body>
<script type="text/javascript">

function myFunction(){
	var the_sum = 0,st=0;
var the_fields = document.getElementsByName("qty");
var the_fields1 = document.getElementsByName("mrp");

if(the_fields.length==1)
	{
	st=parseInt(document.f1.qty.value)*parseInt(document.f1.mrp.value);
	document.f1.subtotal.value=st;
	document.f1.netamt.value=st;
	}
else
	{
	for (var i=0; i<the_fields.length; i++){
		if (the_fields[i].value != ""
		&& !isNaN(the_fields[i].value))
		{
			st= Number(the_fields[i].value)*Number(the_fields1[i].value);
			document.f1.subtotal[i].value=st;
			the_sum += Number(the_fields[i].value)*Number(the_fields1[i].value);
		}
		
	}
	
	document.f1.netamt.value=the_sum;
	
	}
}

function call()
{
document.f1.action="userviewproduct.jsp";

}

</script>
</html>