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
</head>
<body>
<%
try
{
	String frm=request.getParameter("frm");
	if(frm.equalsIgnoreCase("employeeform"))
	{

		String prodid=request.getParameter("eid");
		String sql1="delete from employee where eid=?";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setString(1,prodid);
		if(ps.executeUpdate()>0)
		{
			response.sendRedirect("Empedit.jsp?msg=Employee Details  Deleted Successfully");
		}
		else
		{
			response.sendRedirect("Empedit.jsp?msg=Sorry Employee Details Not Deleted");
		}
	}
	else if(frm.equalsIgnoreCase("customerform"))
	{
			String userid=request.getParameter("cid");
			String sql1="delete from customer where cid=?";
			PreparedStatement ps=con.prepareStatement(sql1);
			ps.setString(1,userid);
			if(ps.executeUpdate()>0)
			{
				
				response.sendRedirect("cusedit.jsp?msg=Customer Details Deleted Successfully");
			}
			else
			{
				response.sendRedirect("cusedit.jsp?msg=Sorry Customer Details Not Deleted");
			}

			
	}
	else if(frm.equalsIgnoreCase("productform"))
	{
			String userid=request.getParameter("pid");
			String sql1="delete from product where pid=?";
			PreparedStatement ps=con.prepareStatement(sql1);
			ps.setString(1,userid);
			if(ps.executeUpdate()>0)
			{
				
				response.sendRedirect("prodedit.jsp?msg=Product Details Deleted Successfully");
			}
			else
			{
				response.sendRedirect("prodedit.jsp?msg=Sorry Product Details Not Deleted");
			}

			
	}
	else if(frm.equalsIgnoreCase("confirm"))
	{
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		String sql2="update orders set status='orderconfirmed', ddate=now() where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql2);
		ps.setInt(1,orderid);
		ps.executeUpdate();
		if(ps.executeUpdate()>0)
		{
			String sql3="select a.pid,a.qty,b.pstock from cart a,product b where a.pid=b.pid and orderid=?";
			PreparedStatement ps2=con.prepareStatement(sql3);
			ps2.setInt(1,orderid);
			ResultSet rs=ps2.executeQuery();
			while(rs.next())
			{	
				int qty=rs.getInt(2);
				int stk=rs.getInt(3);
				stk=stk-qty;
				String sql4="update product set pstock=? where pid=?";
				PreparedStatement ps4=con.prepareStatement(sql4);
				ps4.setInt(1,stk);
				ps4.setInt(2,rs.getInt(1));
				ps4.executeUpdate();
			}
			response.sendRedirect("orderdrop.jsp?msg=Order Confirmed");
		}
		else
		{
			response.sendRedirect("orderdrop.jsp?msg=Sorry Order Not Confirmed");
		}

	}
	else if(frm.equalsIgnoreCase("reject"))
	{
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		String sql2="update orders set status='orderrejected', ddate=now() where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql2);
		ps.setInt(1,orderid);
		ps.executeUpdate();
		if(ps.executeUpdate()>0)
		{
			
			response.sendRedirect("orderdrop.jsp?msg=Order Rejected");
		}
		else
		{
			response.sendRedirect("orderdrop.jsp?msg=Sorry Order Not Rejected");
		}


	}
	else if(frm.equalsIgnoreCase("upddelivery"))
	{
		int orderid=Integer.parseInt(request.getParameter("oid"));
		String sql2="update orders set status='delivered', ddate=now() where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql2);
		ps.setInt(1,orderid);
		ps.executeUpdate();
		if(ps.executeUpdate()>0)
		{
			
			response.sendRedirect("viewpendingorder.jsp?msg=Order Status Updated");
		}
		else
		{
			response.sendRedirect("viewpendingorder.jsp?msg=Sorry Order Status Not Updated");
		}


	}
	else if(frm.equalsIgnoreCase("cancel"))
	{
		int orderid=Integer.parseInt(request.getParameter("oid"));
		String sql2="delete from cart where orderid=?";
		PreparedStatement ps=con.prepareStatement(sql2);
		ps.setInt(1,orderid);
		if(ps.executeUpdate()>0)
		{
			String sql3="delete from orders where orderid=?";
			PreparedStatement ps1=con.prepareStatement(sql3);
			ps1.setInt(1,orderid);
			ps1.executeUpdate();
			response.sendRedirect("canceledorder.jsp?msg=Order Removed");
		}
		else
		{
			response.sendRedirect("canceledorder.jsp?msg=Order not Removed");
		}


	}
}

catch(Exception e)
{
	e.printStackTrace();
}

%>

</body>
</html>