/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-05-28 16:17:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class cartaction_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');
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
      out.write('\r');
      out.write('\n');

try{
	if((session.getAttribute("username")).equals(null)){
		request.getRequestDispatcher("LoginError.jsp").forward(request, response);
		}
}catch(NullPointerException npe){
	npe.printStackTrace();
	
      out.write('\r');
      out.write('\n');
      out.write('	');
      if (true) {
        _jspx_page_context.forward("LoginError.jsp");
        return;
      }
      out.write('\r');
      out.write('\n');
      out.write('	');

	
}

      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

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
