<%@ include file="Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add New Product</title>
	<link rel="stylesheet" type="text/css" href="css/managepro.css">
</head>
<script type="text/javascript" src="./js/ValidateForm.js"></script>
<body>
	<form action="prodaddcode.jsp" method="get">
	<p align="center" class="p1">Add New Product</p>
	<%
			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:white'> "+request.getParameter("msg")+"</p>");
			}
			%>
	<div class="box">
	
			<%
			String sql="select pid from product";
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(sql);
						rs.last();%>
	<table class="tb">
		<tr><td>Product ID</td><td><input type="text" name="pid" value=<%=rs.getInt(1)+1%> readonly="readonly"></td>
			<td>Product Name</td><td><input type="text" name="pname" onkeyup="alp(this)" onkeydown="alp(this)" required="required" autocomplete="off"></td></tr>
		<tr><td>MRP</td><td><input type="number" name="pmrp" required="required" autocomplete="off"></td><td>Price</td><td><input type="number" name="pprice" required="required" autocomplete="off"></td></tr>
		<tr><td>Description</td><td><textarea rows="5" cols="30" name="pdesc" onkeyup="alpnum(this)" onkeydown="alpnum(this)"> </textarea>
			<td>Stock</td><td><input type="number" name="pstock" required="required" autocomplete="off"></td></tr>
	</table>
	</div>
	<table align="center" cellspacing="10" >
					<tr>
				<td><input type="submit" value="Save" style="width: 200px;
						height: 40px;
						border: 2px solid rgb(255, 0, 0);
						border-radius: 6px;
						font-size: 20px;"></td>
				<td><input type="reset" value="Clear"></td>
				<td><input type="button" value="Exit" onclick="window.history.back()"></td></tr>
				</table>
	</form>
</body>
</html>