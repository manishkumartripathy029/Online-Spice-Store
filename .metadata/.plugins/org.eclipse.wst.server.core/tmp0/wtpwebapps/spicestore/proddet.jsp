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
	<title>Edit Product Details</title>
	<link rel="stylesheet" type="text/css" href="css/proddet.css">
</head>
<script type="text/javascript" src="./js/ValidateForm.js"></script>
<body>
<%
String pid=request.getParameter("pid");
String pname=request.getParameter("pname");
String pmrp=request.getParameter("pmrp");
String pprice=request.getParameter("pprice");
String pdesc=request.getParameter("pdesc");
String pstock=request.getParameter("pstock");


%>
	<form action="editproductaction.jsp">
			<p align="center" class="p1">Edit Product Details</p>

	<div class="box">
		<table align="center">	
				<tr>	<td>Product Id</td>
						<td><input type="text" value="<%=pid%>"  name="pid" readonly="readonly"></td>
				</tr>
				<tr>
						<td>Product Name</td>
						<td><input type="text" value="<%=pname%>"  name="pname" readonly="readonly"></td>	
				</tr>
				<tr>
						<td>MRP</td>
						<td><input type="number" value="<%=pmrp%>"  name="pmrp" required="required"></td>	
				</tr>
				<tr>
						<td>Price</td>
						<td><input type="number" value="<%=pprice%>"  name="pprice" required="required"></td>	
				</tr>
				<tr>
						<td>Description</td>
						<td><input type="text" value="<%=pdesc%>"  name="pdesc" onkeyup="alpnum(this)" onkeydown="alpnum(this)" required="required"></td>	
				</tr>
				<tr>
						<td>Stock</td>
						<td><input type="text" value="<%=pstock%>"  name="pstock" readonly="readonly"></td>	
				</tr>
				<tr>
						<td>Add New Stock</td>
						<td><input type="number" value="0"  name="pnstock" required="required"></td>	
				</tr>
				<tr>
				<td>
					<button  value="" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(255, 0, 0);
					border-radius: 6px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				
				<td><input type="button" value="Exit" onclick="window.close()"></td></tr>
		</table>
	</div>

		
	</form>
</body>
</html>