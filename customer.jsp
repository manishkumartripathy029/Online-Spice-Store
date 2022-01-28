<html>
<link rel="stylesheet" type="text/css" href="css/customer.css">
<body>
	<div class="alignn">
		<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="userviewproduct.jsp">View Products</a></li>
				<li><a href="cart.jsp">My Cart</a></li>
				<li><a href="customerorders.jsp">My Orders</a></li>
				<li><a href="logout.jsp">LogOut</a></li>
		</ul>
	</div>
	 <br>
	 <br><br>
	<%
			if(request.getParameter("msg") != null)
			{

			String msg=request.getParameter("msg");
			
				out.println("<p align='center' style='color:green; color:white; font-size:24px;'> "+request.getParameter("msg")+"</p>");
			}
			%>
	
</body>
</html>	