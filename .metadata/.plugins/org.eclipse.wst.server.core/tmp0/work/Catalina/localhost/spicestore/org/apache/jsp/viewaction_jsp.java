/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-05-28 16:17:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class viewaction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Connection.jsp", Long.valueOf(1622217366315L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\t\t\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("<!DOCTYPE html >\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

Connection con=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","mysql");
	System.out.println("CONNECTION SUCCESSFULLY");
}catch (Exception e) 
{
	System.out.println("Error in connection "+e);
}
	

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\t\t");

		try{
			if((session.getAttribute("username")).equals(null)){
				request.getRequestDispatcher("LoginError.jsp").forward(request, response);
				}
		}catch(NullPointerException npe){
			npe.printStackTrace();
			
      out.write("\r\n");
      out.write("\t\t\t");
      if (true) {
        _jspx_page_context.forward("LoginError.jsp");
        return;
      }
      out.write("\r\n");
      out.write("\t\t\t");

			
		}
		
      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t\t");

		
		   int user=Integer.parseInt(session.getAttribute("username").toString());  
		
      out.write('\r');
      out.write('\n');


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


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
