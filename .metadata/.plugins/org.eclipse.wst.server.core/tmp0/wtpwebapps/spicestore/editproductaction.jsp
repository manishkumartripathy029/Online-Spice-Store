<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Connection.jsp" %>
<%@ page isErrorPage="true" %>
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
<script type="text/javascript">

function Upclose()
{
	window.opener.location ="prodedit.jsp";
	window.close();
}

</script>
</head>

<body>

<%
try
{

	int pid=Integer.parseInt(request.getParameter("pid"));
    String pname=request.getParameter("pname");
    float pmrp=Float.parseFloat(request.getParameter("pmrp"));
    float pprice=Float.parseFloat(request.getParameter("pprice"));
    String pdesc=request.getParameter("pdesc");
    int pstock=Integer.parseInt(request.getParameter("pstock"));
    int nstock=Integer.parseInt(request.getParameter("pnstock"));
    pstock=pstock+nstock;
String sql1="update product set pname=?,pmrp=?,pprice=?,pdesc=?,pstock=? where pid=?";
PreparedStatement ps=con.prepareStatement(sql1);
ps.setString(1,pname);
ps.setFloat(2,pmrp);
ps.setFloat(3,pprice);
ps.setString(4,pdesc);
ps.setInt(5,pstock);
ps.setInt(6,pid);
if(ps.executeUpdate()>0)
{  
	%>
	<script type="text/javascript">
	alert("Product Details Updated");
	Upclose();
	</script>
	<%
}
else
{
	
	%>
	<script type="text/javascript">
	alert("Sorry Product Details Not Updated");
	Upclose();
	</script>
	<%
}
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
</body>
</html>