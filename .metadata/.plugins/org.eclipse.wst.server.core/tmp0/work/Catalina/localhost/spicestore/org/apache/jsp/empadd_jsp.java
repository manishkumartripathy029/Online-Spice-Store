/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.57
 * Generated at: 2021-07-16 05:44:19 UTC
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

public final class empadd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t\t<head>\r\n");
      out.write("\t\t\t<title>Add Employee</title>\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/empadd.css\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</head>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"./js/ValidateForm.js\"></script>\t\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<form action=\"empaddcode.jsp\">\r\n");
      out.write("\t\t<p align=\"center\" class=\"p1\">Add Employee</p>\r\n");
      out.write("\t\t");

			if(request.getParameter("msg") != null)
			{
			String msg=request.getParameter("msg");
				out.println("<p align='center' style='color:black'> "+request.getParameter("msg")+"</p>");
			}
			
      out.write("\r\n");
      out.write("\t\t\t<div class=\"box\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");

			String sql="select eid from employee";
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(sql);
						rs.last();
      out.write("\r\n");
      out.write("\t\t\t\t<table  >\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Employee Id</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"employeeid\" value=");
      out.print(rs.getInt(1)+1);
      out.write(" readonly=\"readonly\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>Password</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"password\" name=\"password\" onkeyup=\"alpnum(this)\" onkeydown=\"alpnum(this)\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Employee Name</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"employeename\" onkeyup=\"alp(this)\" onkeydown=\"alp(this)\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>Gender</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"radio\" name=\"gen\"  value=\"male\">Male<input type=\"radio\" name=\"gen\" value=\"female\">Female</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Address</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"4\"><textarea rows=\"5\" cols=\"30\" name=\"address\"> </textarea></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Mail Id</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"email\" name=\"mail\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>Adhaar Number</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" maxlength=12 name=\"adhaar\"  onkeyup=\"num(this)\" onkeydown=\"num(this)\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Designation</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"desg\" onkeyup=\"alp(this)\" onkeydown=\"alp(this)\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>Date Of Birth</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"date\" name=\"dob\" required=\"required\" ></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Salary</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"number\" name=\"salary\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>Phone Number</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" maxlength=10 name=\"phoneno\" onkeyup=\"num(this)\" onkeydown=\"num(this)\" required=\"required\" autocomplete=\"off\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<td>Employee Type</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"radio\" name=\"typ\" value=\"admin\">Admin</td><td><input type=\"radio\" name=\"typ\" value=\"office\">Employee</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<table align=\"center\" cellspacing=\"10\" >\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<button  style=\"width: 200px;\r\n");
      out.write("\t\t\t\t\theight: 40px;\r\n");
      out.write("\t\t\t\t\tborder: 2px solid rgb(56, 245, 30);\r\n");
      out.write("\t\t\t\t\tborder-radius: 2px;\r\n");
      out.write("\t\t\t\t\tfont-size: 20px;\r\n");
      out.write("\t\t\t\t\tmargin-right: 20px;\">Save</button>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"reset\" value=\"Clear\" style=\"width: 200px;\r\n");
      out.write("\t\t\t\t\theight: 40px;\r\n");
      out.write("\t\t\t\t\tborder: 2px solid rgb(56, 245, 30);\r\n");
      out.write("\t\t\t\t\tborder-radius: 2px;\r\n");
      out.write("\t\t\t\t\tfont-size: 20px;\r\n");
      out.write("\t\t\t\t\tmargin-right: 20px;\"></td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<td><input type=\"button\" value=\"Exit\" onclick=\"window.history.back()\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t</body>\r\n");
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
