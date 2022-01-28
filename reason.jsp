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
	<link rel="stylesheet" type="text/css" href="css/orderdet.css">
</head>
<body>
<%
int cid=Integer.parseInt(request.getParameter("orderid"));
String status=request.getParameter("status");

%>
	<form action="CustomerDeleteAction.jsp">
	<div class="box">
		<table align="center">	
				<tr>	<td>Order Id</td>
						<td><input type="text" value="<%=cid%>"  name="orderid" readonly="readonly"></td>
				</tr>
				<tr>
						<td>Status</td>
						<td><input type="text" value="<%=status%>"  name="Status" readonly="readonly"></td>	
				</tr>
				<tr>
						<td>Reason</td>
						<td><input type="text" name="reason"></td>	
				</tr>		</table>
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