/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-07-16 05:46:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class orderdrop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    java.lang.Throwable exception = org.apache.jasper.runtime.JspRuntimeLibrary.getThrowable(request);
    if (exception != null) {
      response.setStatus(javax.servlet.http.HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
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
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html >\r\n");
      out.write("<html >\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>Product </title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/Orderdrop.css\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("<script>\r\n");
      out.write("function call()\r\n");
      out.write("{\r\n");
      out.write("document.f1.action=\"admin.jsp\";\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("</script>\t\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"f1\" >\r\n");
      out.write("<p align=\"center\" class=\"para\">View Orders</p>\r\n");
      out.write("\t\t\t");

			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			
      out.write("\r\n");
      out.write("\t\t\t<table align=\"center\" border=1 cellspacing=10 cellpadding=8>\r\n");
      out.write("\t\t\t\t\t<tr>");

			String sql="select a.orderid,a.odate,b.cname,a.amt from orders a,customer b where a.cid=b.cid and a.status='orderplaced'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
				
			if(rs.next())
			{
				rs.previous();
				int i=0;
				while(rs.next()){
						i++;			
			
      out.write("\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a style=\"color: rgb(0,0,0);text-decoration:none \" title=\"Click here to view order details\" href=\"viewitems.jsp?&orderid=");
      out.print(rs.getInt(1));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t<span >Order Id :<span class=\"p1\">");
      out.print(rs.getInt(1));
      out.write("</span></span><br></br>\r\n");
      out.write("\t\t\t\t\t\t<span >Order Date :<span class=\"p1\">");
      out.print(rs.getString(2));
      out.write("</span></span><br></br>\r\n");
      out.write("\t\t\t            <span>Customer Name:<span class=\"p1\">");
      out.print(rs.getString(3));
      out.write("</span></span><br></br>\r\n");
      out.write("\t\t\t            <span>Amount :<span class=\"p1\">");
      out.print(rs.getFloat(4));
      out.write("</span></span><br></br>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a style=\"color: rgb(0,0,0); \" href=\"AdminDeleteAction.jsp?&orderid=");
      out.print(rs.getInt(1));
      out.write("&frm=confirm\"><span class=\"p2\">Confirm Order</span></a><br>\r\n");
      out.write("\t\t\t\t\t\t<a style=\"color: rgb(0,0,0); \" href=\"AdminDeleteAction.jsp?&orderid=");
      out.print(rs.getInt(1));
      out.write("&frm=reject\"><span class=\"p3\">Reject Order</span></a>\r\n");
      out.write("\t\t\t\t");
	if(i==4){
      out.write("</td></tr>");
}
				}
				
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t");
}
			else
			{
				out.println("<h1 align='center style='color:black'> No Orders To Display");
			}
			
			
      out.write("\r\n");
      out.write("\t\t\t<tr><th colspan=5 align=\"center\"><input type=\"submit\" value=\"Back To Home\" onclick=\"call()\"></th></tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
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
