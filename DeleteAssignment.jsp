<%@ page import="java.sql.*"%>
<%
try{
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String id=request.getParameter("id");
	qry="update assignments set display=0 where assignment_id=?";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	int result=ps.executeUpdate();
	out.println(result);
}
catch(Exception e){out.println(e);}

%>
