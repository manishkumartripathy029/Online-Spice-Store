<!DOCTYPE html>
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
<html>
<head>
	<title>Edit Customer Details</title>
	<link rel="stylesheet" type="text/css" href="css/cusdet.css">
</head>
<script type="text/javascript" src="./js/ValidateForm.js"></script>
<body>
<%
String cid=request.getParameter("cid");
String phno=request.getParameter("phone");
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String address=request.getParameter("address");


%>
	<form action="editcustomeraction.jsp" method="post">
			<p align="center" class="p1">Edit Customer Details</p>

	<div class="box">
		<table align="center">	
				<tr>	<td>Customer Id</td>
						<td><input type="text" value="<%=cid%>"  name="cid" readonly="readonly"></td>
				</tr>
				<tr>
						<td>Phone Number</td>
						<td><input type="text" value="<%=phno%>"  name="phone" maxlength=10  onkeyup="num(this)" onkeydown="num(this)" required="required"></td>	
				</tr>
				<tr>
						<td>Address</td>
						<td><input type="text" value="<%=address%>"  name="address" required="required"></td>	
				</tr>
				<tr>
						<td>Mail</td>
						<td><input type="email" value="<%=email%>"  name="mail" required="required"></td>	
				</tr>
				<tr>
						<td>Password</td>
						<td><input type="password" value="<%=pass%>"  name="pass" style="
						width: 300px;
						height: 40px;
						border: 2px solid rgb(69, 30, 245);
						border-radius: 25px;
						font-size: 20px;
						text-align: center;" onkeyup="alpnum(this)" onkeydown="alpnum(this)" required="required"></td>	
				</tr>
		</table>
	</div>

		<table align="center" cellspacing="10">
					<tr>
				<td>
					<button  value="" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(69, 30, 245);
					border-radius: 10px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				
				<td><input type="button" value="Exit" onclick="window.close()"></td></tr>
		</table>
	</form>
</body>
</html>