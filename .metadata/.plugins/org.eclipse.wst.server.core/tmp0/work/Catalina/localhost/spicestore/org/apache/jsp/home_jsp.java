/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-05-28 16:11:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>\r\n");
      out.write("Home Page</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t<div class=\"title\">\r\n");
      out.write("\t\t\t<center><p>Online Spices Store</p></center>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"main\">\r\n");
      out.write("\t\t\t<ul align=\"center\">\r\n");
      out.write("\t\t\t<li><div class=\"logo\">\r\n");
      out.write("\t\t\t<img src=\"image/chilli.jpg\">\r\n");
      out.write("\t\t\t</div></li>\r\n");
      out.write("\t\t\t<li><a href=\"userviewproduct.jsp\">Product</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"custlogin.jsp\">Customer</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"adminlogin.jsp\">Admin</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"tandc.jsp\">Terms and Conditions</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"Aboutus.jsp\">About Us</a></li>\r\n");
      out.write("\t\t\t<li><div class=\"logo1\">\r\n");
      out.write("\t\t\t<img src=\"image/chilli.jpg\">\r\n");
      out.write("\t\t\t\t\t\t</div></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("\t");

			if(request.getParameter("msg") != null)
			{
			String frm=request.getParameter("frm");
			String msg=request.getParameter("msg");
			if(frm.equalsIgnoreCase("loginerr"))
			{
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			if(frm.equalsIgnoreCase("logout"))
			{
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			}
			
      out.write("\r\n");
      out.write("\t\t<img src=\"image/spice.jpg\" height=640 width=1580>\r\n");
      out.write("\t<footer>\r\n");
      out.write("\t<marquee>We Accept Orders All Over Bangalore And No Delivery Charges will be Levied On Customer</marquee>\r\n");
      out.write("\t<div align=\"center\" style=background-color:#FAD7A0>\r\n");
      out.write("<table cellspacing=15>\r\n");
      out.write("<tr>\r\n");
      out.write("<td rowspan=4><img src=\"image/location.JPG\" height=130 width=60></td><td>Online Spices Store</td><td></td><td></td><td></td><td></td>\r\n");
      out.write("<td>Email :info@Darbar.com</td></tr><tr><td>No 91, 11th cross</td><td></td><td></td><td></td><td></td>\r\n");
      out.write("<td>Web:www.masaladarbar.com</td></tr><tr><td>Shanthinagar</td><td></td><td></td><td></td><td></td>\r\n");
      out.write("<td>Contact:080-800000000</td></tr><tr><td>Bangalore-560000</td></tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("<table align=\"center\">\r\n");
      out.write("<tr><td colspan=2>© All Rights Reserved</td></tr>\r\n");
      out.write("</table>\r\n");
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