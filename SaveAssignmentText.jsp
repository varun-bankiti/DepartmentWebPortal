<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/cse?user=root&password=cse");
	PreparedStatement ps = null;
	String qry;
	String from=(String) session.getAttribute("user");//######################
	String course=(String) session.getAttribute("course");//######################
	String matter=request.getParameter("matter");//######################
	String fileName=request.getParameter("fileName");
	qry="select * from assignments";
	ps=con.prepareStatement(qry);
	ResultSet result=ps.executeQuery();
	int count=0;
	while(result.next())count++;
	String id="Assignment-"+(count+1);//######################
	
	qry="insert into assignments values(?,?,?,?,?,CURRENT_TIMESTAMP,?)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,matter);
	ps.setString(3,course);
	ps.setString(4,fileName);
	ps.setString(5,from);
	ps.setInt(6,1);
	try{int result1=ps.executeUpdate();
	out.println(result1);}
	catch(Exception e){out.println(e);}
	%>
