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
    int pid=Integer.parseInt(request.getParameter("pid"));
    String pname=request.getParameter("pname");
    float pmrp=Float.parseFloat(request.getParameter("pmrp"));
    float pprice=Float.parseFloat(request.getParameter("pprice"));
    String pdesc=request.getParameter("pdesc");
    int pstock=Integer.parseInt(request.getParameter("pstock"));
   

    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project",
            "root", "mysql");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into product(pid, pname, pmrp, pprice, pdesc, pstock) values ('" + pid + "','" + pname + "','" + pmrp + "','" + pprice + "','" + pdesc + "','" + pstock + "')");
     response.sendRedirect("prodadd.jsp?&msg=Product Added");
%>