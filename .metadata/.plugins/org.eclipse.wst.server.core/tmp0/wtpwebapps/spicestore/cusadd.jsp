<%@ include file="Connection.jsp" %>
<%@ page import="java.sql.*" %>
<html>
		<head>
			<title>Add Customer</title>
			<link rel="stylesheet" type="text/css" href="css/cusadd.css">
			
		</head>
<script type="text/javascript" src="./js/ValidateForm.js"></script>

	<body>
		<form name="cadd" action="cusaddcode.jsp" >
			<p align="center" class="p1">Add Customer</p>
			<div class="box" align="center">
			<%
			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");			}
			%>
			<%
			String sql="select cid from customer";
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(sql);
						rs.last();%>
				<table>
					<tr>
						<td>Customer Id</td>
						<td><input type="text" name="customerid" readonly="readonly" value=<%=rs.getInt(1)+1%> ></td>
						<td>Password</td>
						<td><input type="text" name="password" onkeyup="alpnum(this)" onkeydown="alpnum(this)" required="required" autocomplete="off"></td>
					</tr>
					<tr>
						<td>Customer Name</td>
						<td><input type="text" name="customername" onkeyup="alp(this)" onkeydown="alp(this)" required="required" autocomplete="off"></td>
						<td>Phone Number</td>
						<td><input type="text" name="phoneno"  maxlength=10  onkeyup="num(this)" onkeydown="num(this)" required="required" autocomplete="off"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td colspan="4"><textarea rows="5" cols="30" name="address" > </textarea></td>
					</tr>
					<tr>
						<td>Mail Id</td>
						<td><input type="email" name="mail" autocomplete="off"></td>
						<td>Adhaar Number</td>
						<td><input type="text" maxlength=12 name="adhaar"  onkeyup="num(this)" onkeydown="num(this)" required="required" autocomplete="off"></td>
					</tr>
					<tr>
						<td>GST Number</td>
						<td><input type="text" name="gstin" onkeyup="alpnum(this)" onkeydown="alpnum(this)" required="required" autocomplete="off"></td>
					
					</tr>
				</table>
			</div>
				<table align="center" cellspacing="10" >
					<tr>
				<td>
					<button  value="cusadd" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(69, 30, 245);
					border-radius: 10px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				<td><input type="reset" value="Clear" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(69, 30, 245);
					border-radius: 10px;
					font-size: 20px;
					margin-right: 20px;" ></td>
				<td><input type="button" value="Exit" onclick="window.history.back()"></td></tr>
				</table>

			</form>

	</body>
</html>