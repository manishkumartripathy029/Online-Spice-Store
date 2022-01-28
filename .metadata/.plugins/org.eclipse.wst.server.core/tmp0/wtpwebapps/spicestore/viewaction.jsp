		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		    pageEncoding="ISO-8859-1"%>
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
		
		   int user=Integer.parseInt(session.getAttribute("username").toString());  
		%>
<%

try
{
	int i=0;
int prodid=Integer.parseInt(request.getParameter("prodid"));

String sql="select orderid from orders where cid=? and status='oncart'";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,user);
ResultSet rs=ps.executeQuery();


								if(rs.next())
								{
									int orderid=rs.getInt(1);
									PreparedStatement ps4=null;
									String sql4="select pid from cart where orderid=?";
									ps4 = con.prepareStatement(sql4);
									ps4.setInt(1,orderid);
									ResultSet rs4=ps4.executeQuery();
											while(rs4.next())
											{
												if(rs4.getInt(1)==prodid)
												{
													i=i+1;
													System.out.println(i);
												}
											
											}
									System.out.println(i);
										if(i==0)
										{
												int orderid2=rs.getInt(1);
												PreparedStatement ps1=null;
												String sql1="insert into cart (orderid,pid) values (?,?)";
												ps1 = con.prepareStatement(sql1);
												ps1.setInt(1,orderid2);
												ps1.setInt(2,prodid);
										
												if(ps1.executeUpdate()>0){
													
													response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Item Added To Cart");
													
												}else
												{
													response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Item Not Added To Cart");
													
												}
										}
										else
										{
											response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Item Already Exist");
										}
								}	
								else
								{
								PreparedStatement ps2=null;
								String sql2="insert into orders(odate,cid,ddate) values (now(),?,now())";
								ps2 = con.prepareStatement(sql2);
								ps2.setInt(1,user);
						
										if(ps2.executeUpdate()>0)
										{
											String sql3="select orderid from orders where cid=? and status='oncart'";
											PreparedStatement ps3=con.prepareStatement(sql3);
											ps3.setInt(1,user);
											ResultSet rs2=ps3.executeQuery();
												
												if(rs2.next())
												{
													int orderid1=rs2.getInt(1);
													PreparedStatement ps1=null;
													String sql1="insert into cart (orderid,pid) values (?,?)";
													ps1 = con.prepareStatement(sql1);
													ps1.setInt(1,orderid1);
													ps1.setInt(2,prodid);
								
													if(ps1.executeUpdate()>0)
													{
														
														response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Item Added To Cart");
													}else
													{
														response.sendRedirect("userviewproduct.jsp?&frm=Cartform&msg=Item Not Added To Cart");
												
													}
												}
		
	
										}
								}

	
}
catch(SQLException e)
{
	e.printStackTrace();
}

%>


</body>
</html>