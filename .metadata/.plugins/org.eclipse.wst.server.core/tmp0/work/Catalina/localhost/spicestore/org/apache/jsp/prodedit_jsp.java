/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-05-28 16:16:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;

public final class prodedit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

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
      out.write("<html >\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>View Products </title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/prodedit.css\" type=\"text/css\" />\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("function popup(mylink, windowname)\r\n");
      out.write("{\r\n");
      out.write("var href;\r\n");
      out.write("if (typeof(mylink) == 'string')\r\n");
      out.write("href=mylink;\r\n");
      out.write("else\r\n");
      out.write("href=mylink.href;\r\n");
      out.write("edwindow=window.open(href, windowname, 'width=720,height=1000,scrollbars=yes,resizable=yes,left=400,top=50,addressbar=no,menubar=0, toolbar=no');\r\n");
      out.write("edwindow.top;\r\n");
      out.write("edwindow.focus();\r\n");
      out.write("return false;\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<p align=\"center\" class=\"p1\">View Products </p>\r\n");
      out.write("\r\n");
if(request.getParameter("msg") != null){
	out.println("<h4 align='center' style='color:#0093ff'> " + request.getParameter("msg"));		

} 
      out.write("\r\n");
      out.write("<table id=\"table\" border=3 cellspacing=5 align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Product ID</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Name</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">MRP</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Price</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Description</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Stock</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Edit</th>\r\n");
      out.write("\t<th style=\"color:white;font-size:25px;font-family:Times New Roman;font-style:italic;\">Delete</th>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\t<tr class=\"alt\">\t\r\n");
      out.write("\r\n");

String sql="select pid, pname, pmrp, pprice, pdesc, pstock from product ";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
if(rs.next())
{
	rs.previous();

while(rs.next())
{
	

      out.write("\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getInt(1) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getString(2) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getFloat(3) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getFloat(4) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getString(5) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">");
      out.print(rs.getInt(6) );
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\">\r\n");
      out.write("<a href=\"proddet.jsp?pid=");
      out.print(rs.getInt(1) );
      out.write("&pname=");
      out.print(rs.getString(2) );
      out.write("&pmrp=");
      out.print(rs.getFloat(3) );
      out.write("&pprice=");
      out.print(rs.getFloat(4) );
      out.write("&pdesc=");
      out.print(rs.getString(5) );
      out.write("&pstock=");
      out.print(rs.getInt(6) );
      out.write("\" onClick=\"return popup(this, 'notes')\" style=\"text-decoration:none; color:rgb(255, 255, 255);\">Edit</a>\r\n");
      out.write("</td>\r\n");
      out.write("<td align=\"center\" style=\"font-size:16px;\"><a href=\"AdminDeleteAction.jsp?pid=");
      out.print(rs.getInt(1));
      out.write("&frm=productform\" style=\"text-decoration:none; color:rgb(56, 245, 30);\">Delete</a></td>\r\n");
      out.write("</tr>\r\n");
}
}
else
{
	out.println("<h1 align='center' style='color:black'>No Product to display");
	
      out.write("\r\n");
      out.write("\t<!-- script>alert(\"No Data To Display\")</script -->\r\n");
      out.write("\t");
 
}


      out.write("\r\n");
      out.write("<tr><th colspan=8 align=\"center\"><input type=\"button\" value=\"Back To Home\" onclick=\"window.history.back()\"></th></tr>\r\n");
      out.write("</table>\r\n");
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
