<%@ include file="Connection.jsp" %>
<%@ page import="java.sql.*" %>
<html>
		<head>
			<title>Registration</title>
			<link rel="stylesheet" type="text/css" href="css/cusadd.css">
			
		</head>
	<body>
		<form  action="Regaction.jsp">
			<p align="center" class="p1">Registration</p>
			<div class="box" align="center">
			<%
			String sql="select cid from customer";
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(sql);
						rs.last();%>
				
				<table>
				<tr><td colspan="4">*Please remember customer id and password for login</td></tr>
					<tr>
						<td>Customer Id </td>
						<td><input type="text" name="customerid" value=<%=rs.getInt(1)+1%>></td>
						<td>Password</td>
						<td><input type="Password" name="password"></td>
					</tr>
					<tr>
						<td>Customer Name</td>
						<td><input type="text" name="customername"></td>
						<td>Phone Number</td>
						<td><input type="text" name="phoneno" maxlength="10"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td colspan="4"><textarea rows="5" cols="30" name="address"> </textarea></td>
					</tr>
					<tr>
						<td>Mail Id</td>
						<td><input type="mail" name="mail" ></td>
						<td>Adhaar Number</td>
						<td><input type="text" name="adhaar" maxlength="12"></td>
					</tr>
					<tr>
						<td>GST Number</td>
						<td><input type="text" name="gstin" ></td>
						<td>Date Of Creation</td>
						<td><input type="date" name="doc"></td>
					</tr>
				</table>
			</div>
				<table align="center" cellspacing="10" >
					<tr>
				<td>
					<button  value="cusadd" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(69, 30, 245);
					border-radius: 15px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				<td><input type="reset" value="Clear" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(69, 30, 245);
					border-radius: 15px;
					font-size: 20px;
					margin-right: 20px;" ></td>
				<td><input type="button" value="Exit" onclick="window.history.back()"></td></tr>
				</table>

			</form>

	</body>
</html>