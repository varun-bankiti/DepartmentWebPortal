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
	String fileName=request.getParameter("fileName");//######################
	qry="select * from resources";
	ps=con.prepareStatement(qry);
	ResultSet result=ps.executeQuery();
	int count=0;
	while(result.next())count++;
	String id="resource-"+(count+1);//######################
	
	qry="insert into resources values(?,?,?,?,CURRENT_TIMESTAMP,?)";
	ps=con.prepareStatement(qry);
	ps.setString(1,id);
	ps.setString(2,course);
	ps.setString(3,fileName);
	ps.setString(4,from);
	ps.setString(5,matter);
	try{int result1=ps.executeUpdate();
	out.println(result1);}
	catch(Exception e){out.println(e);}
	%>
