<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp" %>
<%@ page isErrorPage="true" %>
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

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">

function Upclose()
{
	window.opener.location ="customerorders.jsp";
	window.close();
}

</script>
</head>
<body>
<%
try
{
	String on="oncart";
	int cid=Integer.parseInt(request.getParameter("orderid"));
	String status=request.getParameter("Status");
	String reason=request.getParameter("reason");
	System.out.println(status);
	if(status.equals(on))
	{
		String sql1="update orders set status='canceled', ddate=now(),reason=? where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setString(1,reason);
		ps.setInt(2,cid);
		if(ps.executeUpdate()>0)
		{  
			%>
			<script type="text/javascript">
			alert("Order Canceled");
			Upclose();
			</script>
			<%
		}
		else
		{
			
			%>
			<script type="text/javascript">
			alert("Sorry Order not Canceled");
			Upclose();
			</script>
			<%
		}
	}
	else if(status.equals("orderconfirmed"))
	{
		String sql1="update orders set status='canceled', ddate=now() where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setInt(1,cid);
		if(ps.executeUpdate()>0)
		{  
			String sql3="select a.pid,a.qty,b.pstock from cart a,product b where a.pid=b.pid and orderid=?";
			PreparedStatement ps2=con.prepareStatement(sql3);
			ps2.setInt(1,cid);
			ResultSet rs=ps2.executeQuery();
			while(rs.next())
			{	
				int qty=rs.getInt(2);
				int stk=rs.getInt(3);
				stk=stk+qty;
				String sql4="update product set pstock=? where pid=?";
				PreparedStatement ps4=con.prepareStatement(sql4);
				ps4.setInt(1,stk);
				ps4.setInt(2,rs.getInt(1));
				ps4.executeUpdate();
			}
			%>
			<script type="text/javascript">
			alert("Order Canceled");
			Upclose();
			</script>
			<%
		}
		else
		{
			
			%>
			<script type="text/javascript">
			alert("Sorry Order not Canceled");
			Upclose();
			</script>
			<%
		}
	}
	else if(status.equals("orderplaced"))
	{
		String sql1="update orders set status='canceled', ddate=now() where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setInt(1,cid);
		if(ps.executeUpdate()>0)
		{  
			%>
			<script type="text/javascript">
			alert("Order Canceled");
			Upclose();
			</script>
			<%
		}
		else
		{
			
			%>
			<script type="text/javascript">
			alert("Sorry Order not Canceled");
			Upclose();
			</script>
			<%
		}
	}
	else if(status.equals("delivered"))
	{
		
			%>
			<script type="text/javascript">
			alert("Order Is Delivered And Cannot Be Canceled");
			Upclose();
			</script>
			<%
	}
	else if(status.equals("orderrejected"))
	{
		
			%>
			<script type="text/javascript">
			alert("Order Is Rejected And Cannot Be Canceled");
			Upclose();
			</script>
			<%
	}
	else if(status.equals("canceled"))
	{
		
			%>
			<script type="text/javascript">
			alert("Order Is Already Canceled");
			Upclose();
			</script>
			<%
	}
	
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	%>
	</body>
	</html>