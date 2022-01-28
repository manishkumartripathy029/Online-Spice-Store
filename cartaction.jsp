<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp"%>
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

</head>
<body>
<%
   String user=session.getAttribute("username").toString(); 



try {
	String []pid=request.getParameterValues("pid");
	String []qty=request.getParameterValues("qty");
	String []mrp=request.getParameterValues("subtotal");
	int orderid=Integer.parseInt(request.getParameter("orderid"));
	float amt=Float.parseFloat(request.getParameter("netamt"));

	String sql7="select b.refid,a.pstock from product a,cart b where b.pid=a.pid and b.orderid=?";
	PreparedStatement ps7=con.prepareStatement(sql7);
	ps7.setInt(1,orderid);
	ResultSet rs7=ps7.executeQuery();
	
	
	
	for(int i=0;i<pid.length;i++)
	{
		int a=Integer.parseInt(qty[i]);
		
				if (a!=0)
				{ 
					rs7.next();
				String sql8="update cart set qty=?,amt=? where refid=? && pid=?";
				PreparedStatement ps8=con.prepareStatement(sql8);
				ps8.setInt(1,Integer.parseInt(qty[i]));
				ps8.setFloat(2,Float.parseFloat(mrp[i]));
				ps8.setInt(3,rs7.getInt(1));
				ps8.setInt(4,Integer.parseInt(pid[i]));
				int j = ps8.executeUpdate();
				
			}
			
	}
			
			String sql9="update orders set status='orderplaced',amt=?, ddate=now() where orderid=?";
			PreparedStatement ps9=con.prepareStatement(sql9);
			ps9.setFloat(1,amt);
			ps9.setInt(2,orderid);
			int i2 = ps9.executeUpdate();
	
		response.sendRedirect("customer.jsp?&frm=cartaction&msg=Thank you for placing your order");
		
		
		
	}
		catch (Exception e) {
	
	e.printStackTrace();
}


%>

</body>
</html>