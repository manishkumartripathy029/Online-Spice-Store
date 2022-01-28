<%@ page import ="java.sql.*" %>

<%
    int id=Integer.parseInt(request.getParameter("customerid"));
    String pass=request.getParameter("password");
    String name=request.getParameter("customername");
    String phno=request.getParameter("phoneno");
    String addr=request.getParameter("address");
    String mail=request.getParameter("mail");
    String adhar=request.getParameter("adhaar");
    String gstin=request.getParameter("gstin");
    String frm=request.getParameter("frm");
    

    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project",
            "root", "mysql");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into customer(cid, cname, caddress, cmail, cgst, cpass, cph, cadhar) values ('" + id + "','" + name + "','" + addr + "','" + mail + "','" + gstin + "','" + pass + "','" + phno + "','" + adhar + "')");
    	response.sendRedirect("cusadd.jsp?&msg=Customer Added");
     
%>