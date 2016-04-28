<%@ page import="java.sql.*"%>
<%
try{
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String id=request.getParameter("id");
	String user=(String)session.getAttribute("user");
	String fileName=(String)request.getParameter("fileName");
	String course=(String)session.getAttribute("course");
	qry="insert into assignment_submits values(?,?,?,CURRENT_TIMESTAMP)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,user);
	ps.setString(3,fileName);
	int result=ps.executeUpdate();
	out.println(result);
}
catch(Exception e){out.println(e);}

%>

