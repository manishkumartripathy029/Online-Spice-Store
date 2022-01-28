<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>
<%@ page isErrorPage="true" %>
 

<!DOCTYPE html >
<html >
<head>
	<title>Product </title>
	<link rel="stylesheet" href="css/userviewproduct.css" type="text/css" media="all" />
<script>
	function go(){
		document.f1.action="customer.jsp";
		document.f1.submit();
	}
</script>
</head>
<body bgcolor="lightgrey">
<form name="f1" action="cart.jsp">
<p align="center" class="para">View Products</p>

			

			
			
			<%
			if(request.getParameter("msg") != null)
			{
			String frm=request.getParameter("frm");
			String msg=request.getParameter("msg");
			if(frm.equalsIgnoreCase("Cartform"))
			{
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			}
			%>
			<table align="center" border=1 cellspacing=10 cellpadding=8>
			<tr><th colspan=5 align="center">
			
			<button style="width: 200px;
			height: 40px;
			border: 2px solid rgb(56, 245, 30);
			border-radius: 6px;
			font-size: 20px;">View Cart</button>
			<br/><br/>
			ADD PRODUCT's TO CART BY CLICKING ON PRODUCT DETAILS  
			</th></tr>
					<tr><%
			String sql="select * from product";
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
						
						<a style="color: rgb(0,0,0) " placeholder="Click here to add to cart" href="viewaction.jsp?prodid=<%=rs.getString(1)%>">
						<span >Name :<span class="p1"><%=rs.getString(2)%></span></span><br></br>
						<span >Description :<span class="p1"><%=rs.getString(5)%></span></span><br></br>
						<%float mrp=rs.getFloat(3);
						  float price=rs.getFloat(4);
						  float dis=mrp-price;
													%>
			            <span>MRP :<span class="p1"><s><%=mrp%></s></span></span><br></br>
			            <span>Price :<span class="p1"><%=price%></span></span><br></br>
			            <span>Discount :<span class="p2">-<%=dis%></span></span><br></br>
			            
						</a>
						
				<%	if(i==5){%></td></tr><%}
				}
				%>
				
			<%}
			else
			{
				out.println("<h1 align='center style='color:black'> No Product To Display");
			}
			
			%>
			<tr><th colspan=5 align="center"><input type="submit" value="Back To Home" onclick="go()"></th></tr>
</table>
</form>
</body>
</html>