<%@ include file="Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
		<head>
			<title>Add Employee</title>
			<link rel="stylesheet" type="text/css" href="css/empadd.css">
			
		</head>
	<script type="text/javascript" src="./js/ValidateForm.js"></script>	
	<body>
		<form action="empaddcode.jsp">
		<p align="center" class="p1">Add Employee</p>
		<%
			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			%>
			<div class="box">
			
			<%
			String sql="select eid from employee";
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(sql);
						rs.last();%>
				<table  >
					<tr>
						<td>Employee Id</td>
						<td><input type="text" name="employeeid" value=<%=rs.getInt(1)+1%> readonly="readonly"></td>
						<td>Password</td>
						<td><input type="password" name="password" onkeyup="alpnum(this)" onkeydown="alpnum(this)" required="required" autocomplete="off"></td>
					</tr>
					<tr>
						<td>Employee Name</td>
						<td><input type="text" name="employeename" onkeyup="alp(this)" onkeydown="alp(this)" required="required" autocomplete="off"></td>
						<td>Gender</td>
						<td><input type="radio" name="gen"  value="male">Male<input type="radio" name="gen" value="female">Female</td>
						</tr>
					<tr>
						<td>Address</td>
						<td colspan="4"><textarea rows="5" cols="30" name="address"> </textarea></td>
					</tr>
					<tr>
						<td>Mail Id</td>
						<td><input type="email" name="mail" required="required" autocomplete="off"></td>
						<td>Adhaar Number</td>
						<td><input type="text" maxlength=12 name="adhaar"  onkeyup="num(this)" onkeydown="num(this)" required="required" autocomplete="off"></td>
					</tr>
					<tr>
						<td>Designation</td>
						<td><input type="text" name="desg" onkeyup="alp(this)" onkeydown="alp(this)" required="required" autocomplete="off"></td>
						<td>Date Of Birth</td>
						<td><input type="date" name="dob" required="required" ></td>
					</tr>
					<tr>
						<td>Salary</td>
						<td><input type="number" name="salary" required="required" autocomplete="off"></td>
						<td>Phone Number</td>
						<td><input type="text" maxlength=10 name="phoneno" onkeyup="num(this)" onkeydown="num(this)" required="required" autocomplete="off"></td>
						</tr>
						<tr>
							
						<td>Employee Type</td>
						<td><input type="radio" name="typ" value="admin">Admin</td><td><input type="radio" name="typ" value="office">Employee</td>
						</tr>
				</table>
			</div>

				<table align="center" cellspacing="10" >
					<tr>
				<td>
					<button  style="width: 200px;
					height: 40px;
					border: 2px solid rgb(56, 245, 30);
					border-radius: 2px;
					font-size: 20px;
					margin-right: 20px;">Save</button>
				</td>
				<td><input type="reset" value="Clear" style="width: 200px;
					height: 40px;
					border: 2px solid rgb(56, 245, 30);
					border-radius: 2px;
					font-size: 20px;
					margin-right: 20px;"></td>

				<td><input type="button" value="Exit" onclick="window.history.back()"></td></tr>
				</table>
	</form>
	</body>
</html>