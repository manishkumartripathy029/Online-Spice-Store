<%@ page import ="java.sql.*" %>
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
<%
    int id=Integer.parseInt(request.getParameter("employeeid"));
    String pass=request.getParameter("password");
    String name=request.getParameter("employeename");
    String phno=request.getParameter("phoneno");
    String addr=request.getParameter("address");
    String mail=request.getParameter("mail");
    String adhar=request.getParameter("adhaar");
    String desg=request.getParameter("desg");
    String date=request.getParameter("dob");
    String sal=request.getParameter("salary");
    String gen=request.getParameter("gen");
    String type=request.getParameter("typ");
    
    
    

    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project",
            "root", "mysql");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into employee(eid, ename, eaddress, email, edesg, esal, epass, egen, eadhar, edob, eph, etype) values ('" + id + "','" + name + "','" + addr + "','" + mail + "','" + desg + "','" + sal + "','" + pass + "','" + gen + "','"+ adhar + "','"+ date + "','" + phno + "','"  + type + "')");
     response.sendRedirect("empadd.jsp?&msg=Employee Added");
%>