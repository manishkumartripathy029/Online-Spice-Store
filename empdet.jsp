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
<html>
<head>
	<title>Edit Employee Details</title>
	<link rel="stylesheet" type="text/css" href="css/empdet.css">
</head>
<script type="text/javascript" src="./js/ValidateForm.js"></script>
<body>
<%
String eid=request.getParameter("eid");
String phno=request.getParameter("phone");
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String address=request.getParameter("address");


%>
	<form action="editemployeeaction.jsp">
			<p align="center" class="p1">Edit Employee Details</p>

	<div class="box">
		<table align="center">	
				<tr>	<td>Employee Id</td>
						<td><input type="text" value="<%=eid%>"  name="eid" readonly="readonly"></td>
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
						border: 2px solid rgb(56, 245, 30);
						border-radius: 2px;
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
					border: 2px solid rgb(56, 245, 30);
					border-radius: 2px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				
				<td><input type="button" value="Exit" onclick="window.close()"></td></tr>
		</table>
	</form>
</body>
</html>