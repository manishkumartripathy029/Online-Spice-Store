<html>
<head>
<title>
Home Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<div class="title">
			<center><p>Online Spices Store</p></center>
			</div>
			<div class="main">
			<ul align="center">
			<li><div class="logo">
			<img src="image/chilli.jpg">
			</div></li>
			<li><a href="userviewproduct.jsp">Product</a></li>
			<li><a href="custlogin.jsp">Customer</a></li>
			<li><a href="adminlogin.jsp">Admin</a></li>
			<li><a href="tandc.jsp">Terms and Conditions</a></li>
			<li><a href="Aboutus.jsp">About Us</a></li>
			<li><div class="logo1">
			<img src="image/chilli.jpg">
						</div></li>
			</ul>
		</div>
	</header>
	<%
			if(request.getParameter("msg") != null)
			{
			String frm=request.getParameter("frm");
			String msg=request.getParameter("msg");
			if(frm.equalsIgnoreCase("loginerr"))
			{
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			if(frm.equalsIgnoreCase("logout"))
			{
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			}
			%>
		<img src="image/spice.jpg" height=640 width=1580>
	<footer>
	<marquee>We Accept Orders All Over Bangalore And No Delivery Charges will be Levied On Customer</marquee>
	<div align="center" style=background-color:#FAD7A0>
<table cellspacing=15>
<tr>
<td rowspan=4><img src="image/location.JPG" height=130 width=60></td><td>Online Spices Store</td><td></td><td></td><td></td><td></td>
<td>Email :info@Darbar.com</td></tr><tr><td>No 91, 11th cross</td><td></td><td></td><td></td><td></td>
<td>Web:www.masaladarbar.com</td></tr><tr><td>Shanthinagar</td><td></td><td></td><td></td><td></td>
<td>Contact:080-800000000</td></tr><tr><td>Bangalore-560000</td></tr>
</table>
</div>
<table align="center">
<tr><td colspan=2>© All Rights Reserved</td></tr>
</table>

</body>
</html>